# 1step.sh
# pop 1
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop1$i.smc.gz $i pop1:SerradaLontras1_lin1,SerradaLontras2_lin1,SerradaLontras3_lin1,SerradaLontras4_lin1,SerradaLontras5_lin1,SerraDaOuricana1_lin1,SerraDaOuricana2_lin1,SerraDaOuricana3_lin1,SerraDaOuricana4_lin1
done
# pop 2 caparao
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop2$i.smc.gz $i pop2:SerraDosOrgaos3_lin2
done
# pop 3 mantiqueira
for i in $(cat /media/labgenoma5/DATAPART3/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop3mantiqueira$i.smc.gz $i pop3mantiqueira:NorteMantiqueira1_lin3,NorteMantiqueira2_lin3,NorteMantiqueira3_lin3,NorteMantiqueira4_lin3,SulMantiqueira2_lin3,SulMantiqueira3_lin3,SulMantiqueira4_lin3,SulMantiqueira5_lin3
done
# pop 3 caparao
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop3caparao$i.smc.gz $i pop3caparao:Caparao_lin3
done
# pop 4
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop4$i.smc.gz $i pop4:BocainaSerraDoMarRJ1_lin4,BocainaSerraDoMarRJ3_lin4,BocainaSerraDoMarRJ4_lin4,CunhaSerraDoMarRJ2_lin4
done
# pop 5
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop5$i.smc.gz $i pop5:DevonianaPR2_lin5,DevonianaPR3_lin5,DevonianaPR4_lin5,DevonianaPR6_lin5,DevonianaPR7_lin5,DevonianaPR8_lin5,DevonianaSP1_lin5,DevonianaSP2_lin5,DevonianaSP3_lin5,DevonianaSP4_lin5,NortePR1_lin7,NortePR2_lin7,NortePR4_lin7 
done
# pop 6/7
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop6$i.smc.gz $i pop6:BoaEsperanca1_lin6,BoaEsperanca2_lin6,BoaEsperanca3_lin7
done 
# pop 7 PCA no inbred
for i in $(cat /media/labgenoma4/DATAPART6/bandriola/Scytalopus/SummaryStats/fst/1Mscaffolds.txt); do
    smc++ vcf2smc ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz pop7PCAnoH$i.smc.gz $i pop7PCAnoH:ExtremoSulRS2_lin7,ExtremoSulRS3_lin7,ExtremoSulSC1_lin7,CentroLesteSC1_lin7,CentroOesteSC1_lin7,CentroOesteSC2_lin7,CentroOesteSC3_lin7,CentroOesteSC4_lin7,CentroOesteSC5_lin7
done 
# 2step.sh
