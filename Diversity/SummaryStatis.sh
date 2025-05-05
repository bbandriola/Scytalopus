# missing per ind:
vcftools --gzvcf OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --missing-indv --out OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8

# densidade de SNVs
# definition: Allelic richness was defined as the number of alleles at a locus
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --SNPdensity 100000 --out SNVdensity_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8
  # to calculate the SNP density through all samples, do a loop to generate independents output from each sample in the VCF file
  # following Henrique's tutorial: https://github.com/henriquevf/Tutorials/blob/main/SNP%20density%20tutorial.md
  # 1. generate density per ind
  #!/bin/bash
  echo "activate conda"
  conda activate bcftools
  echo "starting analyses"
  vcf_file="../../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz"
  # Get the base name for output files
  name=$(basename $vcf_file)
  name=${name%.vcf.gz}
  # First get the list of samples from the VCF file
  samples=$(bcftools query -l $vcf_file)
  # Iterate over each sample
  for sample in $samples; do
      # Process each sample individually
      vcftools --gzvcf $vcf_file --indv $sample --SNPdensity 1000000 --out ${sample}_SNPsDensity
  done
  echo "done"
  # 2. 

# het 
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --hardy --out HETstats_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8
# het per individual
bcftools stats -s - ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz > HetOnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.txt

# inbreeding coefficient
vcftools --gzvcf ../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --het --out Fstats_OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8

# nucleotidy diversity 
pixy --stats pi --vcf ../../vcffiles/OnlySspeluncae_FilteredMax30missingDepthmin5_mergedVCFproject0_1_2_4_5_6_7_8.vcf.gz --window_size 1000000 --n_cores 4 --output_prefix PiIndividuals.txt --population populations_speluncae.txt --bypass_invariant_check 'yes'
