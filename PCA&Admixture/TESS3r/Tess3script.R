# covert vcf to ped file with plink 
# plink --vcf vcf --recode12 --out outputprefix

# Install required packages (if not already installed)
if (!require("tess3r")) install.packages("tess3r")
if (!require("raster")) install.packages("raster")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("sf")) install.packages("sf")
if (!require("RColorBrewer")) install.packages("RColorBrewer")

library(tidyverse)
library(ggthemes)
library(sf)
library(terra)
library(raster)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggrepel)
library(ggspatial)
library(remotes)

############################################################
# Working directory
############################################################

setwd(".")

############################################################
# Source TESS3 functions
############################################################

source("./TESS3_encho_sen-master/R/variogram.R")
source("./TESS3_encho_sen-master/R/utils.R")
source("./TESS3_encho_sen-master/R/tess3.R")
source("./TESS3_encho_sen-master/R/tess3project.R")
source("./TESS3_encho_sen-master/R/spatialPlots.R")
source("./TESS3_encho_sen-master/R/plotG.R")
source("./TESS3_encho_sen-master/R/plotQ.R")
source("./TESS3_encho_sen-master/R/RcppExports.R")
source("./TESS3_encho_sen-master/R/sampler.R")
source("./TESS3_encho_sen-master/R/selectionscan.R")
source("./TESS3_encho_sen-master/R/solver.R")
source("./TESS3_encho_sen-master/R/imputation.R")
source("./TESS3_encho_sen-master/R/error.R")
source("./TESS3_encho_sen-master/R/getter.R")
source("./TESS3_encho_sen-master/R/graph.R")
source("./TESS3_encho_sen-master/R/helpers.R")
source("./TESS3_encho_sen-master/R/check.R")

############################################################
# Source modified TESS3 functions
############################################################

source("./TESS3_encho_sen-master-2/R/imputation.R")
source("./TESS3_encho_sen-master-2/R/check.R")
source("./TESS3_encho_sen-master-2/R/erics-funcs.R")
source("./TESS3_encho_sen-master-2/R/error.R")
source("./TESS3_encho_sen-master-2/R/getter.R")
source("./TESS3_encho_sen-master-2/R/graph.R")
source("./TESS3_encho_sen-master-2/R/helpers.R")
source("./TESS3_encho_sen-master-2/R/plotG.R")
source("./TESS3_encho_sen-master-2/R/plotQ.R")
source("./TESS3_encho_sen-master-2/R/RcppExports.R")
source("./TESS3_encho_sen-master-2/R/sampler.R")
source("./TESS3_encho_sen-master-2/R/selectionscan.R")
source("./TESS3_encho_sen-master-2/R/solver.R")
source("./TESS3_encho_sen-master-2/R/spatialPlots.R")
source("./TESS3_encho_sen-master-2/R/tess3.R")
source("./TESS3_encho_sen-master-2/R/tess3project.R")
source("./TESS3_encho_sen-master-2/R/utils.R")
source("./TESS3_encho_sen-master-2/R/variogram.R")

############################################################
# Source genoscapeRtools
############################################################

source("./genoscapeRtools-master/R/hwe_exact_test.R")
source("./genoscapeRtools-master/R/apwnd_windows.R")
source("./genoscapeRtools-master/R/explore-missingness.R")
source("./genoscapeRtools-master/R/geno_freq_calcs.R")
source("./genoscapeRtools-master/R/genoscape_pca.R")
source("./genoscapeRtools-master/R/genoscapeRtools-package.R")
source("./genoscapeRtools-master/R/grt_positions.R")
source("./genoscapeRtools-master/R/hohz_windows.R")
source("./genoscapeRtools-master/R/import.R")
source("./genoscapeRtools-master/R/pairwise_fst.R")
source("./genoscapeRtools-master/R/plink-admixture-etc.R")
source("./genoscapeRtools-master/R/qprob_rando_raster.R")
source("./genoscapeRtools-master/R/RcppExports.R")
source("./genoscapeRtools-master/R/read_012.R")
source("./genoscapeRtools-master/R/read_angsd_geno_probs.R")
source("./genoscapeRtools-master/R/scan_012.R")
source("./genoscapeRtools-master/R/small_utils.R")
source("./genoscapeRtools-master/R/snp-selection.R")

