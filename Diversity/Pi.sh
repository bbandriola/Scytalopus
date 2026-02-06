# workflow to calculate Pi diversity with Pixy

# 1. Merge gvcfs
# to index gvcf: gatk IndexFeatureFile -I *gzvcf
gatk GenomicsDBImport -V Sspeluncae117_lin1.g.vcf.gz -V Sspeluncae118_lin1.g.vcf.gz -V Sspeluncae119_lin1.g.vcf.gz -V Sspeluncae120_lin1.g.vcf.gz -V Sspeluncae121_lin1.g.vcf.gz -V Sspeluncae46_lin1.g.vcf.gz -V Sspeluncae47_lin1.g.vcf.gz -V Sspeluncae48_lin1.g.vcf.gz -V Sspeluncae49_lin1.g.vcf.gz --genomicsdb-workspace-path Lin1 -L scaffolds.gvcf.intervals
gatk GenomicsDBImport -V Sspeluncae113_lin3.g.vcf.gz -V Sspeluncae114_lin3.g.vcf.gz -V Sspeluncae116_lin3.g.vcf.gz -V Sspeluncae13_lin3.g.vcf.gz -V Sspeluncae14_lin3.g.vcf.gz -V Sspeluncae15_lin3.g.vcf.gz -V Sspeluncae38_lin3.g.vcf.gz -V Sspeluncae73_lin3.g.vcf.gz -V Sspeluncae9_lin3.g.vcf.gz --genomicsdb-workspace-path Lin3 -L scaffolds.gvcf.intervals
gatk GenomicsDBImport -V Sspeluncae16_lin4.g.vcf.gz -V Sspeluncae2_lin4.g.vcf.gz -V Sspeluncae4_lin4.g.vcf.gz -V Sspeluncae5_lin4.g.vcf.gz --genomicsdb-workspace-path Lin4 -L scaffolds.gvcf.intervals
gatk GenomicsDBImport -V Sspeluncae107_lin5.g.vcf.gz -V Sspeluncae109_lin5.g.vcf.gz -V Sspeluncae110_lin5.g.vcf.gz -V Sspeluncae140_lin5.g.vcf.gz -V Sspeluncae23_lin5.g.vcf.gz -V Sspeluncae28_lin5.g.vcf.gz -V Sspeluncae30_lin5.g.vcf.gz -V Sspeluncae32_lin5.g.vcf.gz -V Sspeluncae59_lin5.g.vcf.gz -V Sspeluncae85_lin5.g.vcf.gz -V Sspeluncae86_lin5.g.vcf.gz -V Sspeluncae101_lin7.g.vcf.gz -V Sspeluncae103_lin7.g.vcf.gz -V Sspeluncae56_lin7.g.vcf.gz -V Sspeluncae64_lin7.g.vcf.gz -V Sspeluncae75_lin7.g.vcf.gz -V Sspeluncae87_lin7.g.vcf.gz --genomicsdb-workspace-path Lin5_DevonianaNortPR -L scaffolds.gvcf.intervals
gatk GenomicsDBImport -V Sspeluncae122_lin6.g.vcf.gz -V Sspeluncae54_lin6.g.vcf.gz -V Sspeluncae123_lin7.g.vcf.gz --genomicsdb-workspace-path Lin6 -L scaffolds.gvcf.intervals
gatk GenomicsDBImport -V Sspeluncae106_lin7.g.vcf.gz -V Sspeluncae19_lin7.g.vcf.gz -V Sspeluncae43_lin7.g.vcf.gz -V Sspeluncae52_lin7.g.vcf.gz -V Sspeluncae68_lin7.g.vcf.gz -V Sspeluncae69_lin7.g.vcf.gz -V Sspeluncae71_lin7.g.vcf.gz -V Sspeluncae72_lin7.g.vcf.gz -V Sspeluncae74_lin7.g.vcf.gz -V Sspeluncae95_lin7.g.vcf.gz --genomicsdb-workspace-path Lin7 -L scaffolds.gvcf.intervals

