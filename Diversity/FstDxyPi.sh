# estimation of nucleotide diversity
# pixy 
pixy --stats pi fst --vcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject1_2_5_6_7_8.vcf.gz --populations speluncae_file.txt --window_size 100000 --n_cores 4 --output_prefix Speluncae.100000win_pixy_fstPluspi
