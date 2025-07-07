# use inside the fasta files directory 
# usage: bash GetFastaLength.sh
for i in /media/labgenoma4/DATAPART3/bandriola/Scytalopus/snparcher/bams/Fastas/masked_fastas/8_5kb_int100kb/8_2_LIST_FILE_5kb/windows/edited*.fa; do
    echo "Results for $i:" >> ./result_all_fafiles50kb.txt
    seqkit fx2tab --length --header-line -n "$i" >> ./result_all_fafiles50kb.txt
done
