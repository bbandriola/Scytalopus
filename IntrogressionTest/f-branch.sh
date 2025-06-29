# source https://github.com/millanek/Dsuite
# check https://github.com/mmatschiner/tutorials/blob/master/analysis_of_introgression_with_snp_data/README.md for more

# 1. run Dtrios
../../Softwares/Dsuite/Build/Dsuite Dtrios -t allsamples_PCAfiltered.nwk -o allsamples_PCAfiltered ../vcffiles/FinalVCFs/FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz popfile.txt
../../Softwares/Dsuite/Build/Dsuite Dtrios -t Onlyspeluncae_PCAfiltered.nwk -o Onlyspeluncae_PCAfiltered ../vcffiles/FinalVCFs/FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz Onlyspeluncae_PCAfiltered_popfile.txt

# 2. Fbranch  
../../Softwares/Dsuite/Build/Dsuite Fbranch -Z allsamples_PCAfiltered.nwk allsamples_PCAfiltered_tree.txt > fbranch_allsamples_PCAfiltered.txt
../../Softwares/Dsuite/Build/Dsuite Fbranch -Z Onlyspeluncae_PCAfiltered.nwk Onlyspeluncae_PCAfiltered_tree.txt > fbranch_Onlyspeluncae_PCAfiltered.txt

# 3. fbranch
../../Softwares/Dsuite/utils/dtools.py -n fbranch_allsamples_PCAfiltered --outgroup Outgroup fbranch_allsamples_PCAfiltered.txt allsamples_PCAfiltered.nwk 
../../Softwares/Dsuite/utils/dtools.py -n fbranch_Onlyspeluncae_PCAfiltered --outgroup Outgroup fbranch_Onlyspeluncae_PCAfiltered.txt Onlyspeluncae_PCAfiltered.nwk 

# plot D-stats and f4ratio 
#conda activate dsuite
ruby plot_f4ratio.rb allsamples_PCAfiltered_BBAA.txt plot_order.txt 0.2 allsamples_PCAfiltered_BBAA_f4ratio.svg
ruby plot_d.rb allsamples_PCAfiltered_BBAA.txt popfile.txt 0.7 allsamples_PCAfiltered_BBAA_D.svg

ruby plot_f4ratio.rb Onlyspeluncae_PCAfiltered_BBAA.txt Onlyspeluncae_PCAfiltered_plot_order.txt 0.2 Onlyspeluncae_PCAfiltered_BBAA_f4ratio.svg
ruby plot_d.rb Onlyspeluncae_PCAfiltered_BBAA.txt Onlyspeluncae_PCAfiltered_popfile.txt 0.7 Onlyspeluncae_PCAfiltered_BBAA_D.svg
