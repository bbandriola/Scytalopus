# independent sites: OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1.vcf.gz
# 1. vcf to geno file using LEA R
# plink
plink --vcf OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1.vcf.gz --recode A --out GENOinput_OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1
# R
library(LEA)
# Read .raw, drop first columns, and write to .geno
geno <- read.table("GENOinput_OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1.raw", header = TRUE)
write.geno(geno[, -(1:6)], "OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1.geno")
