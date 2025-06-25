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


