## Workflow used to generate the vcf files

## 14/4/25
# 1. merge the generated vcf from snpArcher project's into one single vcf
# https://samtools.github.io/bcftools/bcftools.html#merge
bcftools merge -m snps --output mergedVCFproject1_2_5_6_7_8 --output-type z --threads 7 --file-list vcffiles2merge.txt

# merge result of mergedVCFproject1_2_5_6_7_8.vcf.gz : 

# 2. Filter sites for:
  # SNPs with <30% missing data
  # samples with <5x sequencing depth
  # biallelic sites 
bcftools view -i 'F_MISSING <= 0.3 && FORMAT/DP>=5' -m2 -M2 -v snps -Oz -o FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz mergedVCFproject1_2_5_6_7_8.vcf.gz
# result Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz = 19,642,355
# bcftools view -i 'F_MISSING <= 0.75 & MAF > 0.01' -m2 -M2 -v snps -Oz -o Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.vcf.gz mergedVCFproject1_2_5_6_7_8.vcf.gz
# result FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz = 

# 3. Filter per clade
# South
bcftools view -s Sspeluncae75_lin7,Sspeluncae85_lin5,Sspeluncae86_lin5,Sspeluncae87_lin7,Sspeluncae139_lin7,Sspeluncae140_lin5,Sspeluncae30_lin5,Sspeluncae32_lin5,Sspeluncae19_lin7,Sspeluncae23_lin5,Sspeluncae28_lin5,Sspeluncae122_lin6,Sspeluncae123_lin7 -Oz -o Southclade_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz
# North
bcftools view -s Sspeluncae113_lin3,Sspeluncae114_lin3,Sspeluncae83_lin2,Sspeluncae116_lin3,Sspeluncae117_lin1,Sspeluncae118_lin1,Sspeluncae119_lin1,Sspeluncae120_lin1,Sspeluncae38_lin3,Sspeluncae16_lin4,Sspeluncae46_lin1,Sspeluncae47_lin1,Sspeluncae121_lin1 -Oz -o Northclade_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz
# ONLY Speluncae
bcftools view -s ^Snovacapitalis152_lin,Spachecoi154,Sspeluncae33_lin,Sdiamantinensis127 -Oz -o OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz

# 4. Thin independent SNPs for Admixture
vcftools --gzvcf Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz --out Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz --thin 25000 --recode 
# result Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz =

