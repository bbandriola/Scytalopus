## =========================================================================
## ADMIXTOOLS 2
## =========================================================================

library(admixtools)
library(dplyr)
library(purrr)

## -------------------------------------------------------------------------
## 0. Setup
## -------------------------------------------------------------------------
base_dir     <- "/media/labgenoma5/DATAPART3/bandriola/Scytalopus/Admixtools"
raw_data_dir <- file.path(base_dir, "m0-6_Snovacapitalis_outgroup")  # where the .geno/.ind/.snp files actually live
setwd(base_dir)
prefix   <- file.path(raw_data_dir,"50repsmodels_LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis")
outgroup <- "Snovacapitalis"

## f2_dir: directory dedicated ONLY to admixtools2's f2 data.
outd <- file.path(base_dir, "m0-6_Snovacapitalis_outgroup_f2data_clean")
dir.create(outd, showWarnings = FALSE)

## results_dir
results_dir <- file.path(base_dir, "find_graphs_results")
dir.create(results_dir, showWarnings = FALSE)

## -------------------------------------------------------------------------
## 1a. Extract f2 data into the clean f2_dir (outd), then load it once.
## -------------------------------------------------------------------------
if (length(list.dirs(outd, recursive = FALSE)) == 0) {
  message("Extracting f2 data into a clean directory...")
  extract_f2(prefix, outd, auto_only = FALSE, overwrite = TRUE)
} else {
  message("f2 data already present in outd -- skipping extract_f2()")
}

message("Loading f2 data...")
f2_blocks <- f2_from_precomp(outd)

## -------------------------------------------------------------------------
## 1b. Run find_graphs() for every number of migrations (m = 0..6),
##    several independent replicate runs per m (1 rep for m=0, 3 reps for
##    m=1..6), SEQUENTIALLY.
## -------------------------------------------------------------------------
mig_range   <- 0:6
reps_per_m  <- setNames(rep(50, length(mig_range)), as.character(mig_range))
# ^ bumped up from the original 1/3 replicates -- each run is cheap to
#   store (one row, not the full search history), so more replicates gives
#   a more solid candidate pool per the paper's up-to-200-per-m approach.

run_one_job <- function(m, rep) {
  rds_path <- file.path(results_dir, sprintf("find_graphs_m%d_run%d.rds", m, rep))

  if (file.exists(rds_path)) {
    cached <- readRDS(rds_path)
    if (nrow(cached) > 1) {
      message(sprintf("m = %d, run %d: cached file has %d rows (old format) -- reducing to winner", m, rep, nrow(cached)))
      cached <- cached %>% slice_min(score, with_ties = FALSE)
      saveRDS(cached, rds_path)
    } else {
      message(sprintf("m = %d, run %d: loading existing result from disk", m, rep))}
    return(cached)}
  message(sprintf("m = %d, run %d: running find_graphs()", m, rep))
  res <- tryCatch(
    {
      full <- find_graphs(
        f2_blocks, outpop = outgroup, numadmix = m,
        stop_gen2 = 1000, numgraphs = 100,
        plusminus_generations = 20,
        verbose = FALSE)   # keep FALSE in parallel runs
      full %>% slice_min(score, with_ties = FALSE)
    },
    error = function(e) {
      message(sprintf("m = %d, run %d: FAILED -- %s", m, rep, conditionMessage(e)))
      e})
  if (!inherits(res, "error")) saveRDS(res, rds_path)
  res}
max_threads <- 25
n_cores <- max(1, min(max_threads, parallel::detectCores() - 2))
message(sprintf("Using %d parallel workers (cap = %d)", n_cores, max_threads))

jobs <- purrr::map_dfr(mig_range, function(m) {
  tibble(m = m, rep = seq_len(reps_per_m[[as.character(m)]]))
})

job_results <- parallel::mclapply(
  seq_len(nrow(jobs)),
  function(i) run_one_job(jobs$m[i], jobs$rep[i]),
  mc.cores = n_cores,
  mc.set.seed = TRUE
)

failed <- which(sapply(job_results, function(x) inherits(x, "error")))
if (length(failed) > 0) {
  for (i in failed) {
    message(sprintf("Job failed: m = %d, run %d -- %s",
                     jobs$m[i], jobs$rep[i], conditionMessage(job_results[[i]])))
  }
  stop(sprintf("%d job(s) failed -- see messages above. Completed jobs are cached on disk and will be skipped on rerun.", length(failed)))
}
rm(job_results)  # discard deliberately -- never used again; everything below rereads from disk

requested_m_all <- list()   # keeps track of which numadmix each run targeted, for reference/QC only
all_candidates  <- list()
counter <- 1
for (m in mig_range) {
  n_reps <- reps_per_m[[as.character(m)]]
  for (r in seq_len(n_reps)) {
    res <- readRDS(file.path(results_dir, sprintf("find_graphs_m%d_run%d.rds", m, r)))
    all_candidates[[counter]] <- res
    requested_m_all[[counter]] <- m
    counter <- counter + 1
  }
}
all_candidates <- bind_rows(all_candidates)
message(sprintf("Pooled %d candidate graphs (one per independent find_graphs() run) across all requested m values.", nrow(all_candidates)))

