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

# 3. remove sexual chromossomes

  
# 4. prune by ld with vcftools 
# LD pairwise calculation | # LD decay to filter at a minimun distance
#PopLDdecay -InVCF ../FilteredMax30missingDepthmin5MAF_FilteredPCA_GeographicNames_onlyspeluncae.vcf.gz.recode.vcf.gz -OutStat LDdecay_speluncae
  # plot: perl ./PopLDdecay/bin/Plot_OnePop.pl -inFile LDdecay.stat.gz
  # Rscrip LDdecay.r
#test with plink; ref: https://speciationgenomics.github.io/ld_decay/
#plink --vcf ../FilteredMax30missingDepthmin5MAF_GeographicNames_allsamples.vcf.gz.recode.vcf.gz --double-id --allow-extra-chr --set-missing-var-ids @:# --geno 0.1 --thin 0.1 --r2 gz --ld-window 100 --ld-window-kb 1000 --ld-window-r2 0 --out r2Plink_onlyspeluncae
# do LD prunning with plink 
  # a partir disso, fazer um filtro de prunning adequado para os dados  
#  plink2 --vcf ../FilteredMax30missingDepthmin5MAF_FilteredPCA_GeographicNames_onlyspeluncae.vcf.gz.recode.vcf.gz --indep-pairwise 1 1 0.15 --out pruning_1kb_r2_0.15 --allow-extra-chr --set-missing-var-ids @:# # ajustar o ultimo valor para o valor que tiver saido no LDdecay
#  awk -F':' '{print $1"\t"($2-1)"\t"$2}' pruning_1kb_r2_0.15.prune.in > prune_in.bed
#  bcftools view -R LDdecay/prune_in.bed -Oz -o FilteredMax30missingDepthmin5MAFand15LD_FilteredPCA_GeographicNames_onlyspeluncae.vcf.gz.recode.vcf.gz FilteredMax30missingDepthmin5MAF_FilteredPCA_GeographicNames_onlyspeluncae.vcf.gz.recode.vcf.gz
