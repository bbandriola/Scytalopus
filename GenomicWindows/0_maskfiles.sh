# 1. Mask fastas with birds repository from bedtools
for i in *fa; do bedtools maskfasta -fi $i -bed /media/labgenoma4/DATAPART7/sandro_grupo/raw_data/bruna/refSsuperciliaris/GCA_013400415.1_ASM1340041v1/MaskedRegions.bed -fo masked_fastas/$i_masked.fa -mc N; done

