# extract outlier regions 

# convert csv into bed file
awk 'BEGIN{OFS="\t"} NR>1 {print $1,$2,$3}' lin5vslin6_FST_outliers_999th.csv > lin5vslin6_FST_outliers_999th.bed

# sort bed from outlier
sort -k1,1 -k2,2n lin5vslin6_FST_outliers_999th.bed > lin5vslin6_FST_outliers_999th.sorted.bed
# sort bed from gene annotation from NCBI
sort -k1,1 -k4,4n GCA_013400415.1_ASM1340041v1_genomic.gff > GCA_013400415.1_ASM1340041v1_genomic.sorted.gff

# Intersect: genes that overlap BED window (each gene reported once)
bedtools intersect -a GCA_013400415.1_ASM1340041v1_genomic.sorted.gff -b lin5vslin6_FST_outliers_999th.sorted.bed -sorted -wa -u > lin5vslin6_genesFST_outliers.gff
