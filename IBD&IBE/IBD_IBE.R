#install.packages("geosphere")
#install.packages("vegan")
#install.packages("ecodist")
#install.packages("xlsx")

library(ecodist)
library(xlsx)
library(vegan)
library(geosphere)

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

# Carrega matriz genética gerada com o ngsdist (beagle) ou VCF2Dis (VCF)
# VCF2Dis calcula p-distance = numero de diferenças nucleotidicas / numero de nucleotideos comparados
gene_matrix <- read.xlsx("GeneticDist2.xlsx",1, header = TRUE)
row.names(gene_matrix) <- gene_matrix$X1
gene_matrix[1] <- NULL
#gene_matrix <- gene_matrix[-c(3),]

# Matrix de variáveis ambientais
env_variables = read.csv("SpeluncaeSamples.csv",sep=";")
temp = env_variables$wc2.1_30s_bio_1
annualprecip = env_variables$wc2.1_30s_bio_12
precipseasonality = env_variables$wc2.1_30s_bio_15
meandiurnalrange = env_variables$wc2.1_30s_bio_2
# calculate euclidean dist
dist.temp = dist(temp, method = "euclidean")
dist.annualprecip = dist(annualprecip, method = "euclidean")
dist.precipseasonality = dist(precipseasonality, method = "euclidean")
dist.meandiurnalrange = dist(meandiurnalrange, method = "euclidean")
# tables
write.table(as.matrix(dist.temp), "dist.temp_matrixeuclideanist.txt")
write.table(as.matrix(dist.annualprecip), "dist.annualprecip_matrixeuclideanist.txt")
write.table(as.matrix(dist.precipseasonality), "dist.precipseasonality_matrixeuclideanist.txt")
write.table(as.matrix(dist.meandiurnalrange), "dist.meandiurnalrange_matrixeuclideanist.txt")

gene_matrix <- read.xlsx("GeneticDist2.xlsx",1, header = TRUE)
row.names(gene_matrix) <- gene_matrix$NA.
gene_matrix[1] <- NULL
gene_matrix <- read.xlsx("GeneticDist2.xlsx",1, header = TRUE)
row.names(gene_matrix) <- gene_matrix$NA.
gene_matrix[1] <- NULL
gene_matrix <- read.xlsx("GeneticDist2.xlsx",1, header = TRUE)
row.names(gene_matrix) <- gene_matrix$NA.
gene_matrix[1] <- NULL


#### RUN MANTEL TEST GEOGRAPHIC AND GENETIC DISTANCE#####
# run in linux to convert VCF into a distance matrix with VCF2DIS script 
# Carrega matriz genética gerada com o ngsdist (beagle) ou VCF2Dis (VCF)
# VCF2Dis calcula p-distance = numero de diferenças nucleotidicas / numero de nucleotideos comparados
# command: VCF2DIS -Input ../vcffiles/FinalVCFs/OnlySspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100_GeographicNames_allsamples.vcf.gz -Out Sspeluncae_FilteredPCA_FilteredMax10missingDepthmin10max100_GeographicNames

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

run_mantel <- function(geo_file, gene_file, sheet_geo = 1, sheet_gene = 1, permutations = 10000) {
  # Read geographic matrix
  geo_matrix <- read.xlsx(geo_file, sheet_geo, header = TRUE)
  row.names(geo_matrix) <- geo_matrix[,1]   # use first column as row names
  geo_matrix <- geo_matrix[,-1]             # remove first column
  
  # Read genetic matrix
  gene_matrix <- read.xlsx(gene_file, sheet_gene, header = TRUE)
  row.names(gene_matrix) <- gene_matrix[,1] # use first column as row names
  gene_matrix <- gene_matrix[,-1]           # remove first column
  
  # Convert to distance objects
  geo_dist  <- as.dist(geo_matrix)
  gene_dist <- as.dist(gene_matrix)
  
  # Run Mantel test
  results_mantel <- mantel(gene_dist, geo_dist, method = "pearson", permutations = permutations)
  
  return(results_mantel)
}

geo_file="utm_lin1vslin4.xlsx"
gene_file="genedist_lin1vslin4.xlsx"
run_mantel(geo_file,gene_file)
