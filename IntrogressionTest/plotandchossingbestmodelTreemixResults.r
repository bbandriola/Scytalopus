# from https://speciationgenomics.github.io/Treemix/
library(RColorBrewer)
library(optM)
source("~/Softwares/Treemix/treemix/src/plotting_funcs.R")

setwd("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/Treemix/NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_superciliarisoutgroup/") # of course this needs to be adjusted
prefix="Ssuperciliarisoutgroup"

####################################
######## with treemix codes ########
####################################
source("~/Softwares/Treemix/treemix/src/plotting_funcs.R")

# plot tree
pdf("Spetrophilusoutgroup_mix1.pdf",10,10)
plot_tree(cex=0.8,"Spetrophilusoutgroup.1")
dev.off()

# plot residual 
pdf("Spetrophilusoutgroup_mix7residual.pdf",10,10)
plot_resid(stem="Spetrophilusoutgroup.7",pop_order="plotorder.txt")
dev.off()

#best model fit
optM("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/Treemix/FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_outgroupSnovacapitalis/",orientagraph=F,"bestmodelfit.tsv",method="Evanno")
