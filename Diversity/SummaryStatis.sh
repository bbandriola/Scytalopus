# missing per ind:
vcftools --gzvcf OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --missing-indv --out OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8

# densidade de SNVs
# definition: Allelic richness was defined as the number of alleles at a locus
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --SNPdensity 100000 --out SNVdensity_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8

# het 
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --hardy --out HETstats_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8
# het per individual
bcftools stats -s - ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz > HetOnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.txt

# inbreeding coefficient
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --het --out Fstats_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8

# nucleotidy diversity 
pixy --stats pi --vcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --window_size 100000 --n_cores 4 --output_prefix Pistats_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.txt
