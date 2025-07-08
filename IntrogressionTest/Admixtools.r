# source https://uqrmaie1.github.io/admixtools/articles/admixtools.html
# convert vcf to eign with python vcf2eigenstrat.py from https://github.com/mathii/gdc/blob/master/vcf2eigenstrat.py respositorio 
# py27
# python vcf2eigenstrat.py -v vcf_file.vcf(.gz) -o out_root
# python ../../../Softwares/gdc/vcf2eigenstrat.py -v Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz.recode.vcf.gz -o Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples
# the script above generates root.snp, root.ind and root.geno and the .ind POPS column should be change to pop labels
# About ADMIXTOOLS2: "run findGraphs allowing between zero and eight admixture events (100 algorithm iterations per graph complexity class), saving one or a few best-fitting 
#                     AGs after each iteration. The smallest number of admixture events that yields models where the (negative) LL score or the worst f-statistic residual is 
#                     lower than some threshold can then be explored more deeply by running more iterations of findGraphs"
#                     "...repeated until one or more graphs with an acceptable LL score or worst residual has been identified. At this stage, apply the bootstrap method to 
#                     determine whether the best-fitting graph is significantly better than the next best-fitting graph. If it is not, identify a set of graphs which are not 
#                     clearly worse than the best-fitting graph by performing bootstrap model comparison for many model pairs."

library("admixtools")
library("dplyr")

setwd("~/Scytalopus/vcffiles/FinalVCFs")
prefix ="Thinned1000_maxmissin0.7_FilteredPCAandUCEandOtherspecies_FilteredMax30missingDepthmin5_GeographicNames_allsamples"
outd = "~/Scytalopus/Admixtools/onlyspeluncae/m0123"

extract_f2(prefix, outd,auto_only = FALSE,overwrite=T)

# to run and save the models 
setwd("~/Scytalopus/Admixtools/onlyspeluncae/m0123")

# 0 mig
# A good model should fit all 𝑓3-statistics, and have a score close to zero
# 0 migration, 1 run
aab.1m0 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 0,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m0 = aab.1m0 %>% slice_min(score, with_ties = FALSE)
# plot and score
write.csv(winnerb.1m0$score[[1]], file = "aab.1m0.txt")
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCEandOtherspecies_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m0.svg")
plot_graph(winnerb.1m0$edges[[1]], textsize=6)
dev.off()

