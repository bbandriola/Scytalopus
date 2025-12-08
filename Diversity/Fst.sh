# Fst with vcftools 
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin1.txt --weir-fst-pop ../../../lin2.txt --out fstlin1_lin2
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin1.txt --weir-fst-pop ../../../lin3.txt --out fstlin1_lin3
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin1.txt --weir-fst-pop ../../../lin4.txt --out fstlin1_lin4
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin1.txt --weir-fst-pop ../../../lin57.txt --out fstlin1_lin57
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin1.txt --weir-fst-pop ../../../lin6.txt --out fstlin1_lin6
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin1.txt --weir-fst-pop ../../../lin7.txt --out fstlin1_lin7
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin2.txt --weir-fst-pop ../../../lin3.txt --out fstlin2_lin3
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin2.txt --weir-fst-pop ../../../lin4.txt --out fstlin2_lin4
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin2.txt --weir-fst-pop ../../../lin57.txt --out fstlin2_lin57
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin2.txt --weir-fst-pop ../../../lin6.txt --out fstlin2_lin6
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin2.txt --weir-fst-pop ../../../lin7.txt --out fstlin2_lin7
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin3.txt --weir-fst-pop ../../../lin4.txt --out fstlin3_lin4
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin3.txt --weir-fst-pop ../../../lin57.txt --out fstlin3_lin57
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin3.txt --weir-fst-pop ../../../lin6.txt --out fstlin3_lin6
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin3.txt --weir-fst-pop ../../../lin7.txt --out fstlin3_lin7
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin4.txt --weir-fst-pop ../../../lin57.txt --out fstlin4_lin57
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin4.txt --weir-fst-pop ../../../lin6.txt --out fstlin4_lin6
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin4.txt --weir-fst-pop ../../../lin7.txt --out fstlin4_lin7
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin57.txt --weir-fst-pop ../../../lin6.txt --out fstlin57_lin6
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin57.txt --weir-fst-pop ../../../lin7.txt --out fstlin57_lin7 
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin6.txt --weir-fst-pop ../../../lin7.txt --out fstlin6_lin7
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin57.txt --weir-fst-pop ../../../lin7.txt --out fstlin57_lin7 
vcftools --gzvcf ../../../../snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.gz --weir-fst-pop ../../../lin6.txt --weir-fst-pop ../../../lin7.txt --out fstlin6_lin7
  # heatmap with the result 
  Rscript heatmap.r

# Fst with pixy according hudson method (ref:https://www.biorxiv.org/content/10.1101/2024.09.24.614506v1.full)
#pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations AllSspeluncaePops.txt --window_size 100000 --n_cores 4 --output_prefix AllSspeluncaePops_WithoutLin1_FstHudson --fst_type hudson --bypass_invariant_check 'yes'
  # between populations according PCA
#  pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations Lin3A3B.txt --window_size 50000 --n_cores 1 --output_prefix Lin3A3B_FstHudson --fst_type hudson --bypass_invariant_check 'yes'
#  pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations Lin3A3B.txt --window_size 100000 --n_cores 1 --output_prefix Lin3A3B_FstHudson --fst_type hudson --bypass_invariant_check 'yes'
#  pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations Lin67Lin7.txt --window_size 100000 --n_cores 1 --output_prefix Lin67Lin7_FstHudson --fst_type hudson --bypass_invariant_check 'yes'
#  pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations Lin5Lin7.txt --window_size 100000 --n_cores 1 --output_prefix Lin5Lin7_FstHudson --fst_type hudson --bypass_invariant_check 'yes'
#  pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations Lin5Lin67.txt --window_size 100000 --n_cores 1 --output_prefix Lin5Lin67_FstHudson --fst_type hudson --bypass_invariant_check 'yes'
#  pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations Lin4A4B.txt --window_size 100000 --n_cores 1 --output_prefix Lin4A4B_FstHudson --fst_type hudson --bypass_invariant_check 'yes'
  
# Fst with pixy according WC method
# pixy --stats fst --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz --populations AllSspeluncaePops.txt --window_size 100000 --n_cores 2 --output_prefix AllSspeluncaePops_WithoutLin1_FstWC_pixy --bypass_invariant_check 'yes'

