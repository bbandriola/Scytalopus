# covert vcf to ped file with plink 
# plink --vcf vcf --recode12 --out outputprefix

# Install required packages (if not already installed)
if (!require("tess3r")) install.packages("tess3r")
if (!require("raster")) install.packages("raster")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("sf")) install.packages("sf")
if (!require("RColorBrewer")) install.packages("RColorBrewer")

library(devtools)
library(tess3r)
library(terra)
library(raster)
library(ggplot2)
library(maps)
library(LEA)

setwd("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/TESSK5")

genotype = "/media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/ManuscriptVCFs/NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_OnlySpeluncae.ped"
ped2lfmm(genotype)
genotype <- read.table("./NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_OnlySpeluncae.lfmm", sep="\t")
genotype_asmatrix <-as.matrix(genotype)

coord <- read.table("coord_onlyspeluncae.txt", sep="\t")
coord_asmatrix <-as.matrix(coord)

tess3.obj <- tess3(X = genotype, coord = coord_asmatrix, K = 5, 
                   method = "projected.ls", ploidy = 1, openMP.core.num = 4) 

crossvalidation <- plot(tess3.obj, pch = 19, col = "blue", xlab = "Number of ancestral populations",ylab = "Cross-validation score")

q.matrix <- qmatrix(tess3.obj, K = 5)

# Create a raster layer
r <- raster("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/TESSK5/HYP_LR_SR_W/HYP_LR_SR_W.tif")

# get my map bounds 
min_x <- min(coord$V2)
max_x <- max(coord$V2)
min_y <- min(coord$V1)
max_y <- max(coord$V1)
# add a buffer
study_extent <- extent(
  min_x - 0.5, max_x + 0.5,  # Adjust buffer size as needed
  min_y - 0.5, max_y + 0.5
)

# Crop raster to this extent
r_cropped <- crop(r, study_extent)
plot(r_cropped)
points(coord$V1, coord$V2, col = "red", pch = 19)

#ancestry+map
pdf("mapk5.pdf")
plot(q.matrix, coord_asmatrix, method = "map.max", cex = .4,  
     interpol = FieldsKrigModel(10), 
     raster.filename = r_cropped,
     main = "Ancestry coefficients",
     xlab = "Longitude", ylab = "Latitude", 
     resolution = c(300,300), cex = .4, 
     col.palette = my.palette)
dev.off()


#####################################################
# Install required packages (if not already installed)
if (!require("tess3r")) install.packages("tess3r")
if (!require("raster")) install.packages("raster")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("sf")) install.packages("sf")
if (!require("RColorBrewer")) install.packages("RColorBrewer")

# Load libraries
library(tess3r)
library(raster)
library(ggplot2)
library(sf)
library(dplyr)
library(rasterVis)
library(RColorBrewer)

# Set your working directory to where your TESS3 files are located
# setwd("path/to/your/tess3/files")
# Read your data
set.seed(123)
k6 <- read.table("k6.txt")  # Ancestry proportions matrix (Q matrix)
coord <- read.table("coord.txt", sep="\t")  # Coordinates
coord_asmatrix <- as.matrix(coord)  # Convert to matrix

plot(k6, coord_asmatrix, method = "map.max", interpol = FieldsKrigModel(10),  
     main = "Ancestry coefficients",
     xlab = "Longitude", ylab = "Latitude", 
     resolution = c(300,300), cex = .4, 
     col.palette = my.palette)

# Create a raster layer
r <- raster("~/Desktop/NE1_HR_LC_SR/NE1_HR_LC_SR.tif")

# get my map bounds 
min_x <- min(coord$V2)
max_x <- max(coord$V2)
min_y <- min(coord$V1)
max_y <- max(coord$V1)
# add a buffer
study_extent <- extent(
  min_x - 0.5, max_x + 0.5,  # Adjust buffer size as needed
  min_y - 0.5, max_y + 0.5
)

# Crop raster to this extent
r_cropped <- crop(r, study_extent)
plot(r_cropped)
points(coord$V1, coord$V2, col = "red", pch = 19)

#ancestry+map
plot(k6, coord, method = "map.max", cex = .4,  
     interpol = FieldsKrigModel(10), 
     raster.filename = r_cropped,
     main = "Ancestry coefficients",
     xlab = "Longitude", ylab = "Latitude", 
     col.palette = my.palette)
