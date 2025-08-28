# one line fasta from C. lanceolata genome lift off 
#ex: 
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' DevonianaSP1_lin5_ragtag/ragtag.scaffold.fasta > DevonianaSP1_lin5_ragtag.oneline.fasta

# extract one the line with the W info + sequence line 
for i in *_ragtag.oneline.fasta; awk '/^>NC_045670.1/{print; f=1; next} /^>/{f=0} f' $i > Wchr_$i;done
