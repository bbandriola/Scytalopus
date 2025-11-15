# from https://speciationgenomics.github.io/Treemix/
library(RColorBrewer)
library(R.utils)
source("~/Softwares/Treemix/treemix/src/plotting_funcs.R")

setwd("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/Treemix/NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_superciliarisoutgroup/") # of course this needs to be adjusted
prefix="Ssuperciliarisoutgroup"

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
source("~/Softwares/Treemix/treemix/src/plotting_funcs.R")

# plot tree
pdf("mix7.pdf",10,10)
plot_tree(cex=0.8,"Ssuperciliarisoutgroup.7")
dev.off()

# plot residual 
pdf("mix1residual.pdf",10,10)
plot_resid(stem="Ssuperciliarisoutgroup.1",pop_order="plotorder.txt")
dev.off()
