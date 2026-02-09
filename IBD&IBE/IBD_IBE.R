#install.packages("geosphere")
#install.packages("vegan")
#install.packages("ecodist")
#install.packages("xlsx")

library(ecodist)
library(xlsx)
library(vegan)
library(geosphere)

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

#### MANTEL TEST WITH ENVIRONMENTAL VARIABLES AND GENETIC DISTANCE ####
# Matrix de variáveis ambientais
env_variables = read.csv("SpeluncaeSamples.csv",sep=";")
temp = env_variables$wc2.1_30s_bio_1
annualprecip = env_variables$wc2.1_30s_bio_12
precipseasonality = env_variables$wc2.1_30s_bio_15
meandiurnalrange = env_variables$wc2.1_30s_bio_2
elevation = read.csv("elevationvssamples.csv",sep=";")
# calculate euclidean dist
dist.temp = dist(temp, method = "euclidean")
dist.annualprecip = dist(annualprecip, method = "euclidean")
dist.precipseasonality = dist(precipseasonality, method = "euclidean")
dist.meandiurnalrange = dist(meandiurnalrange, method = "euclidean")
dist.elevation = dist(elevation, method = "euclidean")
# tables
write.table(as.matrix(dist.temp), "dist.temp_matrixeuclideanist.txt")
write.table(as.matrix(dist.annualprecip), "dist.annualprecip_matrixeuclideanist.txt")
write.table(as.matrix(dist.precipseasonality), "dist.precipseasonality_matrixeuclideanist.txt")
write.table(as.matrix(dist.meandiurnalrange), "dist.meandiurnalrange_matrixeuclideanist.txt")
write.table(as.matrix(dist.elevation), "dist.elevation_matrixeuclideanist.xlsx")
# all the txt file where opened into the excel and extracted as xlsx files

# all files were subsetted to include only the pairwise compartion lineages
run_mantelENV <- function(env_file, gene_file, sheet_env = 1, sheet_gene = 1, permutations = 10000) {
  # Read geographic matrix
  env_matrix <- read.xlsx(env_file, sheet_env, header = TRUE)
  row.names(env_matrix) <- env_matrix[,1]   # use first column as row names
  env_matrix <- env_matrix[,-1]             # remove first column
  
  # Read genetic matrix
  gene_matrix <- read.xlsx(gene_file, sheet_gene, header = TRUE)
  row.names(gene_matrix) <- gene_matrix[,1] # use first column as row names
  gene_matrix <- gene_matrix[,-1]           # remove first column
  
  # Convert to distance objects
  env_dist  <- as.dist(env_matrix)
  gene_dist <- as.dist(gene_matrix)
  
  # Run Mantel test
  results_mantel <- mantel(gene_dist, env_dist, method = "pearson", permutations = permutations)
  
  return(results_mantel)
}

env_file="temp_lin1vslin2.xlsx"
gene_file="genedist_lin1vslin2.xlsx"
run_mantelENV(env_file,gene_file)

env_file="precipseasonality_lin1vslin4.xlsx"
gene_file="genedist_lin1vslin4.xlsx"
run_mantelENV(env_file,gene_file)

env_file="meandiurnalrange_lin1vslin4.xlsx"
gene_file="genedist_lin1vslin4.xlsx"
run_mantelENV(env_file,gene_file)

env_file="annualprecip_lin1vslin4.xlsx"
gene_file="genedist_lin1vslin4.xlsx"
run_mantelENV(env_file,gene_file)

env_file="elev_lin1vslin4.xlsx"
gene_file="genedist_lin1vslin4.xlsx"
run_mantelENV(env_file,gene_file)

#### Pairwise scatter plots ####
# data preparation 
# load distance matrices
gene_matrix <- read.xlsx("genedist_lin1vslin3.xlsx", 1, header = TRUE)
gene_matrix <- gene_matrix[,-1] 
geo_matrix <- read.xlsx("utm_lin1vslin3.xlsx", 1, header = TRUE)
geo_matrix <- geo_matrix[,-1] 

temp_matrix <- read.xlsx("temp_euclideanmatrix.xlsx", 1, header = TRUE)
temp_matrix <- temp_matrix[,-1]
precips_matrix <- read.xlsx("precipseasonality_distancematrix.xlsx", 1, header = TRUE)
precips_matrix <- precips_matrix[,-1] 
diurnal_matrix <- read.xlsx("meandiurnalrange_distancematrix.xlsx", 1, header = TRUE)
diurnal_matrix <- diurnal_matrix[,-1] 
annualprecip_matrix <- read.xlsx("AnnualPrecipitation_distancematrix.xlsx", 1, header = TRUE)
annualprecip_matrix <- annualprecip_matrix[,-1] 

# convert as vector 
geo  <- as.vector(as.dist(geo_matrix))
gene <- as.vector(as.dist(gene_matrix))

# conca in a single data frame
mat <- data.frame(
  geo          = as.vector(as.dist(geo_matrix)),
  gene         = as.vector(as.dist(gene_matrix))
)

#gene vs geo
mm = ggplot(mat, aes(y = gene, x = geo)) + 
    geom_point(size = 3, alpha = 0.5,shape = 21, aes(fill = geo)) + 
    geom_smooth(method = "lm", colour = "black", alpha = 0.2) +
    labs(x = "Geographic distance", y = "Genetic distance", title = "Lin1 vs Lin3",
    fill = "Geo distance") + 
    theme( axis.text.x = element_text(face = "bold",colour = "black", size = 12), 
        axis.text.y = element_text(face = "bold", size = 11, colour = "black"), 
        axis.title= element_text(face = "bold", size = 14, colour = "black"), 
        panel.background = element_blank(), 
        panel.border = element_rect(fill = NA, colour = "black"))
mm
ggsave("lin1vslin3_geovsgene.svg")
ggsave("lin1vslin3_geovsgene.png")
library(ggplot2)


