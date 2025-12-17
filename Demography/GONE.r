# GONE 
# 1. generate file ped/map
# plink
# --allow-extra-chr
#  --out Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10
#  --recode
#  --vcf Lin1_bigger500kbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_GeographicNames_allsamples.vcf.recode.vcf.gz

# 2. organize the map file 
# change scaffolds to chr : 
  # awk '!seen[$1]++ { chr++; map[$1]=chr } { print map[$1], $2, $3, $4 }' Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
  # cp Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10.ped Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr.ped
# add snp numbers to each snp 
  # awk '{$2=NR; print}' Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map
  # mv Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
# move the files to the GONE directory
  # mv Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/

# 3. run GONE
# before running:       
  #export TMPDIR="$(pwd)/tmp"
  #export TEMP="$TMPDIR"
  #export TMP="$TMPDIR"
# bash scrip_GONE.sh filemap/ped

# 4. plot in R 
# Read GONE output
library(ggplot2)
setwd("./")
gone <- read.table("Output_Ne_fixed", header = TRUE, skip=1)

# Detect format
if (ncol(gone) == 2) {
  colnames(gone) <- c("Generation", "Ne")
} else {
  colnames(gone) <- c("Generation", "Ne", "Ne_low", "Ne_high")
}

g <- 3.2  # example
gone$Years <- gone$Generation * g

pdf("teste.pdf",,width = 10,height = 10)
ggplot(gone, aes(x = Generation, y = Ne)) +
  geom_line(linewidth = 1) +
  scale_x_log10() +
  labs(
    x = "Generations in the past",
    y = "Effective population size (Ne)",
    title = "Demographic history inferred by GONE"
  ) +
  theme_classic()

ggplot(gone, aes(x = Generation, y = Ne)) +
  geom_ribbon(aes(ymin = Ne_low, ymax = Ne_high), fill = "grey80") +
  geom_line(linewidth = 1) +
  scale_x_log10() +
  theme_classic()
dev.off()

# Plot
plot(
  gone$Generation,
  gone$Ne,
  type = "l",
  log = "x",
  lwd = 2,
  xlab = "Generations in the past",
  ylab = "Effective population size (Ne)",
  main = "Demographic history inferred by GONE"
)

# Add CI if present
if ("Ne_low" %in% colnames(gone)) {
  polygon(
    c(gone$Generation, rev(gone$Generation)),
    c(gone$Ne_low, rev(gone$Ne_high)),
    col = rgb(0.7, 0.7, 0.7, 0.5),
    border = NA
  )
  lines(gone$Generation, gone$Ne, lwd = 2)
}


