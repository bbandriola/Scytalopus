# based on https://speciationgenomics.github.io/Treemix/ tutorial
conda activate treemix
# packages to be installed 
# plink, vcftools, bcftools, 
# conda activate treemix 
# python must be version=2
# 1. generate clst file from ADMIXTURE file
bcftools query -l *.vcf.gz | awk '{split($1,pop,"."); print $1"\t"$1"\t"pop[2]}' > sspeluncae.clust

# 2. do the file conversion of the vcf to spectrum treemix input
# https://github.com/speciationgenomics/scripts/blob/master/vcf2treemix.sh
# the plink2treemix.py must be executable and the oython version is python2
./vcf2treemix.sh *.vcf.gz sspeluncae.clust
# had to stop when the command ask for the python script and change for the python 2 environment, than went back to the treemix env and kept to the rest of the script

# 3. run treemix
# specify how many migration edges it should add
# run from 0 - 7, setting Ssuperciliaris as outgroup 
# conda activate Treemix
for m in {0..7}; do
  for rep in {1..3}; do
    treemix \
      -i FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis.recode.treemix.frq.gz \
      -o SnovacapitalisOutgroup${m}_rep${rep} \
      -m $m \
      -k 500 \
      -noss \
      -root Snovacapitalis
  done
done
