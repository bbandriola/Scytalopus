library("admixtools")
library("dplyr")

setwd("~/Scytalopus/vcffiles/FinalVCFs")
prefix ="Thinned1000_maxmissin0.7_FilteredPCAandUCEandOtherspecies_FilteredMax30missingDepthmin5_GeographicNames_allsamples"
outd = "~/Scytalopus/Admixtools/onlyspeluncae"

extract_f2(prefix, outd,auto_only = FALSE,overwrite=T)

########################################
# 4 migration, 1 run
aab.1m4 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m4 = aab.1m4 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m4$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m4.svg")
plot_graph(winnerb.1m4$edges[[1]], textsize=6)
dev.off()
# 4 migration, 2 run
aab.2m4 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m4 = aab.2m4 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m4$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m4.svg")
plot_graph(winnerb.2m4$edges[[1]], textsize=6)
dev.off()
# 4 migration, 3 run
aab.3m4 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m4 = aab.3m4 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m4$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m4.svg")
plot_graph(winnerb.3m4$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 5 migration, 1 run
aab.1m5 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m5 = aab.1m5 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m5$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m5.svg")
plot_graph(winnerb.1m5$edges[[1]], textsize=6)
dev.off()
# 5 migration, 2 run
aab.2m5 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m5 = aab.2m5 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m5$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m5.svg")
plot_graph(winnerb.2m5$edges[[1]], textsize=6)
dev.off()
# 5 migration, 3 run
aab.3m5 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m5 = aab.3m5 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m5$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m5.svg")
plot_graph(winnerb.3m5$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 6 migration, 1 run
aab.1m6 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m6 = aab.1m6 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m6$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m6.svg")
plot_graph(winnerb.1m6$edges[[1]], textsize=6)
dev.off()
# 6 migration, 2 run
aab.2m6 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m6 = aab.2m6 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m6$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m6.svg")
plot_graph(winnerb.2m6$edges[[1]], textsize=6)
dev.off()
# 6 migration, 3 run
aab.3m6 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m6 = aab.3m6 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m6$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m6.svg")
plot_graph(winnerb.3m6$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 7 migration, 1 run
aab.1m7 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m7 = aab.1m7 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m7$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m7.svg")
plot_graph(winnerb.1m7$edges[[1]], textsize=6)
dev.off()
# 7 migration, 2 run
aab.2m7 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m7 = aab.2m7 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m7$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m7.svg")
plot_graph(winnerb.2m7$edges[[1]], textsize=6)
dev.off()
# 7 migration, 3 run
aab.3m7 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m7 = aab.3m7 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m7$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m7.svg")
plot_graph(winnerb.3m7$edges[[1]], textsize=6)
dev.off()
########################################
