#plink --allow-extra-chr --maf 0.0000001 --make-bed --out ./OnlyVars_NomissingGenos_FilteredPCAandUCE_Max30missinessDepthmin10max100_SspeluncaeOnly --vcf /media/labgenoma5/DATAPART2/bandriola/Scytalopus/vcfs/FinalVCFs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --remove-fam removeind_speluncaeOnly.txt

#plink --allow-extra-chr --maf 0.0000001 --make-bed --out ./OnlyVars_NomissingGenos_FilteredPCAandUCE_Max30missinessDepthmin10max100_SspeluncaeOnly --vcf /media/labgenoma5/DATAPART2/bandriola/Scytalopus/vcfs/FinalVCFs/FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex.vcf.gz --remove-fam removeind_speluncaeOnly.txt

import numpy as np
import os
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
from feems.cross_validation import run_cv, run_cv_joint
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
# change matplotlib fonts
plt.rcParams["font.family"] = "Arial"
plt.rcParams["font.sans-serif"] = "Arial"
plt.rcParams["font.family"] = "Helvetica"
plt.rcParams["font.sans-serif"] = "Helvetica"

##OnlyVars_NomissingGenos_FilteredPCAandUCE_Max30missinessDepthmin10max100_Sspeluncaecomplex_bettermap.outer

(bim, fam, G) = read_plink("OnlyVars_NomissingGenos_FilteredPCAandUCE_Max30missinessDepthmin10max100_SspeluncaeOnly".format(os.getcwd))
imp = SimpleImputer(missing_values=np.nan, strategy="mean")
genotypes = imp.fit_transform((np.array(G)).T)
print("n_samples={}, n_snps={}".format(genotypes.shape[0], genotypes.shape[1]))

# load files
coord = np.loadtxt("{}/oldrun/Onlyspeluncae.coord".format(os.getcwd()))
outer = np.loadtxt("{}/oldrun/Onlyspeluncae.outer".format(os.getcwd()))
data_path = str(resources.files('feems') / 'data')
grid_path = "{}/grid_100.shp".format(data_path)  
grid_path = ("{}/world_triangle_res8.shp".format(os.getcwd()))

# graph input files
outer, edges, grid, _ = prepare_graph_inputs(coord=coord, 
                                             ggrid=grid_path,
                                             translated=True, 
                                             buffer=0,
                                             outer=outer)

# graph to check if the samples fit to the edges of the map 
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
plt.savefig(os.path.join(os.getcwd(), "SspeluncaeOnlygridr8_feems_map.png"), dpi=200, bbox_inches='tight')
plt.close()


# FEEMS data projection
sp_graph = SpatialGraph(genotypes, coord, grid, edges)
projection = ccrs.AzimuthalEquidistant(central_longitude=-100)

# check projection
fig = plt.figure(dpi=300)
ax = fig.add_subplot(1, 1, 1, projection=projection)  
v = Viz(ax, sp_graph, projection=projection, edge_width=.5, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=10, 
        obs_node_size=7.5, sample_pt_color="black", 
        cbar_font_size=10)
v.draw_map(longlat=True)
v.draw_samples()
v.draw_edges(use_weights=False)
v.draw_obs_nodes(use_ids=False)
plt.savefig(os.path.join(os.getcwd(), "SspeluncaeOnlygridr8_feems_map2.png"), dpi=200, bbox_inches='tight')
plt.close()

## cross-validation approach to find the combination of lamb and lamb_q that provides the lowest error
# define grids
# reverse the order of lambdas and alphas for warmstart
lamb_grid = np.geomspace(1e2, 1e5, 10)[::-1]
lamb_q_grid = np.geomspace(1e-2, 1e2, 5, endpoint=True)[::-1]

# run cross-validation over both smoothing parameters
cv_err = run_cv_joint(sp_graph, lamb_grid, lamb_q_grid, n_folds=5, factr=1e10)

# average over folds
mean_cv_err = np.mean(cv_err, axis=0)
# lamb & lamb_q CV values
lamb_q_cv = lamb_q_grid[np.where(mean_cv_err == np.min(mean_cv_err))[0][0]]
lamb_cv = lamb_grid[np.where(mean_cv_err == np.min(mean_cv_err))[1][0]]

