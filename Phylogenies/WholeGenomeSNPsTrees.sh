## workflow used to run phylogenies analyses with the snp matrix 

#1. vcf to .phy
# https://github.com/edgardomortiz/vcf2phylip
python vcf2phylip.py --input ../vcffiles/Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.vcf.gz --output-prefix Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8

#2. # IQ-TREE generation: 
iqtree -s Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.min4.phy -o Ccar_01 -b 100 --prefix modified_snps.min4_Lepis_RefCcar_100boots

#3. run RAxML-NG
raxml-ng-mpi --msa Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.min4.phy --all --prefix Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8 --threads 10 --model GTR --outgroup Ccar_01 --bs-trees 100 --redo
