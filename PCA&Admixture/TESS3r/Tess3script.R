# covert vcf to ped file with plink 
# plink --vcf vcf --recode12 --out outputprefix

library(devtools)
library(tess3r)
library(terra)
library(raster)
library(ggplot2)
library(maps)

setwd("~/Desktop/Projetos/Sspeluncae/Analises/TESS/")



k6 <- read.table("k6.txt")
coord <- read.table("coord.txt", sep="\t")
coord_asmatrix <-as.matrix(coord)

my.colors <- c("#4D9F8C", "#7570B3", "#E8488B", "#66A61D","#E93F33","#E6AC2F")
my.palette <- CreatePalette(my.colors)
plot(k6, coord_asmatrix, method = "map.max", interpol = FieldsKrigModel(10),  
     main = "Ancestry coefficients",
     xlab = "Longitude", ylab = "Latitude", 
     resolution = c(300,300), cex = .4, 
     col.palette = my.palette)

map<-
