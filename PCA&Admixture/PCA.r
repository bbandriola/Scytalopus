## Workflow to generate the PCA files 

# 1 -> Generate the PCA with plink 
# plink --allow-extra-chr --out project1_2_6_7_8 --pca --vcf /media/labgenoma4/DATAPART6/bandriola/Scytalopus/vcffiles/Filtered_mergedVCFproject1_2_6_7_8.vcf.gz 

# 2 -> Plot PCA in R 
# load package
library(readr)
library(tibble)
library(ggplot2)
library(ggrepel)
library(RColorBrewer)
library(tidyr)

# read in data
pca <- read_table2("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.eigenvec", col_names = FALSE)
eigenval <- scan("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.eigenval")

# set names
# remove ind names and let only lineages 
pca <- pca[,-1]
names(pca)[1] <- "Lineages"
names(pca)[2:ncol(pca)] <- paste0("PC", 1:(ncol(pca)-1))

# first convert to percentage variance explained
pve <- data.frame(PC = 1:20, pve = eigenval/sum(eigenval)*100)

# percentage of variance
pdf("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly_PCvariance.pdf",width = 10,height = 6)
a <- ggplot(pve, aes(PC, pve)) + geom_bar(stat = "identity")
a + ylab("Percentage variance explained") + theme_light()
dev.off()

# calculate the cumulative sum of the percentage variance explained
cumsum(pve$pve)

# plot pca circles
pdf("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly_PCA.pdf",width = 10,height = 10)
b <- ggplot(pca, aes(PC1, PC2, color = Lineages)) + 
  geom_point(position = position_jitter(seed = 1, width = 0.02, height=0.03),size = 6)+
  scale_color_manual(values = c("#0660FB","#4D9F8C","#7570B3","deeppink","#66A61D","#E93F33","#E6AC2F"))+
  coord_equal() + 
  theme_bw(base_size = 15) +
  theme(axis.title = element_text(size = 15),
    axis.title.x = element_text(size =15),  
    axis.title.y = element_text(size =15))+
    labs(fill = "Lineage")+
    theme(axis.ticks = element_line(colour = "gray60", size = 0.2),
    panel.grid.major = element_line(colour = "white", size = 0.2),
    panel.border = element_rect(colour = "gray60", fill = NA))
b + xlab(paste0("PC1(", signif(pve$pve[1], 3), "%)")) + ylab(paste0("PC2(", signif(pve$pve[2], 3), "%)"))+
  labs(color = "Lineage")+
  theme(axis.title.x = element_text(size =15),  
    axis.title.y = element_text(size =15))+
    labs(fill = "Lineage")
dev.off()

###############################################
########## with individual identification #####
###############################################

names(pca)[2] <- "lineages"
names(pca)[3:ncol(pca)] <- paste0("PC", 1:(ncol(pca)-1))

pdf("PCA_indIndetification.pdf",width = 10,height = 10)
b <- ggplot(pca, aes(PC1, PC2, color = lineages, label = pca$X1)) + 
  geom_text(position = position_jitter(seed = 1, width = 0.02, height = 0.03), 
            size = 4, show.legend = TRUE) +
  scale_color_brewer(palette = "Paired") +
  coord_equal() + 
  theme_bw(base_size = 20) +
  theme(axis.ticks = element_line(colour = "white", size = 0.3),
        panel.grid.major = element_line(colour = "white", size = 0.3),
        panel.grid.minor = element_blank())

b + xlab(paste0("PC1(", signif(pve$pve[1], 3), "%)")) + 
  ylab(paste0("PC2(", signif(pve$pve[2], 3), "%)")) +
  theme_bw(base_size = 20) +
  theme(axis.title.x = element_text(size = 20),  
        axis.title.y = element_text(size = 20))
dev.off()

# plot pca circles with transparency
pdf("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_LinSouth_PCA_blackborder.pdf",width = 10,height = 10)
b <- ggplot(pca, aes(PC1, PC2)) + 
  geom_point(aes(colour = Lineages),position = position_jitter(seed = 1, width = 0.03, height=0.04),size = 12,alpha = 0.6,stroke=1)+
  geom_point(aes(PC1, PC2),position = position_jitter(seed = 1, width = 0.03, height=0.04),colour = "black",shape = 1,size = 12, stroke=0.8,alpha = 0.6)+
  scale_color_manual(values = c("#00deff", "#7570B3", "#ff14d4", "#66A61D", 
                                "#E93F33", "#E6AC2F"))+
  coord_equal() + 
  theme_bw(base_size = 15) +
  theme(axis.title = element_text(size = 20),
    axis.title.x = element_text(size =20),  
    axis.title.y = element_text(size =20))+
    labs(fill = "Lineage")+
    theme(axis.ticks = element_line(colour = "gray60", size = 0.2),
    panel.grid.major = element_line(colour = "white", size = 0.2),
    panel.border = element_rect(colour = "gray60", fill = NA))
b + xlab(paste0("PC1(", signif(pve$pve[1], 3), "%)")) + ylab(paste0("PC2(", signif(pve$pve[2], 3), "%)"))+
  labs(color = "Lineage")+
  theme(axis.title.x = element_text(size =22),  
    axis.title.y = element_text(size =22))+
    labs(fill = "Lineage")
dev.off()

ggsave("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_LinSouth_PCA_colorfull.png", b, width=5, height=5)


# plot pca circles with transparency
pdf("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_LinSouth_PCA_colorfull.pdf",width = 10,height = 10)
b <- ggplot(pca, aes(PC1, PC2)) + 
  geom_point(aes(colour = Lineages),position = position_jitter(seed = 1, width = 0.03, height=0.04),size = 12,alpha = 0.6,stroke=1)+
#  geom_point(aes(PC1, PC2),position = position_jitter(seed = 1, width = 0.03, height=0.04),colour = "black",shape = 1,size = 12, stroke=0.8,alpha = 0.6)+
  scale_color_manual(values = c("#66A61D", "#E93F33", "#E6AC2F"))+
  coord_equal() + 
  theme_bw(base_size = 15) +
  theme(axis.title = element_text(size = 20),
    axis.title.x = element_text(size =20),  
    axis.title.y = element_text(size =20))+
    labs(fill = "Lineage")+
    theme(axis.ticks = element_line(colour = "gray60", size = 0.2),
    panel.grid.major = element_line(colour = "white", size = 0.2),
    panel.border = element_rect(colour = "gray60", fill = NA))
b + xlab(paste0("PC1(", signif(pve$pve[1], 3), "%)")) + ylab(paste0("PC2(", signif(pve$pve[2], 3), "%)"))+
  labs(color = "Lineage")+
  theme(axis.title.x = element_text(size =22),  
    axis.title.y = element_text(size =22))+
    labs(fill = "Lineage")
dev.off()
