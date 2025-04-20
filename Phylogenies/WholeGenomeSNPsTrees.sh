## workflow used to run phylogenies analyses with the snp matrix 

#1. vcf to .phy
# https://github.com/edgardomortiz/vcf2phylip
python vcf2phylip.py --input ../vcffiles/Filteredmissing0.57_mergedVCFproject1_2_5_6_7_8.vcf.gz --output-prefix Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8
