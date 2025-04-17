## Workflow to generate the PCA files 

# 1 -> Generate the PCA with plink 
# plink --allow-extra-chr --out project1_2_6_7_8 --pca --vcf /media/labgenoma4/DATAPART6/bandriola/Scytalopus/vcffiles/Filtered_mergedVCFproject1_2_6_7_8.vcf.gz 

# 2 -> Plot PCA in R 
# load package
library(readr)
library(tibble)
library(ggplot2)
library(ggrepel)

# read in data
pca <- read_table2("project1_2_6_7_8.eigenvec", col_names = FALSE)
eigenval <- scan("project1_2_6_7_8.eigenval")

# set names
# remove ind names and let only lineages 
pca <- pca[,-1]
names(pca)[1] <- "lineages"
names(pca)[2:ncol(pca)] <- paste0("PC", 1:(ncol(pca)-1))

# first convert to percentage variance explained
pve <- data.frame(PC = 1:20, pve = eigenval/sum(eigenval)*100)

# percentage of variance
pdf("PCvariance.pdf",width = 10,height = 6)
a <- ggplot(pve, aes(PC, pve)) + geom_bar(stat = "identity")
a + ylab("Percentage variance explained") + theme_light()
dev.off()

# calculate the cumulative sum of the percentage variance explained
cumsum(pve$pve)

# plot pca
pdf("PCA.pdf",width = 10,height = 10)
b <- ggplot(pca, aes(PC1, PC2, color = lineages)) + 
  geom_point(position = position_jitter(seed = 1, width = 0.02, height=0.03),size = 4)+
  scale_color_brewer(palette = "Paired") +
  #scale_color_viridis_d(option = "D")  + 
  coord_equal() + 
  theme_bw(base_size = 20) +
  theme (axis.ticks = element_line(colour = "white", size = 0.3),
         panel.grid.major = element_line(colour = "white", size = 0.3),
         panel.grid.minor = element_blank()
  )
b + xlab(paste0("PC1(", signif(pve$pve[1], 3), "%)")) + ylab(paste0("PC2(", signif(pve$pve[2], 3), "%)"))+
  theme_bw(base_size = 20)+
  theme(#axis.title = element_text(size = 20),
    axis.title.x = element_text(size =20),  
    axis.title.y = element_text(size =20))

dev.off()
