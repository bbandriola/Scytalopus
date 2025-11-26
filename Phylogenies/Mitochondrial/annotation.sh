#1:
for i in *Ssuperciliaris.bam.fa; do /labgenomaarea/bandriola/Scytalopus/mito/fastas/annotatedfastas/bedtools2/bin/bedtools getfasta -fo $i.annotated -fi $i -bed mitoregions_chrNoIDPOS.bed; done

#2:
for i in *bam.fa.annotated; do ./splifastas.sh $i; done

#3: concatenate the different regions in a single fasta to open in BEAST
for i in *-*.txt; do ./concat_by_region.sh $i $i.region.fasta; done

#4: choose a susbtitution model 
iqtree -s right_1-2776.txt.region.fasta -m MFP --prefix 1-2776_modelfinder
