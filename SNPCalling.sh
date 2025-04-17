## Workflow used to generate the vcf files

## 14/4/25
# 1. merge the generated vcf from snpArcher project's into one single vcf
# https://samtools.github.io/bcftools/bcftools.html#merge
bcftools merge -m snps --output mergedVCFproject1_2_6_7_8 --output-type z --threads 7 --file-list vcffiles2merge.txt

# merge result of mergedVCFproject1_2_6_7_8.vcf.gz : 89,454,946

# 2. Filter sites for:
  # SNPs with <30% missing data
  # MAF cutoff at 0.01
  # samples with <2x sequencing depth
  # biallelic sites 
bcftools view --exclude-types indels --min-af 0.01 -i 'F_MISSING <= 0.3' -m2 -M2 -v snps -Oz -o Filtered_mergedVCFproject1_2_6_7_8.vcf.gz

# 3. Thin independent SNPs
bcftools filter --include 
