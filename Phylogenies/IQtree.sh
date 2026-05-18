# IQtree

# 1. vcf to phy 
python vcf2phylip/vcf2phylip.py -i FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz

# 2. IQ-TREE
iqtree -s ../vcffiles/FinalVCFs/FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.min4.phy -o Ssuperciliaris -T 5 -b 100 --prefix allsamples_FilteredPCA_FilteredMax30missingDepthmin5_100

iqtree3 -s FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15.min4.phy -m MFP --prefix FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15 # model finder with a reduced dataset of indidivuals 

# Concordant Factor 
iqtree2 -t ../species_tree --gcf ../../RaxmlHPC/50kb/allbestTrees_50kb.fa -p ../../windows/windows_50kb/50kb_allsamples/8_2_LIST_FILE_50kb/windows/Edited_fastas --scf 100 --prefix conca_sCF_gCF.SRIextern -T 10

# concordance vector 
java -jar ~/Softwares/astral/ASTRAL/astral.5.7.8.jar -i all_trees_1kb_10ind.newick --output 1kb_int25kb.10ind_annotated.tree -t 2 --outgroup Sspeluncae120
# quartest are writing as q1,q2 and q3

# get the branch lengths in coalescent units from the ASTRAL analysis
iqtree3 -te 1kb_int25kb.10ind_annotated.tree -blfix -p loci.best_model.nex --scfl 1 --prefix coalescent_bl -T 128
