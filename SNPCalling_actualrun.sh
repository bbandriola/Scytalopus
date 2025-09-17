## Workflow used to generate the vcf files

#BEFORE EVERYTHING: 
# normalizar os vcfs antes de fazer o merge
# command:
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta121-127_raw_norm.vcf.gz Scyta121-127_raw.vcf.gz # snps 
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta139-154_raw_norm.vcf.gz Scyta139-154_raw.vcf.gz # snps 
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta1_raw_norm.vcf.gz Scyta1_raw.vcf.gz # snps 
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta95-110_raw_norm.vcf.gz Scyta95-110_raw.vcf.gz # snps 
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta_1-15_48-64_raw_norm.vcf.gz Scyta_1-15_48-64_raw.vcf.gz # snps 152678617
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta_116-120_raw_norm.vcf.gz Scyta_116-120_raw.vcf.gz # snps 38593591
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta_16-28_46-47_raw_norm.vcf.gz Scyta_16-28_46-47_raw.vcf.gz # snps 46539656
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta_43_68-74_raw_norm.vcf.gz Scyta_43_68-74_raw.vcf.gz # snps 42889405
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta_75-87_113-114_raw_norm.vcf.gz Scyta_75-87_113-114_raw.vcf.gz # snps 47742392
bcftools norm -f ../../../../../DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -Oz -o Scyta_ira_psy_indi_super_raw_norm.vcf.gz Scyta_ira_psy_indi_super_raw.vcf.gz # snps 5708314 

# 1. merge all generated vcf from snpArcher project's into a single vcf
# https://samtools.github.io/bcftools/bcftools.html#merge
bcftools merge -m snps --output mergeallvcfsfromsnparcher.vcf.gz -Oz --threads 7 --file-list vcffiles2merge.txt

# 2. rename; filter by PCA, depth max and mix and missing
mergeallvcfsfromsnparcher.vcf.gz | bcftools view -s ^SulMantiqueira1_lin3,CunhaSerraDoMarRJ1_lin4,BocainaSerraDoMarRJ2_lin4,DevonianaPR1_lin5,SerraDosOrgaos1_lin2,SerraDosOrgaos2_lin2 - | bcftools view -i 'F_MISSING <= 0.3 && FORMAT/DP>=10 && FORMAT/DP>=100' -m2 -M2 -v snps -Oz -o FilteredPCAMax30missingDepthmin10max100_GeographicNames_allsamples.vcf.gz
