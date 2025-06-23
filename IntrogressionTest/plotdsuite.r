####BBAA file
D_BBAA_noGF <- read.table("allsamples_PCAfiltered_BBAA.txt",as.is=T,header=T)
D_BBAA_noGF[which(D_BBAA_noGF$Dstatistic > 0.03),]
plot(p.adjust(D_BBAA_noGF$p.value,method="BH"), ylab="p value",xlab="Trio number",main = "BBAA file",ylim=c(0,0.05))
plot(D_BBAA_noGF$f4.ratio, ylab="f4-ratio",xlab="trio number", ylim=c(0,1), main = "BBAA file")
plot(D_BBAA_noGF$Dstatistic, ylab="D statistic",xlab="trio number", main = "BBAA file")

####Dmin file
DminF <- read.table("allsamples_PCAfiltered_Dmin.txt",as.is=T,header=T)
plot(DminF$Dstatistic, ylab="D statistic",xlab="Trio number", main = "Dmin file" )
plot(p.adjust(DminF$p.value,method="BH"), ylab="p value",xlab="Trio number", main = "Dmin file",ylim=c(0,0.05))
plot(DminF$f4.ratio, ylab="f4-ratio",xlab="Trio number", ylim=c(0,1), main = "Dmin file")

####Tree file
Tree<- read.table("allsamples_PCAfiltered_tree.txt",as.is=T,header=T)
plot(Tree$Dstatistic, ylab="D statistic",xlab="Trio number", main = "Tree file")
plot(p.adjust(Tree$p.value,method="BH"), ylab="p value",xlab="Trio number", main = "Tree file",ylim=c(0,0.05))
plot(Tree$f4.ratio, ylab="f4-ratio",xlab="Trio number", ylim=c(0,1), main = "Tree file")
