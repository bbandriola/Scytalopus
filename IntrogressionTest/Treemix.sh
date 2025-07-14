# based on https://speciationgenomics.github.io/Treemix/ tutorial
# vcf to be used: Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.vcf.gz
# for run 2 use a vcf with novacapitalis as outgroup 
# bcftools view -s ^Ssuperciliaris,Sdiamantinensis,Spachecoi,Spetrophilus -Oz -o Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05_Snovacapitalusasoutgroup.recode.vcf.gz Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.vcf.gz

# 1. generate clst file from ADMIXTURE file
bcftools query -l ~/Scytalopus/vcffiles/FinalVCFs/Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.vcf.gz | awk '{split($1,pop,"."); print $1"\t"$1"\t"pop[2]}' > sspeluncae.clust

# 2. do the file conversion of the vcf to spectrum treemix input
vcf2treemix.sh ~/Scytalopus/vcffiles/FinalVCFs/Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.vcf.gz sspeluncae.clust

# 3. run treemix
# specify how many migration edges it should add
# run from 0 - 7, setting Ssuperciliaris as outgroup 
# conda activate Treemix
for i in {0..7}
do
 treemix -i ~/Scytalopus/vcffiles/FinalVCFs/Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.treemix.frq.gz -m $i -o Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.$i -root Ssuperciliaris -bootstrap -k 500 -noss > treemix_${i}_log &
done
