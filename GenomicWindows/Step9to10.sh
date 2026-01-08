#!/bin/bash

echo "step 9"

echo "s/N/-/g"
for i in *.fa; do sed -i -e 's/N/-/g' $i; done

echo "trimal"
echo "Remoçao de sitios com menos de 80% de informação nucleotidica (presença de N's superior a 80%)"
#Remoçao de sitios com menos de 80% de informação nucleotidica (presença de N's superior a 80%)
for i in *.fa; do trimal -in $i -out G$i -fasta -gt 0.79; done

echo "s/-/N/g"
for i in G*; do sed -i -e 's/-/N/g' $i; done

echo "numero de janelas com menos de 80% de informação nucleotidica (presença de N's superior a 80%)"
ls G* | wc -l

echo "step 10"
echo "contagem de janelas com no minimo 50% do alinhamento após remoção de janelas com menos de 80% de informação nucleotidica (presença de N's superior a 80%)"

tmp=""
#var é a metade do valor do tamanho de janela
var="500"
for i in G*
do
	tmp=$(bioawk -c fastx '{print length($seq)}' $i | awk 'NR==1')
	echo $tmp >> alignment_length.txt
	if [ "$tmp" -ge "$var" ]
	then
		cp $i edited.$i
		echo $i >> list1kb.txt
	fi
done

echo "numero de janelas com no minimo 50% do alinhamento após remoção de janelas com menos de 80% de informação nucleotidica (presença de N's superior a 80%)"
cat list1kb.txt | wc -l
