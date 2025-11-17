# source https://github.com/millanek/Dsuite
# check https://github.com/mmatschiner/tutorials/blob/master/analysis_of_introgression_with_snp_data/README.md for more

# 1. run Dtrios
../../Softwares/Dsuite/Build/Dsuite Dtrios -t speluncaeLin1.nwk -o speluncaeLin1_dtrios ../vcfs/normalizedVCFs/NoZW_FilteredPCAandUCE_Max10missingDepthmin15LD015_GeographicNames_SpeluncaeLin1.recode.vcf.gz speluncaeLin1.txt # running

# 2. Fbranch  
../../Softwares/Dsuite/Build/Dsuite Fbranch -Z speluncaeLin1.nwk speluncaeLin1_dtrios_tree.txt > fbranch_speluncaeLin1_dtrios.txt

# 3. fbranch
../../Softwares/Dsuite/utils/dtools.py -n fbranch_speluncaeLin1_dtrios --outgroup Outgroup fbranch_speluncaeLin1_dtrios.txt speluncaeLin1.nwk 

# plot D-stats and f4ratio 
#conda activate dsuite
#ruby plot_f4ratio.rb allsamples_PCAfiltered_BBAA.txt plot_order.txt 0.2 allsamples_PCAfiltered_BBAA_f4ratio.svg
#ruby plot_d.rb allsamples_PCAfiltered_BBAA.txt popfile.txt 0.7 allsamples_PCAfiltered_BBAA_D.svg

#ruby plot_f4ratio.rb Onlyspeluncae_PCAfiltered_BBAA.txt Onlyspeluncae_PCAfiltered_plot_order.txt 0.2 Onlyspeluncae_PCAfiltered_BBAA_f4ratio.svg
#ruby plot_d.rb Onlyspeluncae_PCAfiltered_BBAA.txt Onlyspeluncae_PCAfiltered_popfile.txt 0.7 Onlyspeluncae_PCAfiltered_BBAA_D.svg
