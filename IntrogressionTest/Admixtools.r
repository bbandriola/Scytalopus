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

library("igraph")
library("admixtools")
library("dplyr")

setwd("./")
prefix ="Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis"
outd = "./out"

# extract f2 statistic from geno file extracted with vcf2eigenstrat.py
extract_f2(prefix, outd,auto_only = FALSE,overwrite=T)

# load f2 statistic
f2_blocks =  f2_from_precomp(outd)

pop1=c("Lin1","Lin2","Lin3","Lin4","Lin5","Lin6","Lin7","Devoniana")

# calculating f3
f3<-qp3pop(f2_blocks,pop1)
write.table(f3,"f3_pop.txt")
# calculating f4
f4<-qpdstat(f2_blocks, pop1)
write.table(f4,"f4_pop.txt")

# qpWave: for estimating the number of admixture events; compares two sets of populations (left and right)
# qpAdm: for estimating admixture weights;  tests how a single target population (which can be one of the left populations) relates to left and right

# to do qpWave: 
left = c("Lin1","Lin2","Lin3","Lin4")
right = c("Lin5","Lin6","Lin7","Devoniana")
results_qpwave = qpwave(f2_blocks, left, right)
write.table(results_qpwave,"qpwave.txt")

# to run qpWave + qpAdm
qpwave_pairs <- qpwave_pairs(f2_blocks, left, right)
write.table(qpwave_pairs,"qpwave_pairs.txt")

# swifted populations 
left = c("Lin1","Lin2","Lin3")
right = c("Lin4","Lin5","Lin6","Lin7","Devoniana")
qpwave_pairs <- qpwave_pairs(f2_blocks, left, right)
write.table(qpwave_pairs,"qpwave_pairs_lin4withsouth.txt")

# explore different graphics with f3 result 
mig0 <- find_graphs(f2_blocks,numadmix=0, outpop= "Snovacapitalis", stop_gen = 100) 
winner = mig0 %>% slice_min(score, with_ties = FALSE)
winner$score[[1]]
write.csv(winner$score[[1]], file = "mig0.txt")
svg("Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis_m0.svg")
plot_graph(winner$edges[[1]], textsize=6)
dev.off()

mig1 <- find_graphs(f2_blocks,numadmix=1, outpop= "Snovacapitalis", stop_gen = 100) 
winner = mig1 %>% slice_min(score, with_ties = FALSE)
winner$score[[1]]
write.csv(winner$score[[1]], file = "mig1.txt")
svg("Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis_m1.svg")
plot_graph(winner$edges[[1]], textsize=6)
dev.off()

mig2 <- find_graphs(f2_blocks,numadmix=2, outpop= "Snovacapitalis", stop_gen = 100) 
winner = mig2 %>% slice_min(score, with_ties = FALSE)
winner$score[[1]]
write.csv(winner$score[[1]], file = "mig2.txt")
svg("Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis_m2.svg")
plot_graph(winner$edges[[1]], textsize=6)
dev.off()

mig3 <- find_graphs(f2_blocks,numadmix=3, outpop= "Snovacapitalis", stop_gen = 100) 
winner = mig3 %>% slice_min(score, with_ties = FALSE)
winner$score[[1]]
write.csv(winner$score[[1]], file = "mig3.txt")
svg("Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis_m3.svg")
plot_graph(winner$edges[[1]], textsize=6)
dev.off()

mig4 <- find_graphs(f2_blocks,numadmix=4, outpop= "Snovacapitalis", stop_gen = 100) 
winner = mig4 %>% slice_min(score, with_ties = FALSE)
winner$score[[1]]
write.csv(winner$score[[1]], file = "mig4.txt")
svg("Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis_m4.svg")
plot_graph(winner$edges[[1]], textsize=6)
dev.off()

mig5 <- find_graphs(f2_blocks,numadmix=5, outpop= "Snovacapitalis", stop_gen = 100) 
winner = mig5 %>% slice_min(score, with_ties = FALSE)
winner$score[[1]]
write.csv(winner$score[[1]], file = "mig5.txt")
svg("Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis_m5.svg")
plot_graph(winner$edges[[1]], textsize=6)
dev.off()

mig6 <- find_graphs(f2_blocks,numadmix=6, outpop= "Snovacapitalis", stop_gen = 100) 
winner = mig6 %>% slice_min(score, with_ties = FALSE)
winner$score[[1]]
write.csv(winner$score[[1]], file = "mig6.txt")
svg("Max30missinessDepthmin10max100LD0.15_OutgroupSnovacapitalis_m6.svg")
plot_graph(winner$edges[[1]], textsize=6)
dev.off()
