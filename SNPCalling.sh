## Workflow used to generate the vcf files

# 1. merge all generated vcf from snpArcher project's into a single vcf
# https://samtools.github.io/bcftools/bcftools.html#merge
bcftools merge -m snps --output mergedVCFproject0_1_2_3_4_5_6_7_8_9.vcf.gz --output-type z --threads 7 --file-list ../vcffiles2merge.txt
# results: 68 individuals | 206.000.140 SNPs
  # 1.1 change for geographic names 
  bcftools reheader --samples GeographicNames.txt --output GeographicNames_allsamples.vcf.gz mergedVCFproject0_1_2_3_4_5_6_7_8_9.vcf.gz
  # results:

# 2. Filter sites for:
  # SNPs with <30% missing data
  # samples with <5x sequencing depth
  # biallelic sites 
bcftools view -i 'F_MISSING <= 0.3 && FORMAT/DP>=5' -m2 -M2 -v snps -Oz -o FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz GeographicNames_allsamples.vcf.gz
# results:

# 3. Filter per clade
## ONLY Speluncae
bcftools view -s ^EleoindigoticusUCE,EleopsychopompusUCE1,Sdiamantinensis,SiraiensisUCE,Snovacapitalis,Spachecoi,Spetrophilus,Ssuperciliaris -Oz -o OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz
# result: 18,960,551
  ## Remove bad samples from OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz
  bcftools view -s ^CunhaSerraDoMarRJ1_lin4,BocainaSerraDoMarRJ2_lin4,SerraDosOrgaos1_lin2,SerraDosOrgaos2_lin2,SulMantiqueira1_lin3,DevonianaPR1_lin5 -Oz -o OnlySspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz
  # result: 16,897,926 sites
    ## South 
    bcftools view -s HCentroLesteSC_lin7,BoaEsperanca1_lin6,NortePR1_lin7,DevonianaPR2_lin5,HNortePR_lin7,ExtremoSulRS2_lin7,CentroOesteSC1_lin7,CentroOesteSC2_lin7,CentroOesteSC3_lin7,CentroOesteSC4_lin7,CentroOesteSC5_lin7,NortePR2_lin7,DevonianaPR3_lin5,DevonianaPR4_lin5,NortePR3_lin7,CentroLesteSC1_lin7,DevonianaPR8_lin5,DevonianaSP3_lin5,DevonianaSP4_lin5,ExtremoSulSC1_lin7,DevonianaSP1_lin5,DevonianaSP2_lin5,BoaEsperanca2_lin6,BoaEsperanca3_lin7,NortePR4_lin7,NortePR5_lin7,CentroLestePR1_lin7,DevonianaPR5_lin5,DevonianaPR6_lin5,DevonianaPR7_lin5,ExtremoSulRS3_lin7 -Oz -o SouthcladeSspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz OnlySspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz
    # results: 16,897,926
    ## North 
    bcftools view -s SulMantiqueira1_lin3,SulMantiqueira2_lin3,SulMantiqueira3_lin3,SulMantiqueira5_lin3,SerradaLontras2_lin1,SerradaLontras3_lin1,SerraDosOrgaos1_lin2,SerraDosOrgaos2_lin2,NorteMantiqueira1_lin3,SulMantiqueira4_lin3,NorteMantiqueira3_lin3,NorteMantiqueira4_lin3,SerraDosOrgaos3_lin2,Caparao_lin3,SerraDaOuricana2_lin1,SerraDaOuricana3_lin1,SerraDaOuricana4_lin1,SerradaLontras4_lin1,NorteMantiqueira2_lin3,SerraDaOuricana1_lin1,SerradaLontras1_lin1,SerradaLontras5_lin1 -Oz -o NorthcladeSspeluncae_GeographicNames__FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.recode.vcf.gz ../GeographicNamesFilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz
    # results: 
      ## North Lin 2 e 3 
      bcftools view -s SulMantiqueira2_lin3,SulMantiqueira3_lin3,SulMantiqueira5_lin3,NorteMantiqueira1_lin3,SulMantiqueira4_lin3,NorteMantiqueira3_lin3,NorteMantiqueira4_lin3,SerraDosOrgaos3_lin2,Caparao_lin3,NorteMantiqueira2_lin3 -Oz -o Lin2Lin3Sspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz OnlySspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz
      # results: 16,897,926
    ## Lineage 4
    bcftools view -s CunhaSerraDoMarRJ1_lin4,BocainaSerraDoMocainaSerraDoMarRJ3_lin4,BocainaSerraDoMarRJ4_lin4,CunhaSerraDoMarRJ2_lin4 -Oz -o Lin4_GeographicNames_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz ../GeographicNamesFilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz
    # results:

# 4. Thin independent SNPs for Admixture
  # all speluncae filtered PCA without Lin 1
  vcftools --gzvcf OnlySspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --out Thinned1SNPevery25kb_AllSpeluncae_exceptLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --thin 25000 --recode --remove-indv SerradaLontras2_lin1 --remove-indv SerradaLontras3_lin1 --remove-indv SerraDaOuricana2_lin1 --remove-indv SerraDaOuricana3_lin1 --remove-indv SerraDaOuricana4_lin1 --remove-indv SerradaLontras4_lin1 --remove-indv SerraDaOuricana1_lin1 --remove-indv SerradaLontras1_lin1 --remove-indv SerradaLontras5_lin1
    # result: 50,974
  # south clade
  vcftools --gzvcf SouthcladeSspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --out Thinned1SNPevery25kb_SouthcladeSspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --thin 25000 --recode
    # results: 50,974
  # north clade
  vcftools --gzvcf NorthcladeSspeluncae_GeographicNames__FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.recode.vcf.gz --out Thinned1SNPevery25kb_NorthcladeSspeluncae_GeographicNames__FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.recode.vcf.gz --thin 25000 --recode
  # lineage 4
  vcftools --gzvcf Lin4_GeographicNames_FilteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --out Lin4_Thinned1SNPevery25kb_GeographicNames_FilteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8 --thin 25000 --recode
