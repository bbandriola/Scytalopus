```{r}
# q file from admixture see admix format
Q_tibble <- read_table2("combined.subsetted.noinv.norelated-K2-alpha0-r1.admix.2.Q", col_names = F)

# sample ids in order of .Q file
inds <- read_tsv("../pca/combined.subsetted.noinv.norelated.ids.txt", col_names = "sample_name")
breeding_inds <- read_tsv("../pca/combined.subsetted.noinv.norelated.breeding.ids.txt", col_names = "sample_name")

Q_tibble <- bind_cols(inds, Q_tibble) %>%
  filter(sample_name %in% breeding_inds$sample_name)

# you prob dont need this pca..., it is just a dataframe of PC values and sample ids I use to order my labels and filter individuals
pca <- readRDS("../pca/pcangsd_pca.rds")

LatLong_tibble <- Q_tibble %>%
  dplyr::select(sample_name) #%>%
  #left_join(pca, by = c("sample_name" = #"BGP_ID")) %>%
  dplyr::select(sample_name, lat, long)

cluster_colors <- c(
  X1 = "114678_1",
  X2 = "deeppink")

# ebird or iucn vector range map
breeding_range <- st_read("../metadata/canwar_range_2023.gpkg", quiet = TRUE) %>%
  filter(season == "breeding")

# prepare the data for tess3Q_map_rasters
long_lat_tibble <- Q_tibble %>%
  dplyr::select(sample_name) %>%
  left_join(LatLong_tibble, by = "sample_name")

long_lat_matrix <- long_lat_tibble %>%
  dplyr::select(long, lat) %>%
  as.matrix()

# make a matrix of Q values
Q_matrix <- Q_tibble %>%
  dplyr::select(-sample_name) %>%
  as.matrix()

# interpolate the Q-values by kriging using tess3r::tess3Q_map_rasters()
genoscape_brick <- tess3r::tess3Q_map_rasters(
  x = Q_matrix,
  coord = long_lat_matrix,
  map.polygon = breeding_range,
  window = extent(breeding_range)[1:4],
  resolution = c(1000,1000), # if you want more cells in your raster, set higher # bump to 3000x3000 for publication
  # this next lines need to to be here, but don't do much...
  col.palette = tess3r::CreatePalette(cluster_colors, length(cluster_colors)),
  method = "map.max",
  interpol = tess3r::FieldsKrigModel(10),
  main = "Ancestry coefficients",
  xlab = "Longitude",
  ylab = "Latitude",
  cex = .4
)

# after that, we need to add names of the clusters back onto this raster brick
names(genoscape_brick) <- names(Q_tibble)[-1]

# scaling and cleaning the genoscape_brick
genoscape_rgba <- genoscapeRtools::qprob_rando_raster(
  TRB = genoscape_brick,
  cols = cluster_colors,
  alpha_scale = 3.0, # high value makes pixels with higher Q value become more opaque
  abs_thresh = 0.0,
  alpha_exp = 1.55,
  alpha_chop_max = 255
)

# lat long proj
crs(genoscape_rgba) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

# get shapefiles from natural earth
coastlines <- ne_download(scale = 10, type = "coastline", category = "physical", returnclass = "sf")
countries <- ne_download(scale = 10, type = "admin_0_boundary_lines_land", category = "cultural", returnclass = "sf")
states <- ne_download(scale = 10, type = "admin_1_states_provinces_lines", category = "cultural", returnclass = "sf")
ocean <- ne_download(scale = 10, type = "ocean", category = "physical", returnclass = "sf")
lakes <- ne_download(scale = 10, type = "lakes", category = "physical", returnclass = "sf")

# reproject to a Lambert conic projection
genoscape_spat <- rast(genoscape_rgba)
lamproj <- "+proj=lcc +lat_1=20 +lat_2=60 +lat_0=40 +lon_0=-100 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
genoscape_projected <- terra::project(genoscape_spat, lamproj, method = "near")

# get pop centroids for plotting:
site_coords <- Q_tibble %>%
  dplyr::select(sample_name) %>%
  left_join(LatLong_tibble, by = "sample_name") %>%
  filter(!is.na(long) & !is.na(lat))

site_coords <- site_coords %>% left_join(pca %>% dplyr::select(BGP_ID, population) %>% rename(sample_name = BGP_ID), by = "sample_name")

site_coords <- st_as_sf(site_coords, coords = c('long', 'lat'), crs = 4326) %>%
  group_by(population) %>%
  summarize(geometry = st_centroid(st_union(geometry))) %>%
  ungroup()

site_coords <- site_coords %>% left_join(pop_alpha, by = "population")

breeding_range_proj <- st_transform(breeding_range, st_crs(lamproj))

genoscape_bbox <- st_bbox(breeding_range_proj)
x_range <- genoscape_bbox$xmax - genoscape_bbox$xmin
y_range <- genoscape_bbox$ymax - genoscape_bbox$ymin
coord_limits <- list(
  xlim = c(genoscape_bbox$xmin - 0.15*x_range, genoscape_bbox$xmax + 0.15*x_range),
  ylim = c(genoscape_bbox$ymin - 0.03*y_range, genoscape_bbox$ymax + 0.13*y_range)
)

genoscape <- ggplot() +
  ggspatial::layer_spatial(genoscape_projected) +
  geom_sf(data = breeding_range, fill = NA, linewidth = 0.2225 , alpha = 0.8) +
  geom_sf(data = countries, fill = NA, linewidth = 0.25) +
  geom_sf(data = coastlines, fill = NA, linewidth = 0.1225) +
  geom_sf(data = states, fill = NA, linewidth = 0.1225) +
  geom_sf(data = ocean, fill = "BDDBE6_1") +
  geom_sf(data = lakes, fill = "BDDBE6_1") +
  geom_sf(
    data = site_coords,
    fill = "black",
    shape = 21,
    color = "white",
    size = 2,
    stroke = 0.3,
    alpha = 1
   ) +
#   geom_label_repel(
#   data = site_coords,
#   aes(label = alph_lab, geometry = geometry),
#   stat = "sf_coordinates",
#   color = "black",
#   fill = "white",
#   label.size = 0.25,
#   size = 3,
#   fontface = "bold",
#   nudge_y = 5000,
#   force = 0.2,
#   max.overlaps = 50
# ) +
  theme_void() +
  coord_sf(
  crs = st_crs(lamproj),
  xlim = coord_limits$xlim,
  ylim = coord_limits$ylim,
  expand = FALSE)

genoscape

xlim <- coord_limits$xlim
ylim <- coord_limits$ylim

x_range <- diff(xlim)
y_range <- diff(ylim)
aspect_ratio <- y_range / x_range  # height / width


width_in <- 6  # for example, 10 inches
height_in <- width_in * aspect_ratio

# save the map
# ggsave(
#   "cawa_genoscape_K2.png",
#   plot = genoscape,
#   width = width_in,
#   height = height_in,
#   units = "in",
#   dpi = 300,
#   bg = "white"
# )

############################### my env
library("raster")
#install.packages("raster")

library("raster")
library(remotes)
library(raster)
library(tess3r)
library(tidyverse)
library(ggthemes)
library(sf)
library(rnaturalearth)
library(ggrepel)
setwd("~/Desktop/")
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

Q_tibble <- read_table2("./Autosomal_FilteredPCAandUCE_Max30missinessDepthmin10max100LD0.15_SspeluncaeOnly.5.Q", col_names = F)

inds <- read_tsv("./ind.txt", col_names = "sample_name")

Q_tibble <- bind_cols(inds, Q_tibble)

coords <- read.table("./UTM_speluncaeonly.csv",header=T,sep=";")

LatLong_Tibble <- coords %>%
  rename(long = Longitude, lat = Latitude)%>%
  dplyr::select(sample_name, lat, long)

LatLong_Tibble <- Q_tibble %>%
  left_join(LatLong_Tibble) %>%
  dplyr::select(sample_name,lat, long)

cluster_colors <- c(
  X1 = "#7570B3",
  X2 = "#E93F33",
  X3 = "#E6AC2F",
  X4 = "#66A61D",
  X5 = "deeppink")

range <- st_read("./smoothed_speluncaeonly_dist.shp",quiet=T)

long_lat_tibble <- Q_tibble %>%
  dplyr::select(sample_name) %>%
  left_join(LatLong_Tibble, by = "sample_name")

long_lat_matrix <- long_lat_tibble %>%
  dplyr::select(long, lat) %>%
  as.matrix()

Q_matrix <- Q_tibble %>%
  dplyr::select(-sample_name) %>%
  as.matrix()

genoscape_brick <- tess3Q_map_rasters(
  x = Q_matrix,
  coord = long_lat_matrix,
  map.polygon = range,
  window = extent(range)[1:5],
  resolution = c(1000,1000), # if you want more cells in your raster, set higher # bump to 3000x3000 for publication
  # this next lines need to to be here, but don't do much...
  col.palette = CreatePalette(cluster_colors, length(cluster_colors)),
  method = "map.max",
  interpol = FieldsKrigModel(10),
  main = "Ancestry coefficients",
  xlab = "Longitude",
  ylab = "Latitude",
  cex = .4
)

names(genoscape_brick) <- names(Q_tibble)[-1]

genoscape_rgba <- qprob_rando_raster(
  TRB = genoscape_brick,
  cols = cluster_colors,
  alpha_scale = 3.0, # high value makes pixels with higher Q value become more opaque
  abs_thresh = 0.5,
  alpha_exp = 1.55,
  alpha_chop_max = 100
)

crs(genoscape_rgba) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

genoscape_spat <- rast(genoscape_rgba)

lamproj <- "+proj=lcc +lat_1=20 +lat_2=60 +lat_0=40 +lon_0=-100 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

genoscape_projected <- terra::project(genoscape_spat, lamproj, method = "near")

coastlines <- ne_download(scale = 10, type = "coastline", category = "physical", returnclass = "sf")
countries <- ne_download(scale = 10, type = "admin_0_boundary_lines_land", category = "cultural", returnclass = "sf")
states <- ne_download(scale = 10, type = "admin_1_states_provinces_lines", category = "cultural", returnclass = "sf")
ocean <- ne_download(scale = 10, type = "ocean", category = "physical", returnclass = "sf")
#lakes <- ne_download(scale = 10, type = "lakes", category = "physical", returnclass = "sf")

site_coords <- Q_tibble %>%
  dplyr::select(sample_name) %>%
  left_join(LatLong_Tibble, by = "sample_name") %>%
  filter(!is.na(long) & !is.na(lat))

site_coords_sf <- st_as_sf(site_coords, coords = c("long", "lat"), crs = 4326)

range_proj <- st_transform(range, st_crs(lamproj))

genoscape_bbox <- st_bbox(range_proj)

x_range <- genoscape_bbox$xmax - genoscape_bbox$xmin

y_range <- genoscape_bbox$ymax - genoscape_bbox$ymin

coord_limits <- list(
  xlim = c(genoscape_bbox$xmin - 1.50*x_range, genoscape_bbox$xmax + 1.50*x_range),
  ylim = c(genoscape_bbox$ymin - 0.30*y_range, genoscape_bbox$ymax + 0.30*y_range)
)

bbox_pts <- st_bbox(site_coords_sf)

x_range <- bbox_pts$xmax - bbox_pts$xmin
y_range <- bbox_pts$ymax - bbox_pts$ymin

coord_limits <- list(
  xlim = c(bbox_pts$xmin - 0.2 * x_range,
           bbox_pts$xmax + 0.2 * x_range),
  ylim = c(bbox_pts$ymin - 0.2 * y_range,
           bbox_pts$ymax + 0.2 * y_range)
)
pdf("SpeluncaeOnly_AdmixMap_wlarlong.pdf")
ggplot() +
  ggspatial::layer_spatial(genoscape_spat) +
  geom_sf(data = range, fill = NA, linewidth = 0.2225 , alpha = 0.8,colour = NA) +
  geom_sf(data = countries, fill = NA, linewidth = 0.25) +
  geom_sf(data = coastlines, fill = NA, linewidth = 0.1225) +
  geom_sf(data = states, fill = NA, linewidth = 0.1225) +
  geom_sf(data = ocean, fill = "lightblue") +
  geom_sf(data = site_coords_sf,fill = "black",shape = 21,color = "white",size = 2,stroke = 0.3,alpha = 1) +
  theme_void() +
  coord_sf(crs = st_crs(4326),xlim = coord_limits$xlim,ylim = coord_limits$ylim,label_graticule = "SW",expand = FALSE) +
  theme(
    axis.text = element_text(size = 9.5, color = "black"),
    axis.title = element_text(size = 9.5),
    axis.ticks = element_line(color = "black"),
    panel.border = element_rect(color = "black", fill = NA)) +
    scale_x_continuous(breaks = seq(floor(coord_limits$xlim[1]),ceiling(coord_limits$xlim[2]),by = 4)) +
    scale_y_continuous(breaks = seq(floor(coord_limits$ylim[1]),
               ceiling(coord_limits$ylim[2]),by = 4))
dev.off()

