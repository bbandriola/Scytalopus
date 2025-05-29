# workflow to calculate Pi diversity with Pixy

# 1. Estimate nucleotidy diversity 
# including hybrids in lineage 7
pixy --stats pi --vcf ../../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --window_size 1000000 --n_cores 4 --output_prefix AllLineages_pi --population populations_speluncae.txt --bypass_invariant_check 'yes'
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
