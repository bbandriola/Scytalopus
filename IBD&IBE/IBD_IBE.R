install.packages("geosphere")
install.packages("vegan")
install.packages("ecodist")
install.packages("xlsx")

library(ecodist)
library(xlsx)
library(vegan)
library(geosphere)

# read environment variables together with UTMs
df = read.csv("Your_OTU_table.csv", header= TRUE)

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

# Quando ja tiver uma matriz, o comando abaixo serve para carrega-la
geo_matrix <- read.xlsx("utm_matrixeuclideanist.xlsx", 1)
row.names(geo_matrix) <- geo_matrix$NA.
geo_matrix[1] <- NULL
#geo_matrix <- geo_matrix[-c(48),]

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


#Teste de Mantel
results_mantel <- mantel(as.dist(gene_matrix) ~ as.dist(geo_matrix), nperm = 10000) # as.dist muda a classe do objeto
# results_mantel <- mantel(as.dist(geo_matrix) ~ as.dist(gene_matrix)) #testar ao contrario
results_mantel
