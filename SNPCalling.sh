## Workflow used to generate the vcf files

## 14/4/25
# 1. merge the generated vcf from snpArcher project's into one single vcf
# https://samtools.github.io/bcftools/bcftools.html#merge
bcftools merge -m snps --output mergedVCFproject1_2_5_6_7_8 --output-type z --threads 7 --file-list vcffiles2merge.txt

# merge result of mergedVCFproject1_2_5_6_7_8.vcf.gz : 

# 2. Filter sites for:
  # SNPs with <30% missing data
  # MAF cutoff at 0.01
  # samples with <2x sequencing depth
  # biallelic sites 
bcftools view --min-af 0.01 -i 'F_MISSING <= 0.3' -m2 -M2 -v snps -Oz -o Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz mergedVCFproject1_2_5_6_7_8.vcf.gz
# result Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz = 19,642,355
bcftools view -i 'F_MISSING <= 0.75 & MAF > 0.01' -m2 -M2 -v snps -Oz -o Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.vcf.gz mergedVCFproject1_2_5_6_7_8.vcf.gz
# result Filteredmissing0.57_mergedVCFproject1_2_5_6_7_8.vcf.gz =

# 3. Thin independent SNPs for Admixture
vcftools --gzvcf Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz --out Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz --thin 25000 --recode 
# result Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz =

# 4. Subset only speluncae
bcftools view -s Sspeluncae139_lin7,Sspeluncae140_lin5,Sspeluncae116_lin3,Sspeluncae117_lin1,Sspeluncae118_lin1,Sspeluncae119_lin1,Sspeluncae120_lin1,Sspeluncae30_lin5,Sspeluncae32_lin5,Sspeluncae38_lin3,Sspeluncae16_lin4,Sspeluncae19_lin7,Sspeluncae23_lin5,Sspeluncae28_lin5,Sspeluncae46_lin1,Sspeluncae47_lin1,Sspeluncae121_lin1,Sspeluncae122_lin6,Sspeluncae123_lin7, -Oz -o SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz
