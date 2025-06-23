# source https://github.com/millanek/Dsuite
# first frun Dtrios
../../Softwares/Dsuite/Build/Dsuite Dtrios -t allsamples_PCAfiltered.nwk -o allsamples_PCAfiltered ../vcffiles/FinalVCFs/FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz popfile.txt
# then Fbranch  
../../Softwares/Dsuite/Build/Dsuite Fbranch -Z allsamples_PCAfiltered.nwk allsamples_PCAfiltered_tree.txt > fbranch_allsamples_PCAfiltered.txt
# plot fbranch
../../Softwares/Dsuite/utils/dtools.py -n fbranch_allsamples_PCAfiltered --outgroup Outgroup fbranch_allsamples_PCAfiltered.txt allsamples_PCAfiltered.nwk 

# look u for the next steps to plot D-stats and f4ratio  
# plot gene flow with f4-radio and D statistics
#conda activate ruby
#ruby plot_d.rb allsamples_PCAfiltered_BBAA.txt plot_order.txt 0.7 Lepidochelys_Ccar_run2_BBAA_D.svg
#ruby plot_f4ratio.rb Lepidochelys_Ccar_run2_BBAA.txt plot_order.txt 0.2 Lepidochelys_Ccar_run2_BBAA_f4ratio.svg
