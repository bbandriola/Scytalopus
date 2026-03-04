for i in *_lin1_final.bam; do samtools view -b -L Lin1_common_regions.bed -o $i_FilteredRegions20and60.bam $i; done
