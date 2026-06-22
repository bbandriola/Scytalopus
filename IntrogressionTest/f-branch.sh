# source https://github.com/millanek/Dsuite
# check https://github.com/mmatschiner/tutorials/blob/master/analysis_of_introgression_with_snp_data/README.md for more

# 1. run Dtrios
# with novacapitalis as outgroup
~/Softwares/Dsuite/Build/Dsuite Dtrios -t Onlyspeluncae_PCAfiltered.nwk -o Onlyspeluncae_PCAfiltered ../snparcher/vcfs/ManuscriptVCFs/FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.vcf.gz Onlyspeluncae_PCAfiltered_popfile.txt
~/Softwares/Dsuite/Build/Dsuite Dtrios -t Onlyspeluncae_PCAfiltered_Devoniana.nwk -o Onlyspeluncae_PCAfiltered_Devoniana ../snparcher/vcfs/ManuscriptVCFs/FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.vcf.gz Onlyspeluncae_PCAfiltered_Devoniana_popfile.txt
~/Softwares/Dsuite/Build/Dsuite Dtrios -t Onlyspeluncae_PCAfiltered_Devoniana_hipo1.nwk -o Onlyspeluncae_PCAfiltered_Devoniana_hipo1 ../snparcher/vcfs/ManuscriptVCFs/FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.vcf.gz Onlyspeluncae_PCAfiltered_Devoniana_popfile.txt
~/Softwares/Dsuite/Build/Dsuite Dtrios -t Onlyspeluncae_PCAfiltered_Devoniana_hipo2.nwk -o Onlyspeluncae_PCAfiltered_Devoniana_hipo2 ../snparcher/vcfs/ManuscriptVCFs/FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.vcf.gz Onlyspeluncae_PCAfiltered_Devoniana_popfile.txt
~/Softwares/Dsuite/Build/Dsuite Dtrios -t Onlyspeluncae_PCAfiltered_mitofilo.nwk -o Onlyspeluncae_PCAfiltered_mitofilo .../snparcher/vcfs/ManuscriptVCFs/FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.vcf.gz Onlyspeluncae_PCAfiltered_Devoniana_popfile.txt

# 2. Fbranch  
~/Softwares/Dsuite/Build/Dsuite Fbranch -Z Onlyspeluncae_PCAfiltered.nwk Onlyspeluncae_PCAfiltered_dtrios_tree.txt > fbranch_Onlyspeluncae_PCAfiltered_dtrios.txt
~/Softwares/Dsuite/Build/Dsuite Fbranch -Z Onlyspeluncae_PCAfiltered_Devoniana.nwk Onlyspeluncae_PCAfiltered_Devoniana_dtrio_tree.txt > fbranch_Onlyspeluncae_PCAfiltered_Devoniana_dtrios.txt
~/Softwares/Dsuite/Build/Dsuite Fbranch -Z Onlyspeluncae_PCAfiltered_Devoniana_hipo1.nwk Onlyspeluncae_PCAfiltered_Devoniana_hipo1_dtrios_tree.txt > fbranch_Onlyspeluncae_PCAfiltered_Devoniana_hipo1_dtrios.txt
~/Softwares/Dsuite/Build/Dsuite Fbranch -Z Onlyspeluncae_PCAfiltered_Devoniana_hipo2.nwk Onlyspeluncae_PCAfiltered_Devoniana_hipo2_dtrios_tree.txt > fbranch_Onlyspeluncae_PCAfiltered_Devoniana_hipo2_dtrios.txt
~/Softwares/Dsuite/Build/Dsuite Fbranch -Z Onlyspeluncae_PCAfiltered_mitofilo.nwk Onlyspeluncae_PCAfiltered_mitofilo_dtrios_tree.txt > fbranch_Onlyspeluncae_PCAfiltered_mitofilo_dtrios.txt

