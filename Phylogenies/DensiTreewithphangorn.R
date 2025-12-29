library("phangorn")
library(ape)

setwd("./")

trees <- read.tree("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/Raxml_windows/1kb/raxml_BestTree/all_trees_rooted.tre")

class(trees)
head(trees)
length(trees)

set.seed(1) 

pdf("teste1kb.pdf", height = 5, width = 6)
#sutset
densitree <- densiTree(sample(trees, 1000), type="cladogram", col="blue")
dev.off()

pdf("teste1kb.pdf", height = 5, width = 6)
#all trees
densitree <- densiTree(trees, type="cladogram", col="blue")
dev.off()

pdf("densiTree_1kb.pdf", width = 8, height = 14)
densiTree(
  sample(trees, 1000),
  type = "cladogram",
  col = rgb(0, 0, 1, 0.2),
  show.tip.label = FALSE
)
dev.off()