## run FST com vcftools com o novo vcf 
# labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz


# Fst per scaffold: 
# lins: Lin3A3B, Lin4A4B, Lin67Lin7, Lin5Lin7, Lin5Lin67, Lin5Lin2, Lin67Lin2, Lin7Lin2, Lin2Lin3, Lin2Lin4, Lin3Lin4, 
#for i in $(cat 1Mscaffolds.txt); do
#    pixy --stats fst \
#         --vcf ../../vcffiles/FinalVCFs/OnlySspeluncae_WithoutLin1_FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames.vcf.gz \
#         --populations Lin7Lin2.txt \
#         --chromosomes $i \
#         --window_size 50000 \
#         --n_cores 1 \
#         --output_prefix Lin7Lin2_WC_$i \
#         --output_folder Lin7Lin2/ \
#         --bypass_invariant_check 'yes'
#done

# Simon martin script to estimate FST DXY and PI simultaneously
# 1. convert vcf into geno format 
#python parseVCF.py --skipIndels --ploidyMismatchToMissing -i /media/labgenoma5/DATAPART6/bandriola/Scytalopus/vcffiles/FinalVCFs/Onlybigger500kscaffold_OnlySspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100LD0.1_GeographicNames_allsamples.vcf.gz | gzip > Onlybigger500kscaffold_OnlySspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100LD0.1_GeographicNames_allsample.geno

# 2. calculate fst,dxy and pi between all populations
#python popgenWindows.py -g Onlybigger500kscaffold_OnlySspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100LD0.1_GeographicNames_allsample.geno.gz -o ./Onlybigger500kscaffold_OnlySspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100LD0.1.Fst.Dxy.pi.csv.gz -f phased -w 50000 -m 20 -s 5000 -p Lin1 -p Lin2 -p Lin3 -p Lin4 -p Lin5 -p Lin6 -p Lin7 --popsFile popfile.txt 2> popgenWindows.log

# teste com vcftools 
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin1.txt --weir-fst-pop lin2.txt --out fstlin1_lin2_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin1.txt --weir-fst-pop lin3.txt --out fstlin1_lin3_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin1.txt --weir-fst-pop lin4.txt --out fstlin1_lin4_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin1.txt --weir-fst-pop lin57.txt --out fstlin1_lin57_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin1.txt --weir-fst-pop lin6.txt --out fstlin1_lin6_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin1.txt --weir-fst-pop lin7.txt --out fstlin1_lin7_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin2.txt --weir-fst-pop lin3.txt --out fstlin2_lin3_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin2.txt --weir-fst-pop lin4.txt --out fstlin2_lin4_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin2.txt --weir-fst-pop lin57.txt --out fstlin2_lin57_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin2.txt --weir-fst-pop lin6.txt --out fstlin2_lin6_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin2.txt --weir-fst-pop lin7.txt --out fstlin2_lin7_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin3.txt --weir-fst-pop lin4.txt --out fstlin3_lin4_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin3.txt --weir-fst-pop lin57.txt --out fstlin3_lin57_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin3.txt --weir-fst-pop lin6.txt --out fstlin3_lin6_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin3.txt --weir-fst-pop lin7.txt --out fstlin3_lin7_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin4.txt --weir-fst-pop lin57.txt --out fstlin4_lin57_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin4.txt --weir-fst-pop lin6.txt --out fstlin4_lin6_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin4.txt --weir-fst-pop lin7.txt --out fstlin4_lin7_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin57.txt --weir-fst-pop lin6.txt --out fstlin57_lin6_FstWC_vcftools
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin57.txt --weir-fst-pop lin7.txt --out fstlin57_lin7_FstWC_vcftools 
vcftools --gzvcf /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/FilteredPCAandUCE_Max30missingDepthmin10LD0.15_GeographicNames_allsamples.vcf.gz --fst-window-size 50000 --fst-window-step 5000 --weir-fst-pop lin6.txt --weir-fst-pop lin7.txt --out fstlin6_lin7_FstWC_vcftools
