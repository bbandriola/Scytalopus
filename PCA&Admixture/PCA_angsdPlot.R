# PLOT angsd PCA 
# adapted from source: https://github.com/mfumagalli/ngsTools/blob/master/Scripts/plotPCA.R

library(ggplot2)

write.table(cbind(seq(1,68),rep(1,68),c(rep("outgroups",6),rep("lin7",3),rep("lin5",3),rep("lin3",3),rep("lin1",5),
                                        rep("lin6",1),rep("lin7",1),rep("lin3",1),rep("lin7",1),rep("lin3",1),rep("lin5",1),
                                        rep("lin3",2),rep("lin4",1),rep("lin7",1),rep("lin4",1),rep("lin5",2),rep("lin4",1),
                                        rep("lin5",2),rep("outgroups",1),rep("lin3",1),rep("lin4",1),rep("lin7",1),rep("lin1",4),
                                        rep("lin4",1),rep("lin7",1),rep("lin6",1),rep("lin7",1),rep("lin5",2),rep("lin4",1),
                                        rep("lin7",3),rep("lin2",1),rep("lin7",2),rep("lin3",1),rep("lin7",2),rep("lin2",1),
                                        rep("lin5",2),rep("lin7",1),rep("lin2",1),rep("lin7",1),rep("lin3",1),rep("outgroups",1))), 
            row.names=F, sep="\t", col.names=c("FID","IID","CLUSTER"), file="ALL.clst", quote=F)

covar <- read.table("allsamples_PCAangsd.cov",stringsAsFact=FALSE)                                                                                          
annot <- read.table("ALL.clst",sep="\t", header=TRUE)    
comp <- as.numeric(strsplit("1-2", "-", fixed = TRUE)[[1]])
out_file <- "allsamples_PCAANGSD.pdf"

# Eigenvalues
eig <- eigen(covar, symm=TRUE);
eig$val <- eig$val/sum(eig$val);
cat(signif(eig$val, digits=3)*100,"\n");

# Plot
PC <- as.data.frame(eig$vectors)
colnames(PC) <- gsub("V", "PC", colnames(PC))
PC$Pop <- factor(annot$CLUSTER)

title <- paste("PC",comp[1]," (",signif(eig$val[comp[1]], digits=3)*100,"%)"," / PC",comp[2]," (",signif(eig$val[comp[2]], digits=3)*100,"%)",sep="",collapse="")

x_axis = paste("PC",comp[1],sep="")
y_axis = paste("PC",comp[2],sep="")

# PCA <- ggplot() + geom_point(data=PC, aes_string(x=x_axis, y=y_axis, color="annot$CLUSTER"), size= 4) + coord_equal() + ggtitle(title) + scale_color_brewer(palette = "Paired") + theme_bw()

PCA <- ggplot(data = PC, aes_string(x = x_axis, y = y_axis, color = "annot$CLUSTER")) +
  geom_point(size = 3) +  # Adjust size as needed
  geom_text(aes(label = rownames(PC)), vjust = -0.5, size = 3, color = "gray",position = position_jitter(seed = 1, width = 0.02, height = 0.03)) +  # Add labels
  coord_equal() +
  ggtitle(title) +
  scale_color_brewer(palette = "Dark2") +  # Apply color palette
  theme_bw() +
  labs(color = "Lineage")  # Rename legend title if needed

ggsave(out_file)
unlink("Rplots.pdf", force=TRUE)