###################################################################
vcftools --gzvcf Lin2_1Mscaffolds_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --chr VXBX01009921.1 --chr VXBX01004249.1 --chr VXBX01003474.1 --chr VXBX01008609.1 --chr VXBX01002725.1 --chr VXBX01005888.1 --chr VXBX01003014.1 --chr VXBX01007701.1 --chr VXBX01003755.1 --chr VXBX01008695.1 --chr VXBX01007125.1 --chr VXBX01008236.1 --chr VXBX01009439.1 --chr VXBX01001056.1 --chr VXBX01001501.1 --chr VXBX01007795.1 --chr VXBX01004397.1 --chr VXBX01007997.1 --chr VXBX01008145.1 --chr VXBX01008674.1 --chr VXBX01003991.1 --chr VXBX01001608.1 --chr VXBX01006871.1 --chr VXBX01006773.1 --chr VXBX01001698.1 --chr VXBX01000547.1 --chr VXBX01009827.1 --chr VXBX01004616.1 --chr VXBX01001175.1 --chr VXBX01003868.1 --chr VXBX01005266.1 --chr VXBX01005702.1 --chr VXBX01004221.1 --chr VXBX01004071.1 --chr VXBX01008400.1 --chr VXBX01002109.1 --chr VXBX01002369.1 --chr VXBX01006211.1 --chr VXBX01009452.1 --chr VXBX01008453.1 --chr VXBX01003936.1 --out Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10 --recode
vcftools --gzvcf Lin3_1Mscaffolds_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --chr VXBX01009921.1 --chr VXBX01004249.1 --chr VXBX01003474.1 --chr VXBX01008609.1 --chr VXBX01002725.1 --chr VXBX01005888.1 --chr VXBX01003014.1 --chr VXBX01007701.1 --chr VXBX01003755.1 --chr VXBX01008695.1 --chr VXBX01007125.1 --chr VXBX01008236.1 --chr VXBX01009439.1 --chr VXBX01001056.1 --chr VXBX01001501.1 --chr VXBX01007795.1 --chr VXBX01004397.1 --chr VXBX01007997.1 --chr VXBX01008145.1 --chr VXBX01008674.1 --chr VXBX01003991.1 --chr VXBX01001608.1 --chr VXBX01006871.1 --chr VXBX01006773.1 --chr VXBX01001698.1 --chr VXBX01000547.1 --chr VXBX01009827.1 --chr VXBX01004616.1 --chr VXBX01001175.1 --chr VXBX01003868.1 --chr VXBX01005266.1 --chr VXBX01005702.1 --chr VXBX01004221.1 --chr VXBX01004071.1 --chr VXBX01008400.1 --chr VXBX01002109.1 --chr VXBX01002369.1 --chr VXBX01006211.1 --chr VXBX01009452.1 --chr VXBX01008453.1 --chr VXBX01003936.1 --out Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10 --recode
vcftools --gzvcf Lin4_1Mscaffolds_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --chr VXBX01009921.1 --chr VXBX01004249.1 --chr VXBX01003474.1 --chr VXBX01008609.1 --chr VXBX01002725.1 --chr VXBX01005888.1 --chr VXBX01003014.1 --chr VXBX01007701.1 --chr VXBX01003755.1 --chr VXBX01008695.1 --chr VXBX01007125.1 --chr VXBX01008236.1 --chr VXBX01009439.1 --chr VXBX01001056.1 --chr VXBX01001501.1 --chr VXBX01007795.1 --chr VXBX01004397.1 --chr VXBX01007997.1 --chr VXBX01008145.1 --chr VXBX01008674.1 --chr VXBX01003991.1 --chr VXBX01001608.1 --chr VXBX01006871.1 --chr VXBX01006773.1 --chr VXBX01001698.1 --chr VXBX01000547.1 --chr VXBX01009827.1 --chr VXBX01004616.1 --chr VXBX01001175.1 --chr VXBX01003868.1 --chr VXBX01005266.1 --chr VXBX01005702.1 --chr VXBX01004221.1 --chr VXBX01004071.1 --chr VXBX01008400.1 --chr VXBX01002109.1 --chr VXBX01002369.1 --chr VXBX01006211.1 --chr VXBX01009452.1 --chr VXBX01008453.1 --chr VXBX01003936.1 --out Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10 --recode
vcftools --gzvcf Lin5_1Mscaffolds_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --chr VXBX01009921.1 --chr VXBX01004249.1 --chr VXBX01003474.1 --chr VXBX01008609.1 --chr VXBX01002725.1 --chr VXBX01005888.1 --chr VXBX01003014.1 --chr VXBX01007701.1 --chr VXBX01003755.1 --chr VXBX01008695.1 --chr VXBX01007125.1 --chr VXBX01008236.1 --chr VXBX01009439.1 --chr VXBX01001056.1 --chr VXBX01001501.1 --chr VXBX01007795.1 --chr VXBX01004397.1 --chr VXBX01007997.1 --chr VXBX01008145.1 --chr VXBX01008674.1 --chr VXBX01003991.1 --chr VXBX01001608.1 --chr VXBX01006871.1 --chr VXBX01006773.1 --chr VXBX01001698.1 --chr VXBX01000547.1 --chr VXBX01009827.1 --chr VXBX01004616.1 --chr VXBX01001175.1 --chr VXBX01003868.1 --chr VXBX01005266.1 --chr VXBX01005702.1 --chr VXBX01004221.1 --chr VXBX01004071.1 --chr VXBX01008400.1 --chr VXBX01002109.1 --chr VXBX01002369.1 --chr VXBX01006211.1 --chr VXBX01009452.1 --chr VXBX01008453.1 --chr VXBX01003936.1 --out Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10 --recode
vcftools --gzvcf Lin6_1Mscaffolds_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --chr VXBX01009921.1 --chr VXBX01004249.1 --chr VXBX01003474.1 --chr VXBX01008609.1 --chr VXBX01002725.1 --chr VXBX01005888.1 --chr VXBX01003014.1 --chr VXBX01007701.1 --chr VXBX01003755.1 --chr VXBX01008695.1 --chr VXBX01007125.1 --chr VXBX01008236.1 --chr VXBX01009439.1 --chr VXBX01001056.1 --chr VXBX01001501.1 --chr VXBX01007795.1 --chr VXBX01004397.1 --chr VXBX01007997.1 --chr VXBX01008145.1 --chr VXBX01008674.1 --chr VXBX01003991.1 --chr VXBX01001608.1 --chr VXBX01006871.1 --chr VXBX01006773.1 --chr VXBX01001698.1 --chr VXBX01000547.1 --chr VXBX01009827.1 --chr VXBX01004616.1 --chr VXBX01001175.1 --chr VXBX01003868.1 --chr VXBX01005266.1 --chr VXBX01005702.1 --chr VXBX01004221.1 --chr VXBX01004071.1 --chr VXBX01008400.1 --chr VXBX01002109.1 --chr VXBX01002369.1 --chr VXBX01006211.1 --chr VXBX01009452.1 --chr VXBX01008453.1 --chr VXBX01003936.1 --out Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10 --recode
vcftools --gzvcf Lin7_1Mscaffolds_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --chr VXBX01009921.1 --chr VXBX01004249.1 --chr VXBX01003474.1 --chr VXBX01008609.1 --chr VXBX01002725.1 --chr VXBX01005888.1 --chr VXBX01003014.1 --chr VXBX01007701.1 --chr VXBX01003755.1 --chr VXBX01008695.1 --chr VXBX01007125.1 --chr VXBX01008236.1 --chr VXBX01009439.1 --chr VXBX01001056.1 --chr VXBX01001501.1 --chr VXBX01007795.1 --chr VXBX01004397.1 --chr VXBX01007997.1 --chr VXBX01008145.1 --chr VXBX01008674.1 --chr VXBX01003991.1 --chr VXBX01001608.1 --chr VXBX01006871.1 --chr VXBX01006773.1 --chr VXBX01001698.1 --chr VXBX01000547.1 --chr VXBX01009827.1 --chr VXBX01004616.1 --chr VXBX01001175.1 --chr VXBX01003868.1 --chr VXBX01005266.1 --chr VXBX01005702.1 --chr VXBX01004221.1 --chr VXBX01004071.1 --chr VXBX01008400.1 --chr VXBX01002109.1 --chr VXBX01002369.1 --chr VXBX01006211.1 --chr VXBX01009452.1 --chr VXBX01008453.1 --chr VXBX01003936.1 --out Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10 --recode

