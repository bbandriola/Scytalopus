# from https://speciationgenomics.github.io/Treemix/
library(RColorBrewer)
library(R.utils)
source("plotting_funcs.R")

setwd("~/Desktop/Projects/Sspeluncae/Analises/Treemix/") # of course this needs to be adjusted
prefix="Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05"

#plot all runs side by side
par(mfrow=c(2,3))
for(edge in 1:7){
  plot_tree(cex=0.8,paste0(prefix,".",edge))
  title(paste(edge,"edges"))
}

# plot the residuals 
for(edge in 1:7){
 plot_resid(stem=paste0(prefix,".",edge),pop_order="dogs.list")
}

####################################
######## with treemix codes ########
####################################
source("~/media/labgenoma4/DATAPART6/bandriola/Softwares/Treemix/treemix/src/plotting_funcs.R")

# plot tree
pdf("mix7.pdf",10,10)
plot_tree(cex=0.8,"Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.7")
dev.off()

# plot residual 
pdf("mix1residual.pdf",10,10)
plot_resid(stem="Thinned1000_maxmissin0.7_FilteredPCAandUCEandparentes_FilteredMax30missingDepthmin5_GeographicNames_allsamples_maf0.05.recode.1",pop_order="plotorder.txt")
dev.off()
