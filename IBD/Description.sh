# convert VCF 2 DIS https://github.com/BGI-shenzhen/VCF2Dis
VCF2DIS -Input ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100_GeographicNames_allsamples.vcf.gz -Out Sspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100_GeographicNames

# convert geographic distance to euclidean distance
# run first part of the R script in https://github.com/bbandriola/Scytalopus/blob/main/IBD%26IBE/IBD_IBE.R


