#! /bin/bash
####step 1
##Gerar arquivos fastas sem quebras de linha
echo "step 1"
echo "Gerar arquivos fastas sem quebras de linha"
#awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' input.fasta > output_umalinha.fasta
for i in *.fa; do awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' $i > output_$i ; done
####step 2
##Indexar arquivos fastas
echo "step 2"
for i in output*; do samtools faidx $i; done
