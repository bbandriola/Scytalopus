# split estimation with SMC++
# go throught the following lines to finish the workflow 
# smc++ vcf2smc my.vcf.gz data/pop1.smc.gz <contig> pop1:ind1_1,ind1_2
# smc++ vcf2smc my.vcf.gz data/pop12.smc.gz <contig> pop1:ind1_1,ind1_2 pop2:ind2_1,ind2_2
# smc++ split -o split/ pop1/model.final.json pop2/model.final.json data/*.smc.gz
# smc++ plot joint.pdf split/model.final.json

# conda activate python2smc++

# 1. convert VCF from each sccafold for smc format including oone population
# pop 5
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ~/Scytalopus/vcffiles/FinalVCFs/FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz pop5$i.smc.gz $i pop5:DevonianaPR2_lin5,DevonianaPR3_lin5,DevonianaPR4_lin5,DevonianaPR5_lin5,DevonianaPR6_lin5,DevonianaPR7_lin5,DevonianaPR8_lin5,DevonianaSP1_lin5,DevonianaSP2_lin5,DevonianaSP3_lin5,DevonianaSP4_lin5,NortePR1_lin7,NortePR2_lin7,NortePR3_lin7,NortePR4_lin7,NortePR5_lin7 
done 
# pop 7
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ~/Scytalopus/vcffiles/FinalVCFs/FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz pop7$i.smc.gz $i pop7:CentroLestePR1_lin7,CentroLesteSC1_lin7,CentroOesteSC1_lin7,CentroOesteSC2_lin7,CentroOesteSC3_lin7,CentroOesteSC4_lin7,CentroOesteSC5_lin7,ExtremoSulRS2_lin7,ExtremoSulRS3_lin7,ExtremoSulSC1_lin7,HCentroLesteSC_lin7 
done 
# pop 6/7
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ~/Scytalopus/vcffiles/FinalVCFs/FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz pop67$i.smc.gz $i pop67:BoaEsperanca1_lin6,BoaEsperanca2_lin6,BoaEsperanca3_lin7
done 

