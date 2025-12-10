# 1) vcf to plink file
plink --vcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_allsamples.vcf.gz --make-bed --out ../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_allsamples --allow-extra-chr

# 2) bed2diffs
cp datapath.bed newdatapath.bed
cp datapath.fam newdatapath.fam
awk '{print 1,$2,$3,$4,$5,$6}' datapath.bim  > newdatapath.bim

./bed2diffs_v1 --bfile FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_speluncaeonly

# 
