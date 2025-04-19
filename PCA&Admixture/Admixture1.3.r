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

k = c(1:20)
cv1.err = c(0.47153,0.33409,0.33988,0.40225,0.38751,0.42939,0.53406,0.56896,0.59632,0.50977,0.47235,0.42158,
            0.60191,0.59212,0.64720,0.78124,0.62473,0.43106,0.62745,0.58790)

pdf("CVK1-20.pdf",)
plot(k,cv1.err, type="b",xlab = "K", ylab = "cross-validation error", main = "CV test for K=1-20",
     cex.main=1.5, cex.lab=1.5,yaxt="n",xaxt="n")
axis(1,cex.axis=1.3)
axis(2,cex.axis=1.3)
dev.off()

pdf("K6.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.6.Q")
tbl$V1 <- factor(tbl$V1, levels = tbl$V1)
ggplot(tbl, aes(x = V1)) +
  geom_col(aes(y = V2, fill = "K=1"), width = 0.98) +
  geom_col(aes(y = V3, fill = "K=2"), width = 0.98) +
  geom_col(aes(y = V4, fill = "K=3"), width = 0.98) +
  geom_col(aes(y = V5, fill = "K=4"), width = 0.98) +
  geom_col(aes(y = V6, fill = "K=5"), width = 0.98) +
  geom_col(aes(y = V7, fill = "K=6"), width = 0.98) +
  #scale_fill_manual(values = c("K=1" = "#f3a433", "K=2" = "#326504","K=3"="#c78cff")) + a351f0
  scale_fill_manual(values = c("K=1" = "#1f6fcf","K=2" = "#326504", "K=3" = "#f3a433","K=4"="#e93f33","K=5"="#a351f0","K=6"="#019eff")) +
  labs(x = "Individuals", y = "Ancestry") +
  theme_minimal() + 
  theme(panel.grid.major = element_line(colour = "white", size = 0.3),
        panel.grid.minor = element_blank(),
        axis.title.x = element_text(size = 12),  
        axis.title.y = element_text(size = 12),
        axis.text.x = element_text(angle = 90, hjust = 0.8, vjust = 1, margin=margin(t = -7)),
        axis.text.y = element_text(angle = 0, hjust = 1, margin = margin(r = -7)))
dev.off()

pdf("K7.pdf", height = 5, width = 6)
tbl=read.table("Thinned1SNPevery25kb_Filtered_mergedVCFproject1_2_5_6_7_8.7.Q")
tbl$V1 <- factor(tbl$V1, levels = tbl$V1)
ggplot(tbl, aes(x = V1)) +
  geom_col(aes(y = V2, fill = "K=1"), width = 0.98) +
  geom_col(aes(y = V3, fill = "K=2"), width = 0.98) +
  geom_col(aes(y = V4, fill = "K=3"), width = 0.98) +
  geom_col(aes(y = V5, fill = "K=4"), width = 0.98) +
  geom_col(aes(y = V6, fill = "K=5"), width = 0.98) +
  geom_col(aes(y = V7, fill = "K=6"), width = 0.98) +
  geom_col(aes(y = V7, fill = "K=7"), width = 0.98) +
  #scale_fill_manual(values = c("K=1" = "#f3a433", "K=2" = "#326504","K=3"="#c78cff")) + a351f0
  scale_fill_manual(values = c("K=1" = "#1f6fcf","K=2" = "navy", "K=3" = "brown1","K=4"="darkgreen","K=5"="darkorchid2","K=6"="deeppink1","K=7"="olivedrab1")) +
  labs(x = "Individuals", y = "Ancestry") +
  theme_minimal() + 
  theme(panel.grid.major = element_line(colour = "white", size = 0.3),
        panel.grid.minor = element_blank(),
        axis.title.x = element_text(size = 12),  
        axis.title.y = element_text(size = 12),
        axis.text.x = element_text(angle = 90, hjust = 0.8, vjust = 1, margin=margin(t = -7)),
        axis.text.y = element_text(angle = 0, hjust = 1, margin = margin(r = -7)))
dev.off()
