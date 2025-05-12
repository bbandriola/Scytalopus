## Workflow used to generate the vcf files

# 1. merge the generated vcf from snpArcher project's into one single vcf
# https://samtools.github.io/bcftools/bcftools.html#merge
bcftools merge -m snps --output mergedVCFproject0_1_2_4_5_6_7_8 --output-type z --threads 7 --file-list vcffiles2merge.txt
# results: 200,835,553

# 2. Filter sites for:
  # SNPs with <30% missing data
  # samples with <5x sequencing depth
  # biallelic sites 
bcftools view -i 'F_MISSING <= 0.3 && FORMAT/DP>=5' -m2 -M2 -v snps -Oz -o FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8 mergedVCFproject0_1_2_4_5_6_7_8

# 3. Filter per clade
## ONLY Speluncae
bcftools view -s ^Snovacapitalis152_lin,Spachecoi154,Sspeluncae33_lin,Sdiamantinensis127 -Oz -o OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz
# result: 18.960.551
    # extra filtering according base quality = 10 and no missing genotypes allowed per site
    vcftools --gzvcf OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --max-missing 1 --minQ 10 --minGQ 10 --recode --recode-INFO-all --out Nomissing_MinBaseQual10_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz
    # results: 3.851.016

## Remove bad samples from OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz
bcftools view -s ^Sspeluncae1_lin4,Sspeluncae3_lin4,Sspeluncae6_lin2,Sspeluncae8_lin2,Sspeluncae12_lin3,Sspeluncae57_lin5 -Oz -o OnlySspeluncae_FilteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz

## South 
bcftools view -s BoaEsperanca1_lin6,NortePR1_lin7,DevonianaPR1_lin5,DevonianaPR2_lin5,HNortePR_lin7,ExtremoSulRS2_lin7,CentroOesteSC1_lin7,CentroOesteSC2_lin7,CentroOesteSC3_lin7,CentroOesteSC4_lin7,CentroOesteSC5_lin7,NortePR2_lin7,DevonianaPR3_lin5,DevonianaPR4_lin5,NortePR3_lin7,CentroLesteSC1_lin7,DevonianaPR8_lin5,DevonianaSP3_lin5,DevonianaSP4_lin5,ExtremoSulSC1_lin7,DevonianaSP1_lin5,DevonianaSP2_lin5,BoaEsperanca2_lin6,BoaEsperanca3_lin7 -Oz -o SouthcladeSspeluncae_GeographicNames_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz GeographicNamesFilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz 
# ind to keep:
# Sspeluncae1_lin4,Sspeluncae2_lin4,Sspeluncae3_lin4,Sspeluncae4_lin4,Sspeluncae5_lin4,Sspeluncae16_lin4,Sspeluncae19_lin7,Sspeluncae23_lin5,Sspeluncae28_lin5,Sspeluncae30_lin5,Sspeluncae32_lin5,Sspeluncae43_lin7,Sspeluncae52_lin7,Sspeluncae54_lin6,Sspeluncae56_lin7,Sspeluncae57_lin5,Sspeluncae59_lin5,Sspeluncae64_lin7,Sspeluncae68_lin7,Sspeluncae69_lin7,Sspeluncae71_lin7,Sspeluncae72_lin7,Sspeluncae74_lin7,Sspeluncae75_lin7,Sspeluncae85_lin5,Sspeluncae86_lin5,Sspeluncae87_lin7,Sspeluncae122_lin6,Sspeluncae123_lin7,Sspeluncae139_lin7,Sspeluncae140_lin5
## North 
bcftools view -s SulMantiqueira1_lin3,SulMantiqueira2_lin3,SulMantiqueira3_lin3,SulMantiqueira5_lin3,SerradaLontras2_lin1,SerradaLontras3_lin1,SerraDosOrgaos1_lin2,SerraDosOrgaos2_lin2,NorteMantiqueira1_lin3,SulMantiqueira4_lin3,NorteMantiqueira3_lin3,NorteMantiqueira4_lin3,SerraDosOrgaos3_lin2,Caparao_lin3,SerraDaOuricana2_lin1,SerraDaOuricana3_lin1,SerraDaOuricana4_lin1,SerradaLontras4_lin1,NorteMantiqueira2_lin3,SerraDaOuricana1_lin1,SerradaLontras1_lin1,SerradaLontras5_lin1 -Oz -o NorthcladeSspeluncae_GeographicNames__FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.recode.vcf.gz ../GeographicNamesFilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz
# ind to keep:
# Sspeluncae9_lin3,Sspeluncae13_lin3,Sspeluncae14_lin3,Sspeluncae15_lin3,Sspeluncae38_lin3,Sspeluncae46_lin1,Sspeluncae47_lin1,Sspeluncae48_lin1,Sspeluncae49_lin1,Sspeluncae73_lin3,Sspeluncae83_lin2,Sspeluncae113_lin3,Sspeluncae114_lin3,Sspeluncae116_lin3,Sspeluncae117_lin1,Sspeluncae118_lin1,Sspeluncae119_lin1,Sspeluncae120_lin1,Sspeluncae121_lin1
## Lineage 4
bcftools view -s CunhaSerraDoMarRJ1_lin4,BocainaSerraDoMocainaSerraDoMarRJ3_lin4,BocainaSerraDoMarRJ4_lin4,CunhaSerraDoMarRJ2_lin4 -Oz -o Lin4_GeographicNames_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz ../GeographicNamesFilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz

# 4. Thin independent SNPs for Admixture
  # all speluncae filtered PCA

  # south clade
  vcftools --gzvcf SouthcladeSspeluncae_GeographicNames_FilteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --out Southclade_Thinned1SNPevery25kb_GeographicNames_FilteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8 --thin 25000 --recode
  # north clade
  vcftools --gzvcf NorthcladeSspeluncae_GeographicNames_filteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --out Northclade_Thinned1SNPevery25kb_GeographicNames_filteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8 --thin 25000 --recode
  # lineage 4
  vcftools --gzvcf Lin4_GeographicNames_FilteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --out Lin4_Thinned1SNPevery25kb_GeographicNames_FilteredPCA_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8 --thin 25000 --recode

#########################################################
 vcftools --gzvcf Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz --out Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz --thin 25000 --recode 
# result Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz =
# south clade
# vcftools --gzvcf Southclade_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --out Thinned1SNPevery25kSouthclade_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --thin 25000 --recode 
# result = 51,400

# north clade
# vcftools --gzvcf Northclade_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --out Thinned1SNPevery25kNorthclade_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --thin 25000 --recode 
# result = 51,400

# non-missing ind per site 
# vcftools --gzvcf OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --max-missing 1 --recode --out NONMISSINGOnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz
# kept 12974392 out of a possible 19642334 Sites
