## workflow used to run phylogenies analyses with the snp matrix 

#1. vcf to .phy
# https://github.com/edgardomortiz/vcf2phylip
python vcf2phylip.py --input file.vcf.gz --output-prefix file

# IQ-TREE: 
iqtree -s file.phy --alrt 1000 -B 1000 -b 100 -o Snovacapitalis152_lin --prefix fileprefix_IQtree -T 5

# RAxML-NG:
raxml-ng-mpi --msa file.phy --all --prefix fileprefix_raxml --threads 6 --model GTR --outgroup Snovacapitalis152_lin --bs-trees 100

raxml-ng-mpi --msa ./Zscaffold_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_allsamples.recode.min4.phy --all --prefix Zscaffold_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_allsamples --threads 5 --model GTR --outgroup Ssuperciliaris --bs-trees 100
raxml-ng-mpi --msa ../../../../DATAPART3/bandriola/Scytalopus/snparcher/vcfs/NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_allsamples.min4.phy --all --prefix NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_allsamples --threads 6 --model GTR --outgroup Snovacapitalis --bs-trees 100

# CASTER:
../../Softwares/ASTER/bin/caster-site --output file.caster.newick --thread 5 --support 1 --input file.phy 2> allsamples.caster.log

# NJ with VCF2Dis
# https://github.com/hewm2008/VCF2Dis
# conda activate R 
  # 1 run
../../Softwares/VCF2Dis-1.54/bin/VCF2Dis -i ../vcffiles/FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz -o allspecies_project1_2_5_6_7_8 -TreeMethod 1
  # 2 run
../../Softwares/VCF2Dis-1.54/bin/VCF2Dis -i ../vcffiles/FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz -o Second2_allspecies_project1_2_5_6_7_8_DistanceMatrix -TreeMethod 1 -OutPut p_dist.matrix