gzip Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf
gzip Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf
gzip Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf
gzip Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf
gzip Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf
gzip Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf

conda activate plink

plink --vcf Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --allow-extra-chr --recode --out Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10
plink --vcf Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --allow-extra-chr --recode --out Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10
plink --vcf Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --allow-extra-chr --recode --out Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10
plink --vcf Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --allow-extra-chr --recode --out Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10
plink --vcf Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --allow-extra-chr --recode --out Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10
plink --vcf Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.recode.vcf.gz --allow-extra-chr --recode --out Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10

awk '!seen[$1]++ { chr++; map[$1]=chr } { print map[$1], $2, $3, $4 }' Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.map > Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '!seen[$1]++ { chr++; map[$1]=chr } { print map[$1], $2, $3, $4 }' Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.map > Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '!seen[$1]++ { chr++; map[$1]=chr } { print map[$1], $2, $3, $4 }' Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.map > Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '!seen[$1]++ { chr++; map[$1]=chr } { print map[$1], $2, $3, $4 }' Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.map > Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '!seen[$1]++ { chr++; map[$1]=chr } { print map[$1], $2, $3, $4 }' Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.map > Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '!seen[$1]++ { chr++; map[$1]=chr } { print map[$1], $2, $3, $4 }' Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.map > Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map

cp Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.ped Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.ped
cp Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.ped Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.ped
cp Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.ped Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.ped
cp Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.ped Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.ped
cp Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.ped Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.ped
cp Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10.ped Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.ped

awk '{$2=NR; print}' Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map
awk '{$2=NR; print}' Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map
awk '{$2=NR; print}' Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map
awk '{$2=NR; print}' Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map
awk '{$2=NR; print}' Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map
awk '{$2=NR; print}' Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map > Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map

awk '{ $2 = "SNP"$2; print }' Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map > Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '{ $2 = "SNP"$2; print }' Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map > Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '{ $2 = "SNP"$2; print }' Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map > Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '{ $2 = "SNP"$2; print }' Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map > Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '{ $2 = "SNP"$2; print }' Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map > Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
awk '{ $2 = "SNP"$2; print }' Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map > Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map

mv Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
mv Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
mv Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
mv Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
mv Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map
mv Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr1.map Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr.map


mv Lin1_bigger1Mbscaffolds_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/
mv Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/
mv Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/
mv Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/
mv Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/
mv Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/
mv Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr* ~/Scytalopus/GONE/Linux/

bash script_GONE.sh Lin2_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr
bash script_GONE.sh Lin3_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr
bash script_GONE.sh Lin4_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr
bash script_GONE.sh Lin5_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr
bash script_GONE.sh Lin6_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr
bash script_GONE.sh Lin7_42scaffolds2M_FilteredPCAandUCE_Max30missingDepthmin10_chr
