# base
import numpy as np
import os
# import pkg_resources -> deprecated
from importlib import resources
from sklearn.impute import SimpleImputer
from pandas_plink import read_plink
import statsmodels.api as sm
# viz
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import cartopy.feature as cfeature
# feems
from feems.utils import prepare_graph_inputs, cov_to_dist
from feems.objective import comp_mats
from feems.viz import draw_FEEMSmix_surface, plot_FEEMSmix_summary
from feems import SpatialGraph, Objective, Viz
# change matplotlib fonts
plt.rcParams["font.family"] = "Arial"
plt.rcParams["font.sans-serif"] = "Arial"


# read the data 
data_path = str(resources.files('feems') / 'data')
(bim, fam, G) = read_plink("speluncaecomplex".format(os.getcwd))
imp = SimpleImputer(missing_values=np.nan, strategy="mean")
genotypes = imp.fit_transform((np.array(G)).T)
print("n_samples={}, n_snps={}".format(genotypes.shape[0], genotypes.shape[1]))
coord = np.loadtxt("{}/speluncaecomplex.coord".format(os.getcwd()))
# if needed swap the columns of the coordinates 
# coord is (lat, lon) → swap to (lon, lat)
if np.mean(coord[:, 0]) < 0 and np.mean(coord[:, 0]) > -40:  # lat range ~ -35 to -5
    coord = coord[:, ::-1]  # swap columns
    print("Swapped columns of coord to (lon, lat)")
# load files
outer = np.loadtxt("{}/speluncaecomplex.outer".format(os.getcwd()))
grid_path = "{}/grid_100.shp".format(data_path)  

# graph input files
outer, edges, grid, _ = prepare_graph_inputs(coord=coord, 
                                             ggrid=grid_path,
                                             translated=True, 
                                             buffer=0,
                                             outer=outer)

# graph
plt.figure(dpi=200, figsize=(8,6))
projection = ccrs.AzimuthalEquidistant(central_longitude=-100)
ax = plt.axes(projection=projection)
# add coastlines, borders, and land features
ax.add_feature(cfeature.COASTLINE, edgecolor='#636363', linewidth=0.5)
ax.add_feature(cfeature.BORDERS, edgecolor='gray', linewidth=0.3)
ax.add_feature(cfeature.LAND, facecolor='#f7f7f7')
# add grid points
ax.scatter(grid[:, 0], grid[:, 1], s=3, color='grey', alpha=0.7, transform=ccrs.PlateCarree(), label='grid point')
# add outer boundary
ax.plot(outer[:, 0], outer[:, 1], color='black', linewidth=1, transform=ccrs.PlateCarree(), label='outer boundary')
# add edges
# add grid points
ax.scatter(grid[:, 0], grid[:, 1], s=3, color='grey', alpha=0.7, transform=ccrs.PlateCarree(), label='grid point')
# add outer boundary
ax.plot(outer[:, 0], outer[:, 1], color='black', linewidth=1, transform=ccrs.PlateCarree(), label='outer boundary')
# add edges
for edge in edges:
    i, j = edge - 1
    ax.plot([grid[i, 0], grid[j, 0]], [grid[i, 1], grid[j, 1]], 
            color='lightgray', linewidth=1, alpha=0.6, transform=ccrs.PlateCarree())
# add sample points
ax.scatter(coord[:, 0], coord[:, 1], s=8, color='black', zorder=2,transform=ccrs.PlateCarree(), label='sample points')
plt.legend()
# output in the current directory
plt.savefig(os.path.join(os.getcwd(), "feems_map.png"), dpi=200, bbox_inches='tight')
plt.close()

# FEEMS









