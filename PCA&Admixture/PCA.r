## Workflow to generate the PCA files 

# 1 -> Generate the PCA with plink 
# plink --allow-extra-chr --out project1_2_6_7_8 --double-id --pca --vcf /media/labgenoma4/DATAPART6/bandriola/Scytalopus/vcffiles/Filtered_mergedVCFproject1_2_6_7_8.vcf.gz 

# Lineage colors:
# Lin1: "#0660FB"
# Lin2: "#00deff"
# Lin3: "#7570B3"
# Lin4: "#ff14d4"
# Lin5: "#66A61D"
# Lin6: "#E93F33"
# Lin7: "#E6AC2F"

# 2 -> Plot PCA in R 
# load package
library(readr)
library(tibble)
library(ggplot2)
library(ggrepel)
library(RColorBrewer)
library(tidyr)


base_name <- "LDfiltered_Zscaffolds_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_Onlyspeluncae"

pca <- read_table2(paste0(base_name, ".eigenvec"), col_names = FALSE)
eigenval <- scan(paste0(base_name, ".eigenval"))

pca <- pca[,-1]
pca <- pca %>%
  separate(col = 1, into = c("Ind", "Lineages"), sep = "_")
names(pca)[3:ncol(pca)] <- paste0("PC", 1:(ncol(pca)-1))

pve <- data.frame(PC = 1:20, pve = eigenval/sum(eigenval)*100)
# percentage of variance
pdf(paste0(base_name, ".PCvariance.pdf"),width = 10,height = 6)
a <- ggplot(pve, aes(PC, pve)) + geom_bar(stat = "identity")
a + ylab("Percentage variance explained") + theme_light()
dev.off()
# calculate the cumulative sum of the percentage variance explained
cumsum(pve$pve)
pdf(paste0(base_name,".PCA.pdf"),width = 10,height = 10)
b <- ggplot(pca, aes(PC1, PC2)) + 
  geom_point(aes(colour = Lineages),position = position_jitter(seed = 1, width = 0.03, height=0.04),size = 9,alpha = 0.7,stroke=1.5)+
  #geom_point(aes(PC1, PC2),position = position_jitter(seed = 1, width = 0.03, height=0.04),shape = 1,size = 12, stroke=0.8,alpha = 0.6)+
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

ggsave(paste0(base_name, ".PCA.png"), b, width=10, height=10)

###############################################
########## with individual identification #####
###############################################

pdf((paste0(base_name,".PCA_indIndetification.pdf"),width = 10,height = 10)
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
####################################################################################
