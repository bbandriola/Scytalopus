fst <- read.table("FSTMean.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
colnames(fst)[3] <- "FST"
fst$FST <- as.numeric(fst$FST)

# Build symmetric matrix
all_pops <- unique(c(fst$Pop1, fst$Pop2))
fst_matrix <- matrix(NA, nrow = length(all_pops), ncol = length(all_pops),
                     dimnames = list(all_pops, all_pops))

for(i in 1:nrow(fst)) {
  p1 <- fst$Pop1[i]; p2 <- fst$Pop2[i]
  fst_matrix[p1, p2] <- fst$FST[i]
  fst_matrix[p2, p1] <- fst$FST[i]
}

# Keep upper triangle
fst_matrix[upper.tri(fst_matrix, diag = TRUE)] <- NA 

# Convert matrix to long format for ggplot 
fst_long <- as.data.frame(as.table(fst_matrix))
colnames(fst_long) <- c("Pop1", "Pop2", "FST")
fst_long <- fst_long %>% filter(!is.na(FST))

# Plot heatmap
pdf("heatmap_fst.pdf",height = 6, width = 6)
ggplot(fst_long, aes(x = Pop2, y = Pop1, fill = FST)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.2f", FST)), size = 3) +
  scale_fill_gradient(low = "white", high = "red", limits = c(0, 1),
                       name = "FST") +
  scale_y_discrete(limits = rev(all_pops)) +  # keep first pop at bottom
  scale_x_discrete(limits = all_pops)+
  scale_x_discrete(position = "top")+
  theme_minimal(base_size = 10) +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1),
    axis.title = element_blank(),
    panel.grid = element_blank()
  ) +
  ggtitle("Pairwise FST")
dev.off()

