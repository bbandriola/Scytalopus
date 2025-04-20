## workflow used to run phylogenies analyses with the snp matrix 

#1. vcf to .phy
# https://github.com/edgardomortiz/vcf2phylip
python vcf2phylip.py --input ../vcffiles/Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.vcf.gz --output-prefix Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8

#2. # IQ-TREE generation: 
iqtree -s Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.min4.phy --alrt 1000 -B 1000 -b 100 -o Snovacapitalis152_lin --prefix Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.100boots_UFb_ALR -T 5

#3. run RAxML-NG
raxml-ng-mpi --msa Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8.min4.phy --all --prefix Filteredmissing0.75_mergedVCFproject1_2_5_6_7_8 --threads 10 --model GTR --outgroup Ccar_01 --bs-trees 100 --redo
