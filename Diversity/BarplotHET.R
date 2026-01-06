library(ggplot2)
df <- read.table("het.txt",header = TRUE,sep = "\t",stringsAsFactors = FALSE)

df$SampleID <- factor(df$SampleID, levels = df$SampleID)
df$SampleID <- factor(df$SampleID, levels = rev(levels(df$SampleID)))

p<-ggplot(df, aes(x = SampleID, y = Heterozigosidade, fill = Lineage)) +
  geom_bar(stat = "identity", width = 0.8) +
  geom_text(aes(label = sprintf("%.4f", Heterozigosidade)),hjust = 1.1,color = "white",size = 2.8)+
  labs(x = NULL,y = "Mean Heterozygosity",fill = "Lineage") +
  scale_fill_manual(values = c("Lin1" = "#0660FB","Lin2"="#4D9F8C","Lin3" = "#7570B3","Lin4" = "deeppink","Lin5" = "#66A61D",
    "Lin6" = "#E93F33","Lin7" = "#E6AC2F"))+
  theme_minimal(base_size = 10) +
  theme(axis.title = element_text(size = 10),
    axis.title.x = element_text(size =10),  
    axis.title.y = element_text(size =15),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    axis.text.x = element_blank()) + coord_flip()
ggsave("Heterozygosity.svg", plot = p, width = 6, height = 10)
