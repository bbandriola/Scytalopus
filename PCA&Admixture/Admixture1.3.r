## Workflow for admixture 

# 1. Generate a ped/map file (plink) from thinned vcftools
# vcftools --vcf NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_speluncaecomplex.recode.vcf --out #NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_speluncaecomplex --plink
# vcftools --vcf NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_speluncaecomplex.recode.vcf --out #NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_OnlySpeluncae --remove removeinds.txt --plink
# vcftools --vcf NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_speluncaecomplex.recode.vcf --out #NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_southOnly --keep keepsouthind.txt --plink


# 2. generate the 012 file 
# plink --file NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_speluncaecomplex --out NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_speluncaecomplex --recode12
# plink --file NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_OnlySpeluncae --out NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_OnlySpeluncae --recode12
# plink --file NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_southOnly --out NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_southOnly --recode12

# 3. run adxmiture with a bash file

# do
#   echo "Running admixture for K$K..."
#   admixture --cv /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/ManuscriptVCFs/NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_southOnly.ped $K | tee NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_southOnly.${K}.out
# done
# 
#         #check the CV values over all the log files from the command above
# grep -h CV NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_southOnly*.out

	#plot the Admixture graphics with the *12rec.#.Q

####### PLOT ######

# load tidyverse package
library(readr)
library(tibble)
library(ggplot2)
library(ggrepel)
library(RColorBrewer)
library(tidyr)

k = c(6:20)
cv1.err = c(0.42939,0.53406,0.56896,0.59632,0.50977,0.47235,0.42158,
            0.60191,0.59212,0.64720,0.78124,0.62473,0.43106,0.62745,0.58790)

pdf("CVK6-20_ALLspecies.pdf",)
plot(k,cv1.err, type="b",xlab = "K", ylab = "cross-validation error", main = "CV test for K=1-20",
     cex.main=1.5, cex.lab=1.5,yaxt="n",xaxt="n")
axis(1,cex.axis=1.3)
axis(2,cex.axis=1.3)
dev.off()

# R pallette to get the colors 
# > brewer.pal(n = 8, name = "Paired")
# [1] "#A6CEE3" "#1F78B4" "#B2DF8A" "#33A02C" "#FB9A99" "#E31A1C" "#FDBF6F" "#FF7F00"
# > brewer.pal(n = 8, name = "Set2")
# [1] "#66C2A5" "#FC8D62" "#8DA0CB" "#E78AC3" "#A6D854" "#FFD92F" "#E5C494" "#B3B3B3"

rowSums(tbl[, 2:7])

pdf("K6_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.6.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V7, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C"),
    labels = c("K=6")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K7_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.7.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V8, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F"),
    labels = c("K=6", "K=7")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
        
dev.off()

pdf("K8_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.8.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V9, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00"),
    labels = c("K=6", "K=7", "K=8")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K9_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.9.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V10, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77"),
    labels = c("K=6", "K=7", "K=8","K=9")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K10_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.10.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V11, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

# WIDER AXIS PLOT 
pdf("PCA_NorthcladeSspeluncae.pdf",width = 10,height = 10)
x_range <- range(pca$PC1)
x_padding <- diff(x_range) * 0.2  # Add 20% padding (adjust as needed)

# Apply wider x-axis limits while keeping coord_equal()
b <- ggplot(pca, aes(PC1, PC2, color = lineages, label = X1)) +  # Removed pca$ prefix
  geom_text(position = position_jitter(seed = 1, width = 0.02, height = 0.03), 
            size = 4, show.legend = TRUE) +
  scale_color_manual(values = c("#A6CEE3","#1F78B4","#B2DF8A","#33A02C")) +
  coord_equal() +  # Ensures 1:1 aspect ratio
  xlim(x_range[1] - x_padding, x_range[2] + x_padding) +  # Expand x-axis
  theme_bw(base_size = 15) +
  theme(axis.ticks = element_line(colour = "white", size = 0.3),
        panel.grid.major = element_line(colour = "white", size = 0.3),
        panel.grid.minor = element_blank())

# Final plot with axis labels
b + xlab(paste0("PC1(", signif(pve$pve[1], 3), "%)")) + 
  ylab(paste0("PC2(", signif(pve$pve[2], 3), "%)")) +
  theme_bw(base_size = 20) +
  theme(axis.title.x = element_text(size = 20),  
        axis.title.y = element_text(size = 20))
dev.off()

######################################
####### speluncae complex ############
######################################
# load tidyverse package
library(readr)
library(tibble)
library(ggplot2)
library(ggrepel)
library(RColorBrewer)
library(tidyr)

