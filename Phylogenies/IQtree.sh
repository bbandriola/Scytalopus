# IQtree

# 1. vcf to phy 
python vcf2phylip/vcf2phylip.py -i FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz

# 2. IQ-TREE
iqtree -s ../vcffiles/FinalVCFs/FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.min4.phy -o Ssuperciliaris -T 5 -b 100 --prefix allsamples_FilteredPCA_FilteredMax30missingDepthmin5_100

iqtree3 -s FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15.min4.phy -m MFP --prefix FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15 # model finder with a reduced dataset of indidivuals 
