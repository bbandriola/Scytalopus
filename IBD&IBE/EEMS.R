# 1) vcf to plink file
#plink --vcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_allsamples.vcf.gz --make-bed --out ../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_allsamples --allow-extra-chr

# 2) bed2diffs
#cp datapath.bed newdatapath.bed
#cp datapath.fam newdatapath.fam
#awk '{print 1,$2,$3,$4,$5,$6}' datapath.bim  > newdatapath.bim

#./bed2diffs_v1 --bfile FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_speluncaeonly

# 3) run eems
./runeems_snps --param params-chain1_run*.ini --seed 

#### plot in R
# https://github.com/dipetkov/eems/blob/master/Documentation/EEMS-doc.pdf
library("rEEMSplots")
library("rworldmap")
library("rworldxtra")

setwd("./") 

mcmcpath = "./FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_speluncaeonly.modified"
plotpath = "./FilteredPCAandUCE_Max30missingDepthmin10maf0.05_GeographicNames_speluncaeonly.modified"

projection_none <- "+proj=longlat +datum=WGS84"
projection_mercator <- "+proj=merc +datum=WGS84"

eems.plots(mcmcpath, plotpath, longlat = TRUE, add.grid=TRUE, add.demes=TRUE,
          out.png=TRUE,res=800,add.map = TRUE,col.map="black",projection.in = projection_none,
           projection.out = projection_mercator)
