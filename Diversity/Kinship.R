# first generate kinshipmatrix with plink 
# plink2 --vcf FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz --make-king --out withPCAind

# Load required libraries
library(ggplot2)
library(reshape2)
library(tidyverse)

# Read the kinship matrix (assuming it's in a CSV file)
# Note: You may need to adjust the file path and decimal separator
kinship <- read.table("kinshipPCAfiltered.txt", header = TRUE, sep = "\t", 
                      dec = ".", row.names = 1, check.names = FALSE)

# Convert to matrix
kinship_mat <- as.matrix(kinship)

# Create a full symmetric matrix (fill upper triangle)
kinship_full <- kinship_mat
for(i in 1:nrow(kinship_full)){
  for(j in 1:ncol(kinship_full)){
    if(is.na(kinship_full[i,j])){
      kinship_full[i,j] <- kinship_full[j,i]
    }
  }
}

# Melt the matrix for ggplot
kinship_melted <- melt(kinship_full, na.rm = TRUE)

# Create triangular mask
kinship_melted$upper_tri <- NA
for(i in 1:nrow(kinship_melted)){
  row_name <- as.character(kinship_melted[i, "Var1"])
  col_name <- as.character(kinship_melted[i, "Var2"])
  if(which(rownames(kinship_full) == row_name) <= which(colnames(kinship_full) == col_name)){
    kinship_melted[i, "upper_tri"] <- kinship_melted[i, "value"]
  }
}

# Create the heatmap
pdf("kinship_heatmap.pdf",width = 10,height = 10)
ggplot(kinship_melted, aes(Var2, Var1, fill = upper_tri)) +
  geom_tile(color = "lightgray", linewidth = 0.3) +
  scale_fill_gradientn(
    colors = c("white", "pink", "red", "darkred"),
    values = scales::rescale(c(0, 0.1, 0.25, 0.5)),  # Anchor points for color transitions
    limits = c(0, 0.5),  # Strictly show 0-0.5 range
    oob = scales::squish,  # Force values outside limits to be squished
    na.value = "white",
    name = "Kinship",
    guide = guide_colorbar(
      nbin = 100,
      barheight = unit(50, "mm"),
      barwidth = unit(5, "mm")
    )
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.title = element_text(hjust = 0.5)
  ) +
  coord_fixed() +
  ggtitle("Kinship Matrix with Plink2.0") +
  # Add triangle indicator
  annotate("text", x = ncol(kinship_full)-0.5, y = 1.5, 
           label = "Upper Triangle", color = "gray50", size = 3)
dev.off()
