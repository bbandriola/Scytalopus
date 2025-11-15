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

# 3. run treemix
# specify how many migration edges it should add
# run from 0 - 7, setting Ssuperciliaris as outgroup 
# conda activate Treemix
for i in {0..7}
do
 treemix -i *.treemix.frq.gz -m $i -o *.$i -root Ssuperciliaris -bootstrap -k 500 -noss > treemix_${i}_log &
done
