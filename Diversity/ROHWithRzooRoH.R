# 1) convert vcf to Oxford GEN format
# bcftools convert -g outfile --chrom --tag GT myfile.vcf

library(RZooRoH)

setwd("./")

#scytalopus <- zoodata(genofile = "bigger500kbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples", zformat="gp",samplefile = mysamples)
scytalopus <- zoodata(genofile = "bigger500kbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples", zformat="gp")

# Approach 1 (more robust but not comparable between samples): first KL model to identify the Rk rates
# then run the MixKL "models with the median values of Rk estimated with the optimal KL model (the median of R1’s for R1, the median of R2’s
# for R2, etc.)."

# Approach 2: 
testdefault <- zoomodel(predefined = TRUE, K =, base_rate= , mix_coef=0)
testdefault <- zoomodel()

runzoodefault <- zoorun(testdefault,scytalopus, nT=5)
