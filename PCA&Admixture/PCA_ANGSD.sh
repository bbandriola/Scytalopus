# Commands to run PCA with angsd based on genotype likelihoods 
# based on https://www.popgen.dk/software/index.php/PCAngsd

# 1-> Generate genotype likelihoods
angsd -b bamlist_onlySspeluncae.txt -ref /media/labgenoma4/DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/GCA_013400415.1_ASM1340041v1_genomic.fa -out onlySspeluncae_PCAfiltered_IndMind5_Maxdepth100 -setMinDepthInd 5 -setMaxDepthInd 100 -GL 2 -nThreads 2 -doGlf 2 -doMajorMinor 1 -doMaf 1 -only_proper_pairs 1 -remove_bads 1 -uniqueOnly 1 -setMinDepth 100 -setMaxDepth 3000 -SNP_pval 1e-3c -doCounts 1
#-setMinDepth 40 (1/3 da cobertura total)
#-setMaxDepth 480 (3X a cobertura total)

# 2-> Generate PCA and Adxmiture with PCAangsd
pcangsd --beagle ../../vcffiles/ANGSD_vcf/allsamples_IndMind5_Maxdepth100.beagle.gz --eig 2 --threads 5 --out allsamples_PCAangsd -inbreedSamples --admix 
pcangsd --beagle onlySspeluncae_PCAfiltered_IndMind5_Maxdepth100.beagle.gz --eig 2 --threads 5 --out onlySspeluncae_PCAfiltered_IndMind5_Maxdepth100 --admix --tree
