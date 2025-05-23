# Tajima estimation 

#lin1
vcftools --gzvcf ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --TajimaD 10000 --out Lin1_10kb --keep Lin1.txt
vcftools --gzvcf ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --TajimaD 10000 --out Lin2_10kb --keep Lin2.txt
vcftools --gzvcf ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --TajimaD 10000 --out Lin3_10kb --keep Lin3.txt
vcftools --gzvcf ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --TajimaD 10000 --out Lin4_10kb --keep Lin4.txt
vcftools --gzvcf ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --TajimaD 10000 --out Lin57SPPR_10kb --keep Lin57SPPR.txt
vcftools --gzvcf ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --TajimaD 10000 --out LinBoaEsperanca67_10kb --keep LinBoaEsperanca67.txt
vcftools --gzvcf ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --TajimaD 10000 --out Lin7SCRS_10kb --keep Lin7SCRS.txt
