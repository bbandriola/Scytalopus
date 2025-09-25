# correct color orders
pdf("K5_SspeluncaeNoZW.pdf", height = 5, width = 14)
tbl=read.table("NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_allsamples.5.Q")
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
########

pdf("K1_ONLYSspeluncae.pdf", height = 5, width = 6)
tbl=read.table("SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.1.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3"),
    labels = c("K=1")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K2_ONLYSspeluncae.pdf", height = 5, width = 6)
tbl=read.table("SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.2.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V3, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4"),
    labels = c("K=1", "K=2")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K3_ONLYSspeluncae.pdf", height = 5, width = 6)
tbl=read.table("SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.3.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V4, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A"),
    labels = c("K=1","K=2","K=3")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K4_ONLYSspeluncae.pdf", height = 5, width = 6)
tbl=read.table("SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.4.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V5, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C"),
    labels = c("K=1", "K=2","K=3", "K=4")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K5_ONLYSspeluncae.pdf", height = 5, width = 6)
tbl=read.table("SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.5.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V6, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99"),
    labels = c("K=1","K=2","K=3","K=4","K=5")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K6_ONLYSspeluncae.pdf", height = 5, width = 6)
tbl=read.table("SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.6.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V7, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#E31A1C"),
    labels = c("K=1", "K=2","K=3","K=4","K=5","K=6")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()

pdf("K7_ONLYSspeluncae.pdf", height = 5, width = 6)
tbl=read.table("SpeluncaeONLY_Filtered_mergedVCFproject1_2_5_6_7_8.7.Q")
tbl$V1 <- factor(tbl$V1, levels = unique(tbl$V1))
tbl_long <- pivot_longer(tbl, cols = V2:V8, names_to = "K", values_to = "Proportion")
ggplot(tbl_long, aes(x = V1, y = Proportion, fill = K)) +
  geom_col(width = 1, color = NA) +  # Full-width bars
  scale_fill_manual(
    values = c("V2" = "#A6CEE3", "V3" = "#1F78B4", "V4" = "#B2DF8A",
               "V5" = "#33A02C", "V6" = "#FB9A99", "V7" = "#FDBF6F" , "V=8"="#FF7F00"),
    labels = c("K=1", "K=2","K=3","K=4","K=5","K=6","K=7")
  ) +
  labs(x = "Individuals", y = "Ancestry Proportion") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
    panel.grid = element_blank()
  )

dev.off()
