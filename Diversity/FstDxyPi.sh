# estimation of nucleotide diversity
# pixy 
pixy --stats pi fst --vcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --populations speluncae_file.txt --window_size 100000 --n_cores 4 --output_prefix Speluncae.100000win_pixy_fstPluspi

# Fst with vcftools 
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin1.txt --weir-fst-pop lin3.txt --out fstlin1_lin3
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin1.txt --weir-fst-pop lin4.txt --out fstlin1_lin4
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin1.txt --weir-fst-pop lin5.txt --out fstlin1_lin5
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin1.txt --weir-fst-pop lin6.txt --out fstlin1_lin6
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin1.txt --weir-fst-pop lin7.txt --out fstlin1_lin7
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin2.txt --weir-fst-pop lin3.txt --out fstlin2_lin3
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin2.txt --weir-fst-pop lin4.txt --out fstlin2_lin4
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin2.txt --weir-fst-pop lin5.txt --out fstlin2_lin5
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin2.txt --weir-fst-pop lin6.txt --out fstlin2_lin6
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin2.txt --weir-fst-pop lin7.txt --out fstlin2_lin7
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin3.txt --weir-fst-pop lin4.txt --out fstlin3_lin4
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin3.txt --weir-fst-pop lin5.txt --out fstlin3_lin5
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin3.txt --weir-fst-pop lin6.txt --out fstlin3_lin6
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin3.txt --weir-fst-pop lin7.txt --out fstlin3_lin7
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin4.txt --weir-fst-pop lin5.txt --out fstlin4_lin5
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin4.txt --weir-fst-pop lin6.txt --out fstlin4_lin6
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin4.txt --weir-fst-pop lin7.txt --out fstlin4_lin7
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin5.txt --weir-fst-pop lin6.txt --out fstlin5_lin6
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin5.txt --weir-fst-pop lin7.txt --out fstlin5_lin7 
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --fst-window-size 50000 --fst-window-step 10000 --weir-fst-pop lin6.txt --weir-fst-pop lin7.txt --out fstlin6_lin7
