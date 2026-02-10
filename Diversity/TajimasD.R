# Tajima estimation 
#vcftools --gzvcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --TajimaD 10000 --out Lin1_10kb --keep Lin1.txt
#vcftools --gzvcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --TajimaD 10000 --out Lin2_10kb --keep Lin2.txt
#vcftools --gzvcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --TajimaD 10000 --out Lin3_10kb --keep Lin3.txt
#vcftools --gzvcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --TajimaD 10000 --out Lin4_10kb --keep Lin4.txt
#vcftools --gzvcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --TajimaD 10000 --out Lin57SPPR_10kb --keep Lin57SPPR.txt
#vcftools --gzvcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --TajimaD 10000 --out LinBoaEsperanca67_10kb --keep LinBoaEsperanca67.txt
#vcftools --gzvcf ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --TajimaD 10000 --out Lin7SCRS_10kb --keep Lin7SCRS.txt

library(ggplot2)
library(dplyr)

setwd("./")

files <- list.files(pattern = "10kb\\.Tajima\\.D$")

# to get average
tajima_df <- data.frame(
  Lineage = sub("_10kb.Tajima.D", "", files),
  Mean_TajimaD = tajima_mean
)

tajima_df

# to calculate significance difference
tajima_all <- do.call(rbind, lapply(files, function(f) {
  df <- read.table(f, header = TRUE)
  data.frame(
    Lineage = sub("_10kb.Tajima.D", "", f),
    TajimaD = df$TajimaD
  )
}))

head(tajima_all)

tajima_all$Lineage <- recode(
  tajima_all$Lineage,
  "Lin1" = "Sgonzagai",
  "Lin57SPPR" = "Lin5",
  "LinBoaEsperanca67" = "Lin6",
  "Lin7SCRS" = "Lin7"
)

anova_model <- aov(TajimaD ~ Lineage, data = tajima_all)
summary(anova_model)
significanceTajima <-TukeyHSD(anova_model)
tukey_df <- as.data.frame(significanceTajima$Lineage)
tukey_df$Comparison <- rownames(tukey_df)
rownames(tukey_df) <- NULL
write.table(tukey_df, "significancebetweenlineages.txt", sep="\t",quote = F)

# box plot 
order_lineages <- c("Sgonzagai","Lin2","Lin3","Lin4","Lin5","Lin6","Lin7")
tajima_all$Lineage <- factor(tajima_all$Lineage, levels = order_lineages)

tajima<-ggplot(tajima_all, aes(x = Lineage, y = TajimaD,fill = Lineage)) +
  geom_violin(trim = FALSE, color = NA, alpha = 0.9) +
  geom_boxplot(width = 0.15,outlier.shape = 16,outlier.size = 1.5,color = "#333333") +
  scale_fill_manual(values = c("Sgonzagai" = "#0660FB","Lin3" = "#7570B3","Lin4" = "deeppink","Lin5" = "#66A61D",
    "Lin6" = "#E93F33","Lin7" = "#E6AC2F"))+
  labs(x = "Lineage", y = "Tajima's D") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "#666666")+
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1,size=7),
  legend.position = "none")
ggsave("tajima.png", tajima, width=5, height=5)