# plot the figure of CV error
plt.figure(dpi = 200)
plt.gca().set_prop_cycle(color=[plt.get_cmap('Greys_r').resampled(len(lamb_q_grid)+2)(i) for i in range(1,len(lamb_q_grid)+1)])
lineObj = plt.plot(lamb_grid, mean_cv_err.T, '-o', linewidth = 2, alpha = 0.8)
plt.legend(lineObj, lamb_q_grid, title=r'$\lambda_q$'); plt.grid()
plt.xlabel(r'$\lambda$'); plt.semilogx(); plt.ylabel('LOO-CV error')
plt.axvline(lamb_cv, linewidth = 2, color = 'orange')
plt.savefig(os.path.join(os.getcwd(), "SspeluncaeOnlygridr8_cross-validation_.svg"),
            dpi=200, bbox_inches='tight')
plt.close()

##########################################
## testing different lamb params ########

# figure params
projection = ccrs.AzimuthalEquidistant(central_longitude=-108.842926, central_latitude=66.037547)
title_loc = "left"
title_pad = "-10"
title_fontsize = 12
edge_width = .2
edge_alpha = 1
edge_zorder = 3
obs_node_size = 3
obs_node_linewidth = .4
cbar_font_size = 8
cbar_ticklabelsize = 8
cbar_orientation = "horizontal"

# figure setup
fig = plt.figure(dpi=300)
spec = gridspec.GridSpec(ncols=2, nrows=2, figure=fig, wspace=0.0, hspace=0.0)

# axis 00 
ax_00 = fig.add_subplot(spec[0, 0], projection=projection)
ax_00.set_title("A", loc=title_loc, pad=title_pad, fontdict={"fontsize": title_fontsize})
sp_graph.fit(lamb=lamb_grid[0], lamb_q=lamb_q_grid[0])
v = Viz(ax_00, sp_graph, projection=projection, edge_width=edge_width, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=20, 
        obs_node_size=obs_node_size, sample_pt_color="black", 
        cbar_font_size=10)
v.draw_map(longlat=False)
v.draw_edges(use_weights=True)
v.draw_obs_nodes(use_ids=False) 
ax_00.text(.2, .85, "lambda={:.2f}\nlambda_q={:.2f}\ncv l2 error={:.5f}".format(lamb_grid[0], lamb_q_grid[0], mean_cv_err[0, 0]), 
           fontdict={"fontsize": 4}, transform = ax_00.transAxes)

# axis 10
ax_10 = fig.add_subplot(spec[1, 0], projection=projection)
ax_10.set_title("B", loc=title_loc, pad=title_pad, fontdict={"fontsize": title_fontsize})
sp_graph.fit(lamb=lamb_cv, lamb_q=lamb_q_cv)
v = Viz(ax_10, sp_graph, projection=projection, edge_width=edge_width, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=20,
        obs_node_size=obs_node_size, sample_pt_color="black", 
        cbar_font_size=10)
v.draw_map(longlat=False)
v.draw_edges(use_weights=True)
v.draw_obs_nodes(use_ids=False) 
ax_10.text(.2, .85, "lambda={:.2f}\nlambda_q={:.2f}\ncv l2 error={:.5f}".format(lamb_cv, lamb_q_cv, mean_cv_err[np.where(lamb_q_cv==lamb_q_grid)[0][0], np.where(lamb_cv==lamb_grid)[0][0]]), 
           fontdict={"fontsize": 4}, transform = ax_10.transAxes)

# axis 01
ax_01 = fig.add_subplot(spec[0, 1], projection=projection)
ax_01.set_title("C", loc=title_loc, pad=title_pad, fontdict={"fontsize": title_fontsize})
sp_graph.fit(lamb=lamb_cv, lamb_q=0.01*lamb_q_cv)
v = Viz(ax_01, sp_graph, projection=projection, edge_width=edge_width, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=20, 
        obs_node_size=obs_node_size, sample_pt_color="black", 
        cbar_font_size=10)
v.draw_map(longlat=False)
v.draw_edges(use_weights=True)
v.draw_obs_nodes(use_ids=False) 
ax_01.text(.2, .85, "lambda={:.2f}\nlambda_q={:.2f}\ncv l2 error={:.5f}".format(lamb_cv, 0.01*lamb_q_cv, mean_cv_err[np.where(0.01*lamb_q_cv==lamb_q_grid)[0][0], np.where(lamb_cv==lamb_grid)[0][0]]), 
           fontdict={"fontsize": 4}, transform = ax_01.transAxes)

# axis 11
ax_11 = fig.add_subplot(spec[1, 1], projection=projection)
ax_11.set_title("D", loc=title_loc, pad=title_pad, fontdict={"fontsize": title_fontsize})
sp_graph.fit(lamb=lamb_grid[-2], lamb_q=lamb_q_grid[-1])
v = Viz(ax_11, sp_graph, projection=projection, edge_width=edge_width, 
       edge_alpha=1, edge_zorder=100, sample_pt_size=20, 
       obs_node_size=obs_node_size, sample_pt_color="black", 
       cbar_font_size=10)
