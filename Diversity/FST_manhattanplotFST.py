# usage: python FST_manhattanplotFST.py input.fst output_prefix --quantile 0.999

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
from matplotlib.backends.backend_pdf import PdfPages
import argparse
import os

# =============================
# Arguments
# =============================
parser = argparse.ArgumentParser(
    description="Plot Manhattan FST and extract 99th percentile outliers"
)
parser.add_argument(
    "input", help="Input FST file (vcftools windowed.weir.fst format)"
)
parser.add_argument(
    "outprefix", help="Prefix for output files (without extension)"
)
parser.add_argument(
    "--quantile", type=float, default=0.99,
    help="Quantile threshold (e.g. 0.99 for 99th percentile, 0.999 for 99.9th)"
)
args = parser.parse_args()

infile = args.input
outprefix = args.outprefix
quantile = args.quantile

# =============================
# Read input
# =============================
windowStats = pd.read_csv(infile, sep="\t")

# Rename columns for consistency
windowStats = windowStats.rename(columns={
    "CHROM": "scaffold",
    "BIN_START": "start",
    "BIN_END": "end",
    "MEAN_FST": "Fst"
})

# Compute midpoints
windowStats["mid"] = (windowStats["start"] + windowStats["end"]) / 2

# =============================
# Prepare genome-wide positions
# =============================
scaffolds = windowStats["scaffold"].unique()
chrom_sizes = windowStats.groupby("scaffold")["end"].max()
offsets = chrom_sizes.cumsum().shift(fill_value=0)

windowStats["pos_cum"] = windowStats.apply(
    lambda row: row["mid"] + offsets[row["scaffold"]], axis=1
)

# =============================
# Helper: lighten color
# =============================
def lighten_color(hex_color, amount=0.5):
    rgb = mcolors.hex2color(hex_color)
    white = (1, 1, 1)
    new_rgb = tuple((1 - amount) * c + amount * w for c, w in zip(rgb, white))
    return mcolors.to_hex(new_rgb)

# =============================
# Plot Manhattan and extract outliers
# =============================
def plot_manhattan(df, col, ylabel, pdf, outprefix):
    fig, ax = plt.subplots(figsize=(14, 4))

    cmap = plt.get_cmap("tab10", 1)
    hexc = [mcolors.rgb2hex(cmap(0))]
    colors = [hexc[0], lighten_color(hexc[0], 0.5)]

    # Scatter by scaffold
    for i, scaffold in enumerate(scaffolds):
        sub = df[df["scaffold"] == scaffold]
        ax.scatter(sub["pos_cum"], sub[col], s=8,
                   c=colors[i % 2], alpha=0.8)

    # Mean line
    mean_val = df[col].mean(skipna=True)
    ax.axhline(mean_val, color="grey", linestyle="--",
               label=f"Mean = {mean_val:.3f}")

    # 99th percentile line
    pct_val = df[col].quantile(quantile)
    ax.axhline(pct_val, color="black", linestyle=":",
           label=f"{quantile*100:.1f}th pct = {pct_val:.3f}")

    # Outliers
    outliers = df[df[col] > pct_val].copy()
    outliers["threshold"] = pct_val
    out_csv = f"{outprefix}_FST_outliers_{int(quantile*1000)}th.csv"
    outliers.to_csv(out_csv, sep="\t", index=False)

    # Labels
    ax.set_ylabel(ylabel)
    ax.legend(fontsize=8)
    ax.set_xlabel("Scaffolds")

    plt.tight_layout()
    pdf.savefig(fig)
    plt.close(fig)

    print(f"[INFO] Outliers saved to {out_csv}")

# =============================
# Run
# =============================
pdf_file = f"{outprefix}_MEAN_FST_manhattan.pdf"
with PdfPages(pdf_file) as pdf:
    plot_manhattan(windowStats, "Fst", "Mean FST", pdf, outprefix)

print(f"[INFO] Plots saved to {pdf_file}")