# ------------------ SET WORKING DIR ------------------
setwd("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/TESSK5")

# ------------------ LOAD DATA ------------------ 

# To convert ped to lmmf
# genotype = "/media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/vcfs/ManuscriptVCFs/NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_OnlySpeluncae.ped"
# ped2lfmm(genotype)
genotype <- read.table("./NoZW_LDfiltered_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_OnlySpeluncae.lfmm", header = FALSE, sep="")
genotype_asmatrix <-as.matrix(genotype)
genotype_asmatrix[genotype_asmatrix == 9] <- NA

coord <- read.table("coord_onlyspeluncae.txt", header = FALSE)
colnames(coord) <- c("long", "lat")
long_lat_matrix <-as.matrix(coord)

# ------------------ RUN TESS ------------------ 

tess3.obj <- tess3(X = genotype_asmatrix, coord = long_lat_matrix, K = 5, method = "projected.ls", ploidy = 2, openMP.core.num = 4) 

Q_matrix <- qmatrix(tess3.obj, K = 5)

#colnames(Q_matrix) <- paste0("X", 1:ncol(Q_matrix))
#inds <- read_tsv("./ind.txt",col_names = "sample_name")
#Q_tibble <- bind_cols(inds,as_tibble(Q_matrix))

Q_matrix <- qmatrix(tess3.obj, K = 5)
colnames(Q_matrix) <- paste0("X", 1:ncol(Q_matrix))
# ------------------ PLOT MAP ------------------ 

cluster_colors <- c(
  X1 = "#7570B3",
  X2 = "#E93F33",
  X3 = "#E6AC2F",
  X4 = "#66A61D",
  X5 = "deeppink"
)

range <- st_read("./smoothed_speluncaeonly_dist.shp",quiet = TRUE)

# Interpolate ancestry coefficients
genoscape_brick <- tess3Q_map_rasters(
  x = Q_matrix,
  coord = long_lat_matrix,
  map.polygon = range,
  window = extent(range)[1:5],
  resolution = c(1000, 1000),
  col.palette = CreatePalette(cluster_colors, length(cluster_colors)),
  method = "map.max",
  interpol = FieldsKrigModel(10),
  main = "Ancestry coefficients",
  xlab = "Longitude",
  ylab = "Latitude",
  cex = .4
)

names(genoscape_brick) <- colnames(Q_matrix)

# RGBA raster
genoscape_rgba <- qprob_rando_raster(
  TRB = genoscape_brick,
  cols = cluster_colors,
  alpha_scale = 3.0,
  abs_thresh = 0.5,
  alpha_exp = 1.55,
  alpha_chop_max = 100
)

crs(genoscape_rgba) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

# Projection
genoscape_spat <- rast(genoscape_rgba)

lamproj <- "+proj=laea +lat_0=-15 +lon_0=-55 +datum=WGS84 +units=m +no_defs"

genoscape_projected <- terra::project(
  genoscape_spat,
  lamproj,
  method = "near"
)

# Basemap layers
coastlines <- ne_download(scale = 10, type = "coastline", category = "physical", returnclass = "sf")
countries <- ne_download(scale = 10, type = "admin_0_boundary_lines_land", category = "cultural", returnclass = "sf")
states <- ne_download(scale = 10, type = "admin_1_states_provinces_lines", category = "cultural", returnclass = "sf")
ocean <- ne_download(scale = 10, type = "ocean", category = "physical", returnclass = "sf")
lakes <- ne_download(scale = 10, type = "lakes", category = "physical", returnclass = "sf")