# 2. Generate genotype file 
# running 6/2
gatk  GenotypeGVCFs -R /ref/GCA_013400415.1_ASM1340041v1_genomic.fna  -V Sspeluncae117_lin1.g.vcf.gz -V Sspeluncae118_lin1.g.vcf.gz -V Sspeluncae119_lin1.g.vcf.gz -V Sspeluncae120_lin1.g.vcf.gz -V Sspeluncae121_lin1.g.vcf.gz -V Sspeluncae46_lin1.g.vcf.gz -V Sspeluncae47_lin1.g.vcf.gz -V Sspeluncae48_lin1.g.vcf.gz -V Sspeluncae49_lin1.g.vcf.gz -L scaffolds.gvcf.intervals -O Lin1-allsites.vcf.gz
# trying to index files
gatk  GenotypeGVCFs -R /ref/GCA_013400415.1_ASM1340041v1_genomic.fna  -V Sspeluncae113_lin3.g.vcf.gz -V Sspeluncae114_lin3.g.vcf.gz -V Sspeluncae116_lin3.g.vcf.gz -V Sspeluncae13_lin3.g.vcf.gz -V Sspeluncae14_lin3.g.vcf.gz -V Sspeluncae15_lin3.g.vcf.gz -V Sspeluncae38_lin3.g.vcf.gz -V Sspeluncae73_lin3.g.vcf.gz -V Sspeluncae9_lin3.g.vcf.gz -L scaffolds.gvcf.intervals -O Lin3-allsites.vcf.gz
# running 6/2
gatk  GenotypeGVCFs -R /ref/GCA_013400415.1_ASM1340041v1_genomic.fna  -V Sspeluncae16_lin4.g.vcf.gz -V Sspeluncae2_lin4.g.vcf.gz -V Sspeluncae4_lin4.g.vcf.gz -V Sspeluncae5_lin4.g.vcf.gz -L scaffolds.gvcf.intervals -O Lin4-allsites.vcf.gz
gatk  GenotypeGVCFs -R /ref/GCA_013400415.1_ASM1340041v1_genomic.fna  -V Sspeluncae107_lin5.g.vcf.gz -V Sspeluncae109_lin5.g.vcf.gz -V Sspeluncae110_lin5.g.vcf.gz -V Sspeluncae140_lin5.g.vcf.gz -V Sspeluncae23_lin5.g.vcf.gz -V Sspeluncae28_lin5.g.vcf.gz -V Sspeluncae30_lin5.g.vcf.gz -V Sspeluncae32_lin5.g.vcf.gz -V Sspeluncae59_lin5.g.vcf.gz -V Sspeluncae85_lin5.g.vcf.gz -V Sspeluncae86_lin5.g.vcf.gz -V Sspeluncae101_lin7.g.vcf.gz -V Sspeluncae103_lin7.g.vcf.gz -V Sspeluncae56_lin7.g.vcf.gz -V Sspeluncae64_lin7.g.vcf.gz -V Sspeluncae75_lin7.g.vcf.gz -V Sspeluncae87_lin7.g.vcf.gz -L scaffolds.gvcf.intervals -O Lin5-allsites.vcf.gz
gatk  GenotypeGVCFs -R /ref/GCA_013400415.1_ASM1340041v1_genomic.fna  -V Sspeluncae122_lin6.g.vcf.gz -V Sspeluncae54_lin6.g.vcf.gz -V Sspeluncae123_lin7.g.vcf.gz -L scaffolds.gvcf.intervals -O Lin6-allsites.vcf.gz
gatk  GenotypeGVCFs -R /ref/GCA_013400415.1_ASM1340041v1_genomic.fna  -V Sspeluncae106_lin7.g.vcf.gz -V Sspeluncae19_lin7.g.vcf.gz -V Sspeluncae43_lin7.g.vcf.gz -V Sspeluncae52_lin7.g.vcf.gz -V Sspeluncae68_lin7.g.vcf.gz -V Sspeluncae69_lin7.g.vcf.gz -V Sspeluncae71_lin7.g.vcf.gz -V Sspeluncae72_lin7.g.vcf.gz -V Sspeluncae74_lin7.g.vcf.gz -V Sspeluncae95_lin7.g.vcf.gz -all-sites -L scaffolds.gvcf.intervals -O Lin7-allsites.vcf.gz

# 3. Run pixy
pixy --stats pi --vcf Lin1-allsites.vcf.gz --window_size 50000 --n_cores 1 --output_prefix Lin1 --population lin1.txt 
pixy --stats pi --vcf Lin3-allsites.vcf.gz --window_size 50000 --n_cores 1 --output_prefix Lin3 --population lin3.txt 
pixy --stats pi --vcf Lin4-allsites.vcf.gz --window_size 50000 --n_cores 1 --output_prefix Lin4 --population lin4.txt 
pixy --stats pi --vcf Lin5-allsites.vcf.gz --window_size 50000 --n_cores 1 --output_prefix Lin5 --population lin5.txt 
pixy --stats pi --vcf Lin6-allsites.vcf.gz --window_size 50000 --n_cores 1 --output_prefix Lin6 --population lin6.txt 
pixy --stats pi --vcf Lin7-allsites.vcf.gz --window_size 50000 --n_cores 1 --output_prefix Lin7 --population lin7.txt 

####################################################
# 1. Estimate nucleotidy diversity 
# including hybrids in lineage 7
  ##### REVER REVER REVER PORQUE EU SO POSSUO UM VCF COM SITIOS VARIANTES
pixy --stats pi --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --window_size 50000 --n_cores 1 --output_prefix Lin1 --population ../lin1.txt 
# NOT including hybrids in lineage 7
pixy --stats pi --vcf ../../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --window_size 1000000 --n_cores 4 --output_prefix lin7NoHybridsInd_Pi --population lin7NoHybridsInd.txt --bypass_invariant_check 'yes'
# group a lineage A
pixy --stats pi --vcf ../../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --window_size 1000000 --n_cores 4 --output_prefix lin1GroupA_Pi --population lin1GroupA.txt --bypass_invariant_check 'yes'
# group a lineage B
pixy --stats pi --vcf ../../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --window_size 1000000 --n_cores 1 --output_prefix lin1GroupB_Pi --population lin1GroupB.txt --bypass_invariant_check 'yes'
  # Pi with vcftools
  # vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --window-pi 100000 --out pi_100kb_lin1 --keep lin1.txt

# 2. Separate the output by lineage
grep -h '^lin1' * > lin1_pi.txt
grep -h '^lin2' * > lin2_pi.txt
grep -h '^lin3' * > lin3_pi.txt
grep -h '^lin4' * > lin4_pi.txt
grep -h '^lin5' * > lin5_pi.txt
grep -h '^lin6' * > lin6_pi.txt
grep -h '^lin7' * > lin7_pi.txt

# 3. Compute mean Pi in R 
Pi <- read.table("lin1_pi.txt")
average <- mean(Pi$V5, na.rm = TRUE)
print(average)
