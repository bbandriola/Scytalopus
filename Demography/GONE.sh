# GONE 
# 1. generate file ped
vcftools --gzvcf Lin4_OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15_GeographicNames_OnlySpeluncae.recode.vcf.gz --plink --max-missing 0 --out nomissingdata_Lin4_OnlyVariants_NoZW_FilteredPCAandUCE_Max10missingDepthmin15

./gone2 
