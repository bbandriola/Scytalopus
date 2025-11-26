#1:
for i in *Ssuperciliaris.bam.fa; do /labgenomaarea/bandriola/Scytalopus/mito/fastas/annotatedfastas/bedtools2/bin/bedtools getfasta -fo $i.annotated -fi $i -bed mitoregions_chrNoIDPOS.bed; done

#2:
for i in *bam.fa.annotated; do ./splifastas.sh $i; done

#3: concatenate the different regions in a single fasta to open in BEAST
for i in *-*.txt; do ./concat_by_region.sh $i $i.region.fasta; done

#4: choose a susbtitution model 
java -jar jModelTest.jar -d sequence -g 4 -AIC -BIC -f -i -o Jmodelteste__.out -tr 5 -a
