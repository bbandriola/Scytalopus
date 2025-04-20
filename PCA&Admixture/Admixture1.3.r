## Workflow for admixture 

# 1. Generate a ped/map file (plink) from thinned vcf (1 snp every 25kb)
## all individuals 
#vcftools --vcf ../vcffiles/Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz.recode.vcf --out Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8 --plink 
## only speluncae 
vcftools --vcf ../vcffiles/Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.vcf.gz.recode.vcf --out Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8 --plink --remove-indv 

# 2. generate the 012 file 
#plink --file Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8 --out Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8 --recode12

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

pdf("CVK6-20.pdf",)
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

pdf("K6.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.6.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V7, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C"),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K7.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.7.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V8, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" ),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6", "K=7")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
        
dev.off()

pdf("K8.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.8.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V9, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00"),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6", "K=7", "K=8")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K9.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.9.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V10, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#66C2A5"),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6", "K=7", "K=8","K=9")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K10.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.10.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V11, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#66C2A5","V=11"="#FC8D62"),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6", "K=7", "K=8","K=9","K=10")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K11.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.11.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V12, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#66C2A5","V=11"="#FC8D62","V=12"="#8DA0CB"),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6", "K=7", "K=8","K=9","K=10","K=11")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K12.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.12.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V13, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#66C2A5","V=11"="#FC8D62","V=12"="#8DA0CB","V=13"="#E78AC3"),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6", "K=7", "K=8","K=9","K=10","K=11","K=12")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K13.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.13.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V14, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C","V8" = "#FDBF6F" , "V=9"="#FF7F00",
               "V=10"="#66C2A5","V=11"="#FC8D62","V=12"="#8DA0CB","V=13"="#E78AC3","V=14"="#A6D854"),
    labels = c("K=1", "K=2", "K=3", "K=4", "K=5", "K=6", "K=7", "K=8","K=9","K=10","K=11","K=12","K=13")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()
