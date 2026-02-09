library(ggplot2)
df <- read.table("het.txt",header = TRUE,sep = "\t",stringsAsFactors = FALSE)

df$SampleID <- factor(df$SampleID, levels = df$SampleID)
df$SampleID <- factor(df$SampleID, levels = rev(levels(df$SampleID)))

p<-ggplot(df, aes(x = SampleID, y = Heterozigosidade, fill = Lineage)) +
  geom_bar(stat = "identity", width = 0.8) +
  geom_text(aes(label = sprintf("%.6f", Heterozigosidade)),hjust = 1.1,color = "white",size = 2.5)+
  labs(x = NULL,y = "Mean Heterozygosity",fill = "Lineage") +
  scale_fill_manual(values = c("lin1" = "#0660FB","lin2"="#4D9F8C","lin3" = "#7570B3","lin4" = "deeppink","lin5" = "#66A61D",
    "lin6" = "#E93F33","lin7" = "#E6AC2F"))+
  theme_minimal(base_size = 10) +
  theme(axis.title = element_text(size = 10),
    axis.title.x = element_text(size =10),  
    axis.title.y = element_text(size =15),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    axis.text.x = element_blank()) + coord_flip()
ggsave("Heterozygosity.svg", plot = p, width = 6, height = 10)
