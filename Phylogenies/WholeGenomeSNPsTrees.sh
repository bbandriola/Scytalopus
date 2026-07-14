## workflow used to run phylogenies analyses with the snp matrix 

#1. vcf to .phy
# https://github.com/edgardomortiz/vcf2phylip
python vcf2phylip.py --input file.vcf.gz --output-prefix file

# RAxML-NG:
# raxml-ng-mpi --msa file.phy --all --prefix fileprefix_raxml --threads 6 --model GTR --outgroup Snovacapitalis152_lin --bs-trees 100

raxml-ng-mpi --msa ./Zscaffolds_FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.min4.phy --all --prefix ../../../RAxML_WGTrees/Zscaffolds_FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples --threads 5 --model GTR --outgroup Ssuperciliaris --bs-trees 100
raxml-ng-mpi --msa ./NoZW_FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.min4.phy --all --prefix ../../../RAxML_WGTrees/NoZW_FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples --threads 6 --model GTR --outgroup Ssuperciliaris --bs-trees 100

# CASTER:
#../../Softwares/ASTER/bin/caster-site --output file.caster.newick --thread 5 --support 1 --input file.phy 2> allsamples.caster.log

# NJ with VCF2Dis
# https://github.com/hewm2008/VCF2Dis
# conda activate R 
  # 1 run
../../Softwares/VCF2Dis-1.54/bin/VCF2Dis -i ../vcffiles/FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz -o allspecies_project1_2_5_6_7_8 -TreeMethod 1
  # 2 run
../../Softwares/VCF2Dis-1.54/bin/VCF2Dis -i ../vcffiles/FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz -o Second2_allspecies_project1_2_5_6_7_8_DistanceMatrix -TreeMethod 1 -OutPut p_dist.matrix
