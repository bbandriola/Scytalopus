# independent sites: OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15_GeographicNames_OnlySpeluncae.recode.vcf.gz from each lineage
# 1. vcf to geno file using LEA R
# plink
plink --vcf prefix.vcf.gz --recode A --allow-extra-chr --out GENOinput_prefix
# R
library(LEA)
# Read .raw, drop first columns, and write to .geno
geno <- read.table("GENOinput_OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1.raw", header = TRUE)
write.geno(geno[, -(1:6)], "OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1.geno")

# 2. NeEstimator
./Ne2x
Input file > GENOinput_*