########################################
# 1 migration, run1
aab.1m1 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m1 = aab.1m1 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.1m1$score[[1]], file = "aab.1m1.txt")
plot_graph(winnerb.1m1$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m1.svg")
plot_graph(winnerb.1m1$edges[[1]], textsize=6)
dev.off()
# run 2
aab.2m1 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m1 = aab.2m1 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.2m1$score[[1]], file = "aab.2m1.txt")
plot_graph(winnerb.2m1$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m1.svg")
plot_graph(winnerb.2m1$edges[[1]], textsize=6)
dev.off()
# run 3
aab.3m1 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m1 = aab.3m1 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.3m1$score[[1]], file = "aab.3m1.txt")
plot_graph(winnerb.3m1$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m1.svg")
plot_graph(winnerb.3m1$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 2 migration, 1 run
aab.1m2 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m2 = aab.1m2 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.1m2$score[[1]], file = "aab.1m2.txt")
plot_graph(winnerb.1m2$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m2.svg")
plot_graph(winnerb.1m2$edges[[1]], textsize=6)
dev.off()
# 2 migration, 2 run
aab.2m2 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m2 = aab.2m2 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.2m2$score[[1]], file = "aab.2m2.txt")
plot_graph(winnerb.2m2$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m2.svg")
plot_graph(winnerb.2m2$edges[[1]], textsize=6)
dev.off()
# 2 migration, 3 run
aab.3m2 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m2 = aab.3m2 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.3m2$score[[1]], file = "aab.3m2.txt")
plot_graph(winnerb.3m2$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m2.svg")
plot_graph(winnerb.3m2$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 3 migration, 1 run
aab.1m3 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m3 = aab.1m3 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.1m3$score[[1]], file = "aab.1m3.txt")
plot_graph(winnerb.1m3$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m3.svg")
plot_graph(winnerb.1m3$edges[[1]], textsize=6)
dev.off()
# 3 migration, 2 run
aab.2m3 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m3 = aab.2m3 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.2m3$score[[1]], file = "aab.2m3.txt")
plot_graph(winnerb.2m3$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m3.svg")
plot_graph(winnerb.2m3$edges[[1]], textsize=6)
dev.off()
# 3 migration, 3 run
aab.3m3 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m3 = aab.3m3 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.3m3$score[[1]], file = "aab.3m3.txt")
plot_graph(winnerb.3m3$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m3.svg")
plot_graph(winnerb.3m3$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 4 migration, 1 run
aab.1m4 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m4 = aab.1m4 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.1m4$score[[1]], file = "aab.1m4.txt")
plot_graph(winnerb.1m4$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m4.svg")
plot_graph(winnerb.1m4$edges[[1]], textsize=6)
dev.off()
# 4 migration, 2 run
aab.2m4 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m4 = aab.2m4 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.2m4$score[[1]], file = "aab.2m4.txt")
plot_graph(winnerb.2m4$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m4.svg")
plot_graph(winnerb.2m4$edges[[1]], textsize=6)
dev.off()
# 4 migration, 3 run
aab.3m4 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m4 = aab.3m4 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.3m4$score[[1]], file = "aab.3m4.txt")
plot_graph(winnerb.3m4$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m4.svg")
plot_graph(winnerb.3m4$edges[[1]], textsize=6)
dev.off()
########################################
########################################
# new run
library("admixtools")
library("dplyr")

setwd("~/Scytalopus/vcffiles/FinalVCFs")
prefix ="Thinned1000_maxmissin0.7_FilteredPCAandUCEandOtherspecies_FilteredMax30missingDepthmin5_GeographicNames_allsamples"
outd = "~/Scytalopus/Admixtools/onlyspeluncae/m456"

extract_f2(prefix, outd,auto_only = FALSE,overwrite=T)

# to run and save the models 
setwd("~/Scytalopus/Admixtools/onlyspeluncae/m456")

########################################
# 5 migration, 1 run
aab.1m5 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m5 = aab.1m5 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.1m5$score[[1]], file = "aab.1m5.txt")
plot_graph(winnerb.1m5$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m5.svg")
plot_graph(winnerb.1m5$edges[[1]], textsize=6)
dev.off()
# 5 migration, 2 run
aab.2m5 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m5 = aab.2m5 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.2m5$score[[1]], file = "aab.2m5.txt")
plot_graph(winnerb.2m5$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m5.svg")
plot_graph(winnerb.2m5$edges[[1]], textsize=6)
dev.off()
# 5 migration, 3 run
aab.3m5 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m5 = aab.3m5 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.3m5$score[[1]], file = "aab.3m5.txt")
plot_graph(winnerb.3m5$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m5.svg")
plot_graph(winnerb.3m5$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 6 migration, 1 run
aab.1m6 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m6 = aab.1m6 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.1m6$score[[1]], file = "aab.1m6.txt")
plot_graph(winnerb.1m6$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m6.svg")
plot_graph(winnerb.1m6$edges[[1]], textsize=6)
dev.off()
# 6 migration, 2 run
aab.2m6 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m6 = aab.2m6 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.2m6$score[[1]], file = "aab.2m6.txt")
plot_graph(winnerb.2m6$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m6.svg")
plot_graph(winnerb.2m6$edges[[1]], textsize=6)
dev.off()
# 6 migration, 3 run
aab.3m6 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m6 = aab.3m6 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.3m6$score[[1]], file = "aab.3m6.txt")
plot_graph(winnerb.3m6$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m6.svg")
plot_graph(winnerb.3m6$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 7 migration, 1 run
aab.1m7 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m7 = aab.1m7 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.1m7$score[[1]], file = "aab.1m7.txt")
plot_graph(winnerb.1m7$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-1m7.svg")
plot_graph(winnerb.1m7$edges[[1]], textsize=6)
dev.off()
# 7 migration, 2 run
aab.2m7 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m7 = aab.2m7 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.2m7$score[[1]], file = "aab.2m7.txt")
plot_graph(winnerb.2m7$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-2m7.svg")
plot_graph(winnerb.2m7$edges[[1]], textsize=6)
dev.off()
# 7 migration, 3 run
aab.3m7 = find_graphs(outd,outpop = "Ssuperciliaris",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m7 = aab.3m7 %>% slice_min(score, with_ties = FALSE)
write.csv(winnerb.3m7$score[[1]], file = "aab.3m7.txt")
plot_graph(winnerb.3m7$edges[[1]], textsize=6)
svg("Thinned1000_maxmissin0.7_FilteredPCAandUCE_FilteredMax30missingDepthmin5_GeographicNames_allsamples-3m7.svg")
plot_graph(winnerb.3m7$edges[[1]], textsize=6)
dev.off()
########################################
