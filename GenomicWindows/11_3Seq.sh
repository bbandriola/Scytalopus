#!/bin/bash

#run 3 seq
for i in edited*.fa; do ~/Softwares/3Seq/3seq\ build\ 170612/3seq -f $i -id $i; done

echo "3seq done"

#moving files

mkdir 3seq

mv *.3s.log ./3seq/
mv *.3s.pvalHist ./3seq/
mv *.3s.longRec ./3seq/
mv *.3s.rec ./3seq/

echo "moved files"

#Gerar arquivos com a correção Bonferroni

cd ./3seq/

for i in *.3s.log; do grep -H 'Bonferroni' $i >> Bonferroni_1kb.csv; done

#open the file on excel and check for recombination into the window <cut at 0,01>

echo "done"