v.draw_map(longlat=False)
v.draw_edges(use_weights=True)
v.draw_obs_nodes(use_ids=False)
v.cbar_font_size = cbar_font_size
v.cbar_orientation = cbar_orientation
v.cbar_ticklabelsize = cbar_ticklabelsize
v.draw_edge_colorbar()
ax_11.text(.2, .85, "lambda={:.2f}\nlambda_q={:.2f}\ncv l2 error={:.5f}".format(lamb_grid[-2], lamb_q_grid[-1], mean_cv_err[-1, -2]), 
          fontdict={"fontsize": 4}, transform = ax_11.transAxes)

plt.savefig(os.path.join(os.getcwd(), "SspeluncaeOnlygridr8_lambsiferentes.png"),
            dpi=200, bbox_inches='tight')
plt.close()

#######################################################
# extract the first minimum CV 
# restrict λ range manually (example indices)
lmin, lmax = 2, 5   # adjust to bracket first dip

sub = mean_cv_err[:, lmin:lmax]
idx_q, idx_l = np.unravel_index(np.argmin(sub), sub.shape)

lamb_q_cv = lamb_q_grid[idx_q]
lamb_cv   = lamb_grid[idx_l + lmin]

# running FEEMS
sp_graph.fit(lamb = 21544.346900318822,lamb_q=0.01,optimize_q=None)
# graphic
fig = plt.figure(dpi=300)
ax = fig.add_subplot(1, 1, 1, projection=projection)  
v = Viz(ax, sp_graph, projection=projection, edge_width=.5, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=20, 
        obs_node_size=7.5, sample_pt_color="black", 
        cbar_font_size=10,cbar_loc='upper left',cbar_orientation = "horizontal")
v.draw_map()
v.draw_edges(use_weights=True)
v.draw_obs_nodes(use_ids=False) 
v.draw_edge_colorbar()
v.draw_samples()
plt.savefig(os.path.join(os.getcwd(), "SspeluncaeOnlygridr8_lambfirstminimumCVfeemsrun.svg"),
            dpi=200, bbox_inches='tight')
plt.close()

# visualize deme-specific variance parameter (based on het and ne)
sp_graph.fit(lamb = 2.0, lamb_q = 10.0, optimize_q = 'n-dim')
fig = plt.figure(dpi=300)
ax = fig.add_subplot(1, 1, 1, projection=projection)  
v = Viz(ax, sp_graph, projection=projection, edge_width=.5, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=20, 
        obs_node_size=7.5, sample_pt_color="black", 
        cbar_font_size=10,cbar_loc='upper left')
v.draw_map()
v.draw_edges(use_weights=True)
v.draw_obs_nodes(use_ids=False) 
v.draw_edge_colorbar()
v.draw_samples()
plt.savefig(os.path.join(os.getcwd(), "SspeluncaeOnlygridr8_lamb2feemsrun_variance.svg"),
            dpi=200, bbox_inches='tight')
plt.close()

# visualize the fit of the model to the observed pairwise genetic distances from the genotype matrix
# creating an obj 
obj = Objective(sp_graph); obj.inv(); obj.grad(reg=False)
# computing distances matrice for fit (expected) vs empirical (observed) 
fit_cov, _, emp_cov = comp_mats(obj)
# subsetting matrices to arrays 
fit_dist = cov_to_dist(fit_cov)[np.tril_indices(sp_graph.n_observed_nodes, k=-1)]
emp_dist = cov_to_dist(emp_cov)[np.tril_indices(sp_graph.n_observed_nodes, k=-1)]

# fitting a linear model to the observed distances
X = sm.add_constant(fit_dist)
mod = sm.OLS(emp_dist, X)
res = mod.fit()
muhat, betahat = res.params

plt.figure(dpi=100)
plt.plot(fit_dist, emp_dist, 'o', color='k', alpha=0.8, markersize=4)
plt.axline((0.5,0.5*betahat+muhat), slope=betahat, color='orange', ls='--', lw=3)
plt.text(1, 0.5, "R²={:.3f}".format(res.rsquared), fontsize=15)
plt.xlabel('Fitted distance'); plt.ylabel('Genetic distance')
plt.title(r"$\tt{FEEMS}$ fit with fixed node-specific variance")
plt.savefig(os.path.join(os.getcwd(), "SspeluncaeOnlygridr8_lamb2feemsrun_modelfit.svg"),
            dpi=200, bbox_inches='tight')
plt.close()


