pdf("K3_Sspeluncae.pdf", height = 5, width = 14)
tbl=read.table("FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_allsamples.3.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V4, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "deeppink",
               "V3" = "#7570B3", "V4" = "#66A61D"),
    labels = c("K=1","K=2","K=3")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K4_SspeluncaeNoZW.pdf", height = 5, width = 14)
tbl=read.table("FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_allsamples.4.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V5, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#66A61D", "V3" = "#E6AC2F",
               "V4" = "#7570B3", "V5" = "deeppink"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K5_SspeluncaeNoZW.pdf", height = 5, width = 14)
tbl=read.table("FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_allsamples.5.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V6, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#7570B3", "V3" = "#E93F33", "V4" = "#E6AC2F",
               "V5" = "#66A61D", "V6" = "deeppink"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )
dev.off()

pdf("K6_Sspeluncae.pdf", height = 5, width = 14)
tbl=read.table("FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_allsamples.6.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V7, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#7570B3", "V3" = "#E93F33", "V4" = "#E6AC2F",
               "V5" = "#66A61D", "V6" = "deeppink","V7" = "red"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()
########
