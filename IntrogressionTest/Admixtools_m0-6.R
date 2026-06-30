# generate file 
# vcftools --gzvcf ../../snparcher/vcfs/ManuscriptVCFs/FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis.recode.vcf.gz --out LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis --plink

library("admixtools")
library("dplyr")

setwd("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/Admixtools/m0-6_Snovacapitalis_outgroup")
prefix ="LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis"
outd = "/media/labgenoma5/DATAPART3/bandriola/Scytalopus/Admixtools/m0-6_Snovacapitalis_outgroup"

extract_f2(prefix, outd,auto_only = FALSE,overwrite=T)

# 0 mig
# A good model should fit all 𝑓3-statistics, and have a score close to zero
# 0 migration, 1 run
aab.1m0 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 0,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m0 = aab.1m0 %>% slice_min(score, with_ties = FALSE)
# plot and score
write.csv(winnerb.1m0$score[[1]], file = "aab.1m0.txt")
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-1m0.svg")
plot_graph(winnerb.1m0$edges[[1]], textsize=6)
dev.off()

########################################
# 1 migration, 1 run
aab.1m1 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m1 = aab.1m1 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m1$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-1m1.svg")
plot_graph(winnerb.1m1$edges[[1]], textsize=6)
dev.off()
# 1 migration, 2 run
aab.2m1 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m1 = aab.2m1 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m1$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-2m1.svg")
plot_graph(winnerb.2m1$edges[[1]], textsize=6)
dev.off()
# 1 migration, 3 run
aab.3m1 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 1,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m1 = aab.3m1 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m1$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-3m1.svg")
plot_graph(winnerb.3m1$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 2 migration, 1 run
aab.1m2 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m2 = aab.1m2 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m2$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-1m2.svg")
plot_graph(winnerb.1m2$edges[[1]], textsize=6)
dev.off()
# 2 migration, 2 run
aab.2m2 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m2 = aab.2m2 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m2$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-2m2.svg")
plot_graph(winnerb.2m2$edges[[1]], textsize=6)
dev.off()
# 2 migration, 3 run
aab.3m2 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 2,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m2 = aab.3m2 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m2$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-3m2.svg")
plot_graph(winnerb.3m2$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 3 migration, 1 run
aab.1m3 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m3 = aab.1m3 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m3$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-1m3.svg")
plot_graph(winnerb.1m3$edges[[1]], textsize=6)
dev.off()
# 3 migration, 2 run
aab.2m3 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m3 = aab.2m3 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m3$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-2m3.svg")
plot_graph(winnerb.2m3$edges[[1]], textsize=6)
dev.off()
# 3 migration, 3 run
aab.3m3 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 3,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m3 = aab.3m3 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m3$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-3m3.svg")
plot_graph(winnerb.3m3$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 4 migration, 1 run
aab.1m4 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m4 = aab.1m4 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m4$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-1m4.svg")
plot_graph(winnerb.1m4$edges[[1]], textsize=6)
dev.off()
# 4 migration, 2 run
aab.2m4 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m4 = aab.2m4 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m4$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-2m4.svg")
plot_graph(winnerb.2m4$edges[[1]], textsize=6)
dev.off()
# 4 migration, 3 run
aab.3m4 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 4,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m4 = aab.3m4 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m4$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-3m4.svg")
plot_graph(winnerb.3m4$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 5 migration, 1 run
aab.1m5 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m5 = aab.1m5 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m5$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-1m5.svg")
plot_graph(winnerb.1m5$edges[[1]], textsize=6)
dev.off()
# 5 migration, 2 run
aab.2m5 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m5 = aab.2m5 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m5$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-2m5.svg")
plot_graph(winnerb.2m5$edges[[1]], textsize=6)
dev.off()
# 5 migration, 3 run
aab.3m5 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 5,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m5 = aab.3m5 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m5$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-3m5.svg")
plot_graph(winnerb.3m5$edges[[1]], textsize=6)
dev.off()
########################################

########################################
# 6 migration, 1 run
aab.1m6 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.1m6 = aab.1m6 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.1m6$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-1m6.svg")
plot_graph(winnerb.1m6$edges[[1]], textsize=6)
dev.off()
# 6 migration, 2 run
aab.2m6 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.2m6 = aab.2m6 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.2m6$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-2m6.svg")
plot_graph(winnerb.2m6$edges[[1]], textsize=6)
dev.off()
# 6 migration, 3 run
aab.3m6 = find_graphs(outd,outpop = "Snovacapitalis",numadmix = 6,stop_gen2 = 1000,numgraphs=100,plusminus_generations=20,verbose=TRUE)
winnerb.3m6 = aab.3m6 %>% slice_min(score, with_ties = FALSE)
plot_graph(winnerb.3m6$edges[[1]], textsize=6)
svg("LDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis-3m6.svg")
plot_graph(winnerb.3m6$edges[[1]], textsize=6)
dev.off()
########################################
