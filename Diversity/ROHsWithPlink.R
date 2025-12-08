# 1) generate plink file 

# 2) generate ROHs file 
# plink --bfile bigger500kbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples --homozyg-window-snp 50 --homozyg-window-missing 3 --homozyg-window-threshold 0.05 --homozyg-gap 200 --homozyg-density 250 --homozyg-kb 1000 --allow-extra-chr 