## -------------------------------------------------------------------------
## 2. Deduplicate by ACTUAL graph topology
## -------------------------------------------------------------------------
nadmix <- function(edges_df) sum(edges_df$type == "admix") / 2

message("Deduplicating identical topologies by graph hash...")
igraphs <- lapply(all_candidates$edges, edges_to_igraph)
hashes  <- sapply(igraphs, graph_hash)

n_before <- nrow(all_candidates)
keep <- !duplicated(hashes)
all_candidates <- all_candidates[keep, ]
message(sprintf("Kept %d unique topologies out of %d candidates", nrow(all_candidates), n_before))

all_candidates$nadmix_actual <- sapply(all_candidates$edges, nadmix)

# order by score (best first), matching the reference script
all_candidates <- all_candidates[order(all_candidates$score), ]

print(all_candidates %>% select(nadmix_actual, score))
write.csv(
  all_candidates %>% select(nadmix_actual, score),
  file.path(results_dir, "unique_candidates_summary.csv"),
  row.names = FALSE
)

saveRDS(all_candidates, file.path(results_dir, "all_candidates_deduped.rds"))

## -------------------------------------------------------------------------
## 3. f2_blocks already loaded in step 1a
## -------------------------------------------------------------------------
nboot <- 100

message(sprintf("Bootstrapping all %d unique candidate graphs...", nrow(all_candidates)))
fits_all <- qpgraph_resample_multi(f2_blocks, all_candidates$edges, nboot = nboot) # STOPPED HERE

n_cand <- nrow(all_candidates)
pairwise_list <- list()
counter <- 1
for (i in seq_len(n_cand - 1)) {
  for (j in (i + 1):n_cand) {
    cmp <- compare_fits(fits_all[[i]]$score_test, fits_all[[j]]$score_test)
    # field name varies slightly across admixtools2 versions ($p vs $p_emp)
    p_val <- if (!is.null(cmp$p_emp)) cmp$p_emp else cmp$p

    pairwise_list[[counter]] <- data.frame(
      idx1        = i,
      idx2        = j,
      nadmix1     = all_candidates$nadmix_actual[i],
      nadmix2     = all_candidates$nadmix_actual[j],
      score1      = all_candidates$score[i],
      score2      = all_candidates$score[j],
      p           = p_val,
      diff        = cmp$diff,
      ci_low      = cmp$ci_low,
      ci_high     = cmp$ci_high
    )
    counter <- counter + 1
  }
}
pairwise_df <- do.call(rbind, pairwise_list)
write.table(pairwise_df, file = file.path(results_dir, "pairwise_comparisons.tsv"),
            quote = FALSE, col.names = TRUE, row.names = FALSE, sep = "\t")
print(pairwise_df)

## -------------------------------------------------------------------------
## 4. Suggest a final model from the pairwise table: for each ACTUAL
##    migration count present among the unique candidates, take its best
##    (lowest-score) graph, then walk up from the smallest migration count
##    and stop at the first step where the increase is NOT significant
##    (p > 0.05) -- i.e. the simplest graph that cannot be beaten.
##    This reuses the pairwise comparisons already computed above; it does
##    not rerun any bootstrapping.
## -------------------------------------------------------------------------
best_per_nadmix <- all_candidates %>%
  group_by(nadmix_actual) %>%
  slice_min(score, with_ties = FALSE) %>%
  ungroup() %>%
  arrange(nadmix_actual)

print(best_per_nadmix %>% select(nadmix_actual, score))

nadmix_levels <- best_per_nadmix$nadmix_actual
chosen_nadmix <- nadmix_levels[length(nadmix_levels)]  # fallback: most complex tested

find_row_index <- function(target_score) which(all_candidates$score == target_score)[1]

for (i in seq_len(length(nadmix_levels) - 1)) {
  idx_lo <- find_row_index(best_per_nadmix$score[i])
  idx_hi <- find_row_index(best_per_nadmix$score[i + 1])
  row <- pairwise_df[
    (pairwise_df$idx1 == min(idx_lo, idx_hi) & pairwise_df$idx2 == max(idx_lo, idx_hi)),
  ]
  if (nrow(row) == 0) next  # shouldn't happen, but guard anyway
  message(sprintf("nadmix=%d vs nadmix=%d -> p = %.4g",
                   nadmix_levels[i], nadmix_levels[i + 1], row$p[1]))
  if (row$p[1] > 0.05) {
    chosen_nadmix <- nadmix_levels[i]
    break
  }
}

message(sprintf("Best-supported model: nadmix = %d", chosen_nadmix))
saveRDS(chosen_nadmix, file.path(results_dir, "chosen_nadmix.rds"))

chosen_graph <- all_candidates %>%
  filter(nadmix_actual == chosen_nadmix) %>%
  slice_min(score, with_ties = FALSE)

saveRDS(chosen_graph$edges[[1]], file.path(results_dir, "chosen_graph.rds"))
pdf(file.path(results_dir, sprintf("%s-CHOSEN_MODEL_nadmix%d.pdf", basename(prefix), chosen_nadmix)),
    width = 10, height = 8)
print(plot_graph(chosen_graph$edges[[1]], textsize = 6))
dev.off()