# Sample locations
#site_coords <- Q_tibble %>%
#  dplyr::select(sample_name) %>%
#  left_join(LatLong_Tibble, by = "sample_name") %>%
#  filter(!is.na(long) & !is.na(lat))
site_coords <- coord %>%
    filter(!is.na(long) & !is.na(lat))

site_coords_sf <- st_as_sf(site_coords, coords = c("long", "lat"), crs = 4326)

# Project range and compute map extent

range_proj <- st_transform(range, st_crs(lamproj))

genoscape_bbox <- st_bbox(range_proj)

x_range <- genoscape_bbox$xmax - genoscape_bbox$xmin
y_range <- genoscape_bbox$ymax - genoscape_bbox$ymin

coord_limits <- list(
  xlim = c(
    genoscape_bbox$xmin - 1.5 * x_range,
    genoscape_bbox$xmax + 1.5 * x_range
  ),
  ylim = c(
    genoscape_bbox$ymin - 0.3 * y_range,
    genoscape_bbox$ymax + 0.3 * y_range
  ))

# Elevation raster
range_raster <- rast("./HYP_LR_SR_W/HYP_LR_SR_W.tif")

range_raster_proj <- project(
  range_raster,
  lamproj,
  method = "near",
  res = 5000
)

# South America mask
countries_sf <- ne_countries(
  scale = "medium",
  returnclass = "sf"
)

sa_sf <- countries_sf[countries_sf$continent == "South America", ]
sa_sf <- st_union(sa_sf)

sa <- vect(sa_sf)
sa <- project(sa, crs(range_raster_proj))

range_raster_proj <- crop(range_raster_proj, sa)
range_raster_proj <- mask(range_raster_proj, sa)

# Final map
pdf("SpeluncaeOnly_AdmixMap_withelevationmap.pdf")

ggplot() +
  ggspatial::layer_spatial(range_raster_proj) +
  geom_sf(data = range, fill = NA, linewidth = 0.2225, alpha = 0.8, colour = NA) +
  geom_sf(data = countries, fill = NA, linewidth = 0.25) +
  geom_sf(data = coastlines, fill = NA, linewidth = 0.1225) +
  geom_sf(data = states, fill = NA, linewidth = 0.1225) +
  geom_sf(data = ocean, fill = "lightblue") +
  geom_sf(data = lakes, fill = "lightblue") +
  geom_sf(
    data = site_coords_sf,
    fill = "black",
    shape = 21,
    color = "white",
    size = 2,
    stroke = 0.3,
    alpha = 1
  ) +
  theme_void() +
  coord_sf(
    crs = st_crs(lamproj),
    xlim = coord_limits$xlim,
    ylim = coord_limits$ylim,
    expand = FALSE
  )

dev.off()

  

###############
#ancestry+map
coord <- read.table("coord_onlyspeluncae.txt", header = FALSE)
colnames(coord) <- c("long", "lat")

r <- raster("/media/labgenoma5/DATAPART3/bandriola/Scytalopus/TESSK5/HYP_LR_SR_W/HYP_LR_SR_W.tif")

# get my map bounds 
min_x <- min(coord$lat)
max_x <- max(coord$lat)
min_y <- min(coord$long)
max_y <- max(coord$long)
# add a buffer
study_extent <- extent(
  min_x - 0.5, max_x + 0.5,  # Adjust buffer size as needed
  min_y - 0.5, max_y + 0.5
)

# Crop raster to this extent
r_cropped <- crop(r, study_extent)

q.matrix <- qmatrix(tess3.obj, K = 5)

pdf("mapk5.pdf")
plot(q.matrix, coord, method = "map.max", interpol = FieldsKrigModel(10),  
     main = "Ancestry coefficients",
     xlab = "Longitude", ylab = "Latitude", 
     resolution = c(300,300), cex = .4, 
     col.palette = cluster_colors)
dev.off()