# 3. fbranch
~/Softwares/Dsuite/utils/dtools.py -n fbranch_Onlyspeluncae_PCAfiltered_dtrios --outgroup Outgroup fbranch_Onlyspeluncae_PCAfiltered_dtrios.txt Onlyspeluncae_PCAfiltered.nwk 
~/Softwares/Dsuite/utils/dtools.py -n fbranch_Onlyspeluncae_PCAfiltered_Devoniana_dtrios --outgroup Outgroup fbranch_Onlyspeluncae_PCAfiltered_Devoniana_dtrios.txt Onlyspeluncae_PCAfiltered_Devoniana.nwk 
~/Softwares/Dsuite/utils/dtools.py -n fbranch_Onlyspeluncae_PCAfiltered_Devoniana_hipo1_dtrios --outgroup Outgroup fbranch_Onlyspeluncae_PCAfiltered_Devoniana_hipo1_dtrios.txt Onlyspeluncae_PCAfiltered_Devoniana_hipo1.nwk 
~/Softwares/Dsuite/utils/dtools.py -n fbranch_Onlyspeluncae_PCAfiltered_Devoniana_hipo2_dtrios --outgroup Outgroup fbranch_Onlyspeluncae_PCAfiltered_Devoniana_hipo2_dtrios.txt Onlyspeluncae_PCAfiltered_Devoniana_hipo2.nwk 
~/Softwares/Dsuite/utils/dtools.py -n fbranch_Onlyspeluncae_PCAfiltered_mitofilo_dtrios --outgroup Outgroup fbranch_Onlyspeluncae_PCAfiltered_mitofilo_dtrios.txt Onlyspeluncae_PCAfiltered_mitofilo.nwk

### plot in R 
#### BBAA file
#D_BBAA_noGF <- read.table("Onlyspelucae_Lin1Outgroup_Dtrios_BBAA.txt",as.is=T,header=T)
#D_BBAA_noGF[which(D_BBAA_noGF$Dstatistic > 0.03),]
#svg("Onlyspelucae_Lin1Outgroup_Dtrios_BBAA.svg",width = 10,height = 10)
#p1<-plot(p.adjust(D_BBAA_noGF$p.value,method="BH"), ylab="p value",xlab="Trio number",main = "BBAA file",ylim=c(0,0.05))
#p2<-plot(D_BBAA_noGF$f4.ratio, ylab="f4-ratio",xlab="trio number", ylim=c(0,1), main = "BBAA file")
#p3<-plot(D_BBAA_noGF$Dstatistic, ylab="D statistic",xlab="trio number", main = "BBAA file")
#dev.off()

####Dmin file
#DminF <- read.table("Onlyspelucae_Lin1Outgroup_Dtrios_Dmin.txt",as.is=T,header=T)
#svg("Onlyspelucae_Lin1Outgroup_Dtrios_Dmin.svg",width = 10,height = 10)
#p1<-plot(DminF$Dstatistic, ylab="D statistic",xlab="Trio number", main = "Dmin file" )
#p2<-plot(p.adjust(DminF$p.value,method="BH"), ylab="p value",xlab="Trio number", main = "Dmin file",ylim=c(0,0.05))
#p3<-plot(DminF$f4.ratio, ylab="f4-ratio",xlab="Trio number", ylim=c(0,1), main = "Dmin file")
#dev.off()

####Tree file
#Tree<- read.table("Onlyspelucae_Lin1Outgroup_Dtrios_tree.txt",as.is=T,header=T)
#svg("Onlyspelucae_Lin1Outgroup_Dtrios_tree.svg",width = 10,height = 10)
#p1<-plot(Tree$Dstatistic, ylab="D statistic",xlab="Trio number", main = "Tree file")
#p2<-plot(p.adjust(Tree$p.value,method="BH"), ylab="p value",xlab="Trio number", main = "Tree file",ylim=c(0,0.05))
#p3<-plot(Tree$f4.ratio, ylab="f4-ratio",xlab="Trio number", ylim=c(0,1), main = "Tree file")
#dev.off()

# plot in terminal 
#2.1: plot fbranch
/utils/dtools.py ~/Softwares/Dsuite/utils/dtools.py -n Onlyspelucae_Lin1Outgroup_Dtrios --outgroup Outgroup fbranch_Onlyspelucae_Lin1Outgroup_Dtrios_nozscore.txt Onlyspeluncae_PCAfiltered.nwk

#3: plot gene flow with f4-radio and D statistics
conda activate ruby
ruby plot_d.rb Onlyspelucae_Lin1Outgroup_Dtrios_BBAA.txt plot_order_Onlyspeluncae.txt 0.7 Onlyspelucae_Lin1Outgroup_Dtrios_BBAA_D.svg
ruby plot_f4ratio.rb Lepidochelys_Ccar_run2_BBAA.txt plot_order.txt 0.2 Lepidochelys_Ccar_run2_BBAA_f4ratio.svg
