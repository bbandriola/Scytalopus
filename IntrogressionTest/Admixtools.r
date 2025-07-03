# source https://uqrmaie1.github.io/admixtools/articles/admixtools.html
# convert vcf to eign with python vcf2eigenstrat.py from https://github.com/mathii/gdc/blob/master/vcf2eigenstrat.py respositorio 
# py27
# python vcf2eigenstrat.py -v vcf_file.vcf(.gz) -o out_root
# the script above generates root.snp, root.ind and root.geno and the .ind POPS column should be change to pop labels
# About ADMIXTOOLS2: "run findGraphs allowing between zero and eight admixture events (100 algorithm iterations per graph complexity class), saving one or a few best-fitting 
#                     AGs after each iteration. The smallest number of admixture events that yields models where the (negative) LL score or the worst f-statistic residual is 
#                     lower than some threshold can then be explored more deeply by running more iterations of findGraphs"
#                     "...repeated until one or more graphs with an acceptable LL score or worst residual has been identified. At this stage, apply the bootstrap method to 
#                     determine whether the best-fitting graph is significantly better than the next best-fitting graph. If it is not, identify a set of graphs which are not 
#                     clearly worse than the best-fitting graph by performing bootstrap model comparison for many model pairs."

list.of.packages <- c("admixtools", "tidyverse","dplyr","rlang","doParallel","visNetwork")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, library, character.only = TRUE) 

setwd("~/Scytalopus/vcffiles/FinalVCFs")
prefix ="Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples"
outd = "~/Scytalopus/Admixtools/m123"

extract_f2(prefix, outd,auto_only = FALSE,overwrite=T)

# A good model should fit all 𝑓3-statistics, and have a score close to zero
# 0 migration, 1 run
aab.1m0 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 0,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m0 = aab.1m0 %>% slice_min(score, with_ties = FALSE)
# plot
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m0.svg")
plot_graph(winnerb.1m0$edges[[1]], textsize=6)
dev.off()

########################################
# 1 migration, run1
aab.1m1 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m1 = aab.1m1 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m1$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m1.svg")
plot_graph(winnerb.1m1$edges[[1]], textsize=6)
dev.off()
# run 2
aab.2m1 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m1 = aab.2m1 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m1$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m1.svg")
plot_graph(winnerb.2m1$edges[[1]], textsize=6)
dev.off()
# run 3
aab.3m1 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m1 = aab.3m1 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m1$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m1.svg")
plot_graph(winnerb.3m1$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 2 migration, 1 run
aab.1m2 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m2 = aab.1m2 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m2$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m2.svg")
plot_graph(winnerb.1m2$edges[[1]], textsize=6)
dev.off()
# 2 migration, 2 run
aab.2m2 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m2 = aab.2m2 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m2$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m2.svg")
plot_graph(winnerb.2m2$edges[[1]], textsize=6)
dev.off()
# 2 migration, 3 run
aab.3m2 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m2 = aab.3m2 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m2$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m2.svg")
plot_graph(winnerb.3m2$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 3 migration, 1 run
aab.1m3 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m3 = aab.1m3 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m3$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m3.svg")
plot_graph(winnerb.1m3$edges[[1]], textsize=6)
dev.off()
# 3 migration, 2 run
aab.2m3 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m3 = aab.2m3 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m3$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m3.svg")
plot_graph(winnerb.2m3$edges[[1]], textsize=6)
dev.off()
# 3 migration, 3 run
aab.3m3 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m3 = aab.3m3 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m3$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m3.svg")
plot_graph(winnerb.3m3$edges[[1]], textsize=6)
dev.off()
########################################

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
