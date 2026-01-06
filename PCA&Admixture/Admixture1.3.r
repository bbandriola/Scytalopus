## Workflow for admixture 

# 1. Generate a ped/map file (plink) from thinned vcf (1 snp every 25kb) 
# vcftools -gzvcf Thinned1SNPevery25kb_*.recode.vcf.gz --out Thinned1SNPevery25kb_*.recode --plink --remove-indv Sdiamantinensis,SerradaLontras5_lin1,Snovacapitalis,Spachecoi,Spetrophilus,SerradaLontras2_lin1,SerradaLontras3_lin1,SerraDaOuricana2_lin1,SerraDaOuricana3_lin1,SerraDaOuricana4_lin1,SerradaLontras4_lin1,SerraDaOuricana1_lin1,SerradaLontras1_lin1,Ssuperciliaris

# 2. generate the 012 file 
#plink --file Thinned1SNPevery25kb_prefix --out Thinned1SNPevery25kb_prefix --recode12

#3: K estimation with Adxmiture 1.3
#bash admixture_crossvalidation.sh
#	for K in 6 7 8 9 10 11 12 13 14 15;
#	do
#	echo "Running admixture for K$K..."
#	admixture --cv rec12.ped $K | tee log${K}.out
#	done

	#check the CV values over all the log files from the command above
#	grep -h CV log*.out

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

pdf("K11_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.11.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V12, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K12_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.12.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V13, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K13_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.13.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V14, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A","V=14"="#E78AC3"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K14_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.14.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V15, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A","V=14"="#E78AC3", 
               "V=15"="#E6AB02"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13",
               "K=14")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K15_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.15.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V16, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A","V=14"="#E78AC3", 
               "V=15"="#E6AB02","V=16"="#386CB0"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13",
               "K=14","K=15")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K16_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.16.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V17, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A","V=14"="#E78AC3", 
               "V=15"="#E6AB02","V=16"="#386CB0","V=17"="#762A83"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13",
               "K=14","K=15","K=16")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K17_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.17.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V18, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A","V=14"="#E78AC3", 
               "V=15"="#E6AB02","V=16"="#386CB0","V=17"="#762A83","V=18"="#7FC97F"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13",
               "K=14","K=15","K=16","K=17")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K18_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.18.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V19, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A","V=14"="#E78AC3", 
               "V=15"="#E6AB02","V=16"="#386CB0","V=17"="#762A83","V=18"="#7FC97F","V=19"="#FFFF99"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13",
               "K=14","K=15","K=16","K=17","K=18")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K19_ALLspecies.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.19.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V20, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#1B9E77","V=11"="#BEAED4","V=12"="#7570B3","V=13"="#E7298A","V=14"="#E78AC3", 
               "V=15"="#E6AB02","V=16"="#386CB0","V=17"="#762A83","V=18"="#7FC97F","V=19"="#FFFF99",
               "V=20"="#FD8D3C"),
    labels = c("K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13",
               "K=14","K=15","K=16","K=17","K=18","K=19")
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

########
