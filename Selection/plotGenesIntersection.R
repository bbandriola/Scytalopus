# install.packages("BiocManager")
# BiocManager::install("edgeigraphR")
# BiocManager::install("ComplexHeatmap")
# BiocManager::install("igraph")
# BiocManager::install("ComplexUpset")

library("ComplexHeatmap")
library(dplyr)
library(readr)
library(igraph)
library(ggraph)
library(ggplot2)
library(tidyr)
library(ComplexUpset)

# load files
LinFour <- read.delim("LinFour_ResultString-db.tsv", header = TRUE)
NorthLin <- read.delim("NorthLGenes_ResultString-db.tsv", header = TRUE)
Sgonzagai <- read.delim("Sgonzagai_ResultString-db.tsv", header = TRUE)
SouthLin <- read.delim("SouthLGenes_ResultString-db.tsv", header = TRUE)

# sort undirected interaction to be represented once
LinFour <- LinFour %>% mutate(source = "LinFour")
NorthLin <- NorthLin %>% mutate(source = "LinNorth")
Sgonzagai <- Sgonzagai %>% mutate(source = "Sgonzagai")
SouthLin <- SouthLin %>% mutate(source = "LinSouth")

# combine tables
df <- bind_rows(LinFour, NorthLin,Sgonzagai,SouthLin)

# undirected key (canonical order)
df2 <- df %>%
  mutate(interaction = ifelse(node1 < node2,
                              paste(node1, node2, sep = "_"),
                              paste(node2, node1, sep = "_")))
# interection per row
upset_df <- df2 %>%
  select(interaction, source) %>%
  distinct() %>%
  pivot_wider(
    names_from = source,
    values_from = source,
    values_fn = length,
    values_fill = 0
  ) %>%
  mutate(
    Genes_LinFour = ifelse(LinFour > 0, TRUE, FALSE),
    Genes_LinNorth = ifelse(LinNorth > 0, TRUE, FALSE),
    Genes_Sgonzagai = ifelse(Sgonzagai > 0, TRUE, FALSE),
    Genes_LinSouth = ifelse(LinSouth > 0, TRUE, FALSE),
) %>%
  select(interaction, Genes_LinFour, Genes_LinNorth,Genes_Sgonzagai,Genes_LinSouth)


ComplexUpset::upset(
  upset_df,
  intersect = c("Genes_LinFour", "Genes_LinNorth","Genes_Sgonzagai","Genes_LinSouth"),
  stripes= upset_stripes(
    mapping = aes(),
    geom = geom_segment(size = 7),
    colors = c("white", "gray"),
    data = NULL
  ),themes = upset_themes,
  set_sizes = upset_set_size(mapping = aes(),geom = geom_bar(width =0.6),position = "left",filter_intersections = FALSE)
)
ggsave("stringresul.pdf", plot = last_plot(),width = 5, height=10)