k = c(2:10)
cv1.err = c(0.44,0.40,0.41,0.47,0.44,0.55,0.62,0.68,0.69)

pdf("CVK2-10_SspeluncaeComplex.pdf",)
plot(k,cv1.err, type="b",xlab = "K", ylab = "cross-validation error", main = "CV test for K=2-10",
     cex.main=1.5, cex.lab=1.5,yaxt="n",xaxt="n")
axis(1,cex.axis=1.3)
axis(2,cex.axis=1.3)
dev.off()

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeComplex.1.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#66A61D"),
    labels = c("K=1")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K1_SspeluncaeComplex.png", plot = p, width = 14, height = 5)

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeComplex.2.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V3, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#0660FB","V3" = "#4D9F8C"),
    labels = c("K=1","K=2")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K2_SspeluncaeComplex.png", plot = p, width = 14, height = 5)


tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeComplex.3.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V4, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#0660FB","V3" = "#4D9F8C","V4" = "#7570B3"),
    labels = c("K=1","K=2","K=3")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K3_SspeluncaeComplex.png", plot = p, width = 14, height = 5)

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeComplex.4.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V5, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#4D9F8C","V3" = "#0660FB","V4" = "#7570B3","V5" = "deeppink"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K4_SspeluncaeComplex.png", plot = p, width = 14, height = 5)

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeComplex.5.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V6, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#66A61D","V3" = "#0660FB","V4" = "deeppink","V5" = "#7570B3", "V6" = "#4D9F8C"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K5_SspeluncaeComplex.png", plot = p, width = 14, height = 5)


tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeComplex.6.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V7, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#66A61D","V3" = "#0660FB","V4" = "deeppink",
    "V5" = "#7570B3", "V6" = "#4D9F8C","V7" = "red"),
    labels = c("K=1","K=2","K=3","K=4","K=5","K=6")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K6_SspeluncaeComplex.png", plot = p, width = 14, height = 5)

######################################
########### speluncae only ###########
# load tidyverse package
library(readr)
library(tibble)
library(ggplot2)
library(ggrepel)
library(RColorBrewer)
library(tidyr)

k = c(1:10)
cv1.err = c(0.53,0.96,0.44,0.45,0.47,0.54,0.61,0.70,0.76,0.62)

pdf("CVK1-10_Sspeluncaeonly.pdf",)
plot(k,cv1.err, type="b",xlab = "K", ylab = "cross-validation error", main = "CV test for K=1-10",
     cex.main=1.5, cex.lab=1.5,yaxt="n",xaxt="n")
axis(1,cex.axis=1.3)
axis(2,cex.axis=1.3)
dev.off()

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.1.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#4D9F8C"),
    labels = c("K=1")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K1_SspeluncaeOnly.png", plot = p, width = 14, height = 5)

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.2.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V3, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#66A61D","V3" = "#7570B3"),
    labels = c("K=1","K=2")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K2_SspeluncaeOnly.png", plot = p, width = 14, height = 5)


tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.3.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V4, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#7570B3","V3" = "deeppink","V4" = "#66A61D"),
    labels = c("K=1","K=2","K=3")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank(),
	axis.title.x = element_text(size = 14, face = "bold"),
  	axis.title.y = element_text(size = 14, face = "bold")
  )
ggsave("K3_SspeluncaeOnly.png", plot = p, width = 20, height = 5)

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.4.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V5, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#66A61D","V3" = "#E6AC2F","V4" = "deeppink","V5" = "#7570B3"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank(),
	axis.title.x = element_text(size = 14, face = "bold"),
  	axis.title.y = element_text(size = 14, face = "bold")
  )
ggsave("K4_SspeluncaeOnly.png", plot = p, width = 20, height = 5)

tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.5.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V6, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#7570B3","V3" = "#E93F33","V4" = "#E6AC2F","V5" = "#66A61D", "V6" = "deeppink"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank(),
	axis.title.x = element_text(size = 14, face = "bold"),
  	axis.title.y = element_text(size = 14, face = "bold")
  )
ggsave("K5_SspeluncaeOnly.png", plot = p, width = 20, height = 5)


tbl=read.table("Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.6.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V7, names_to = "K", values_to = "Proportion")
p<-ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#4D9F8C","V3" = "red","V4" = "#66A61D","V5" = "deeppink", 
    "V6" = "#7570B3","V7" = "#E6AC2F"),
    labels = c("K=1","K=2","K=3","K=4","K=5","K=6")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
ggsave("K6_SspeluncaeOnly.png", plot = p, width = 14, height = 5)

########
