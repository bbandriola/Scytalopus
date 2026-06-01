# all populations together to estimate the ancester allele 
for i in chrVXBX0100*vcf.gz; do python SFS/Generate_input_est-sfs.py $i SFS/groupfile_ANCAllele_Lin4Lin3LinDEV.txt > inputest-sfs_$i.allele; done

# edited generated file
for i in inputest-sfs_*.allele; do tail -n +2 $i | awk -F'\t' 'BEGIN{OFS="\t"} {gsub(/2/,"1",$2); gsub(/2/,"1",$3); print}' > $i.txt; done

# run est-sfsls 
echo "running first chr..."
est-sfs config_file.txt chrVXBX01009921.allele.txt seedfile.txt chrVXBX01009921_output-file-sfs.txt hrVXBX01009921_output-file-pvalues.txt
echo "you made it! next"
est-sfs config_file.txt chrVXBX01004249.allele.txt seedfile.txt chrVXBX01009921_output-file-sfs.txt chrVXBX01009921_output-file-pvalues.txt
echo "done! celebrate and do it all again"

# get the ancester allele 
for i in chrVXBX*_output-file-pvalues.txt; do sed '1,8d' $i > MODIF_$i; done
bash gettheancestralstate.sh

# get the reference allele
for i in {1..38}; do
  grep -v "#" ${VCF_FILTERED}.chr$i.vcf | cut -f 1,2,4 > variants_chr$i.txt
done

# merge ref and ancester state 
# do for all files
paste -d '\t' ../variants_chrchrVXBX01000547_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.recode.vcf.gz.txt ./ancestral_states_chrVXBX0100MODIF_chrVXBX01000547_output-file-pvalues.txt.txt > ./chrVXBX01000547_ref_ancalleles.txt
cat *_ref_ancalleles.txt > 41chr_ancallele.txt

# change fasta position to ancestral allele base
# the command understand fastas in block 
# there is no need to change the header of the fasta sequence 
# needs to check if there is need to change -1 or +1 the position of the base to change 
# write a script to extract only the bases that have the anc allele as A, as T, as G and as T
# sunset to use this positions in each step
bash basefiles.sh
  #!/bin/bash

  input="41chr_ancallele.txt"
  awk '$3=="A"' "$input" > baseA.txt
  awk '$3=="C"' "$input" > baseC.txt
  awk '$3=="G"' "$input" > baseG.txt
  awk '$3=="T"' "$input" > baseT.txt
  awk '$3=="-nan"' 41chr_ancallele.txt > basenan.txt

# now organize the base file to be a bed format 
awk 'BEGIN{OFS="\t"} {print $1, $2-1, $2}' baseA.txt > position2changeA.bed
awk 'BEGIN{OFS="\t"} {print $1, $2-1, $2}' baseC.txt > position2changeC.bed
awk 'BEGIN{OFS="\t"} {print $1, $2-1, $2}' baseG.txt > position2changeG.bed
awk 'BEGIN{OFS="\t"} {print $1, $2-1, $2}' baseT.txt > position2changeT.bed
awk 'BEGIN{OFS="\t"} {print $1, $2-1, $2}' basenan.txt > position2changenan.bed

# modify fasta to explicity determiny the bases to the ancestral allele
bedtools maskfasta -fi GCA_013400415.1_ASM1340041v1_genomic.fa -bed position2changeA.bed -fo editedA_GCA_013400415.1_ASM1340041v1_genomic.fasta -mc A
bedtools maskfasta -fi editedA_GCA_013400415.1_ASM1340041v1_genomic.fasta -bed position2changeC.bed -fo editedAC_GCA_013400415.1_ASM1340041v1_genomic.fasta -mc C
bedtools maskfasta -fi editedAC_GCA_013400415.1_ASM1340041v1_genomic.fasta -bed position2changeG.bed -fo editedACG_GCA_013400415.1_ASM1340041v1_genomic.fasta -mc G
bedtools maskfasta -fi editedACG_GCA_013400415.1_ASM1340041v1_genomic.fasta -bed position2changeT.bed -fo editedACGT_GCA_013400415.1_ASM1340041v1_genomic.fasta -mc T
bedtools maskfasta -fi editedACGT_GCA_013400415.1_ASM1340041v1_genomic.fasta -bed position2changeT.bed -fo editedACGTnan_GCA_013400415.1_ASM1340041v1_genomic.fasta -mc N





