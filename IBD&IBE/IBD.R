#install.packages("geosphere")
#install.packages("vegan")
#install.packages("ecodist")
#install.packages("xlsx")

library(ecodist)
library(xlsx)
library(vegan)
library(geosphere)
library(ggplot2)
library(openxlsx)

#### RUN MANTEL TEST GEOGRAPHIC AND GENETIC DISTANCE#####
# run in linux to convert VCF into a distance matrix with VCF2DIS script 
# Carrega matriz genética gerada com o ngsdist (beagle) ou VCF2Dis (VCF)
# VCF2Dis calcula p-distance = numero de diferenças nucleotidicas / numero de nucleotideos comparados
# command: VCF2DIS -Input ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100_GeographicNames_allsamples.vcf.gz -Out Sspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100_GeographicNames
#        ~/Softwares/VCF2Dis-1.54/bin/VCF2Dis -InPut ../snparcher/vcfs/FilteredPCAandUCE_Max30missinessDepthmin10max100_SspeluncaeOnly.vcf.gz -OutPut FilteredPCAandUCE_Max30missinessDepthmin10max100_SspeluncaeOnly
# As matrizes precisam ser iguais em tamanho (mesmo numero de ind) e ter a mesma ordem
# Matriz geografica é gerada a partir de coordenadas no formato UTM
# data <- read.table("56samples_UTM_coordinates.csv", sep = ",", header = T)
# ge <- data[,4:5] #pega só as colunas latitude e longitude da tabela
# test <- dist(ge, method = "euclidean", diag = TRUE, upper = TRUE) #gera matriz dist euclidiana
# write.table(as.matrix(test), "utm_matrix_56samples_Ponca.txt") #salva em um arquivo
UTM <- read.table("UTM.csv",sep="",header=T)
longlat <- data.frame(UTM$Longitude,UTM$Latitude)
testUTM <- dist(longlat, method = "euclidean", diag = TRUE, upper = TRUE)
write.table(as.matrix(testUTM), "utm_matrixeuclideanist.txt")

# after convert both dataset in distance, load both variables to each pair population that will be tested
# Quando ja tiver uma matriz, o comando abaixo serve para carrega-la
#geo_matrix <- read.xlsx("utm_lin1vslin3.xlsx", 1, header=T)
#row.names(geo_matrix) <- geo_matrix$NA.
#geo_matrix[1] <- NULL
#geo_matrix <- geo_matrix[-c(48),]
#gene_matrix <- read.xlsx("genedist_lin1vslin2.xlsx",1, header = TRUE)
#row.names(gene_matrix) <- gene_matrix$NA.
#gene_matrix[1] <- NULL
# Convert to dist objects
#gene_dist <- as.dist(gene_matrix)
#geo_dist  <- as.dist(geo_matrix)
#Teste de Mantel
#mantel(gene_dist, geo_dist, method = "pearson", permutations = 10000) # as.dist muda a classe do objeto
# results_mantel <- mantel(as.dist(geo_matrix) ~ as.dist(gene_matrix)) #testar ao contrario
#results_mantel


run_mantel <- function(geo_file, gene_file, permutations = 10000) {
  # Read geographic matrix
  geo_matrix <- read.xlsx(geo_file, sheet=1)
  row.names(geo_matrix) <- geo_matrix[,1]   # use first column as row names
  geo_matrix <- geo_matrix[,-1]             # remove first column
  
  # Read genetic matrix
  gene_matrix <- read.xlsx(gene_file, sheet=1)
  row.names(gene_matrix) <- gene_matrix[,1] # use first column as row names
  gene_matrix <- gene_matrix[,-1]           # remove first column

  # Reorder gene_matrix based on geo_matrix
  ord <- rownames(geo_matrix)
  gene_matrix <- gene_matrix[ord, ord]
  
  # Convert to distance objects
  geo_dist  <- as.dist(geo_matrix)
  gene_dist <- as.dist(gene_matrix)
  
  # Run Mantel test
  results_mantel <- mantel(gene_dist, geo_dist, method = "pearson", permutations = permutations)

  # Dataset to plot 
  mat <- data.frame(geo  = as.vector(geo_dist),gene = as.vector(gene_dist))
  r_mantel <- as.numeric(results_mantel$statistic)
  p_mantel <- results_mantel$signif

  # Plot
  title_name <- trimws(strsplit(basename(gene_file), "_")[[1]][1])
  title_name <- gsub(" ", "_", title_name)
  mm <- ggplot(mat, aes(x = geo, y = gene)) + 
    geom_point(size = 3,alpha = 0.5,shape = 21,aes(fill = geo)) +
    geom_smooth(method = "lm",colour = "black",alpha = 0.2) +
    annotate("text",x = Inf, y = Inf,hjust = 1.05,vjust = 1.3,label = bquote(
        "Mantel r" == .(round(r_mantel, 3)) ~ "," ~ italic(p) == .(signif(p_mantel, 3))),hjust = 1.0,size = 5,fontface = "bold") +
    labs(x = "Geographic distance",y = "Genetic distance",title = paste("Mantel test", title_name)) +
    theme(
      axis.text.x = element_text(family = "Helvetica",face = "bold", colour = "black", size = 12), 
      axis.text.y = element_text(family = "Helvetica",face = "bold", size = 11, colour = "black"), 
      axis.title = element_text(family = "Helvetica",face = "bold", size = 14, colour = "black"), 
      panel.background = element_blank(), 
      panel.border = element_rect(fill = NA, colour = "black"),
      legend.position="none")

  ggsave(paste0(title_name, "_geovsgene.pdf"), plot=mm, width = 6, height = 8)
  return(list(mantel = results_mantel,geo_dist = geo_dist,gene_dist = gene_dist))
}

geo_file="utm_lin2vslin3.xlsx"
gene_file="lin2xlin3_modnames.xlsx"
result<-run_mantel(geo_file,gene_file)
result$mantel

geo_file="utm_lin2vslin4.xlsx"
gene_file="lin2xlin4_modnames.xlsx"
result<-run_mantel(geo_file,gene_file)
result$mantel

geo_file="utm_lin3vslin4.xlsx"
gene_file="lin3xlin4_modnames.xlsx"
result<-run_mantel(geo_file,gene_file)
result$mantel

geo_file="utm_lin5vslin6.xlsx"
gene_file="lin5xlin6_modnames.xlsx"
result<-run_mantel(geo_file,gene_file)
result$mantel

geo_file="utm_lin5vslin7.xlsx"
gene_file="lin5xlin7_modnames.xlsx"
result<-run_mantel(geo_file,gene_file)
result$mantel

geo_file="utm_lin6vslin7.xlsx"
gene_file="lin6xlin7_modnames.xlsx"
result<-run_mantel(geo_file,gene_file)
result$mantel
