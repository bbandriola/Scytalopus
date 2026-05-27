# all populations together to estimate the ancester allele 
for i in chrVXBX0100*vcf.gz; do python SFS/Generate_input_est-sfs.py $i SFS/groupfile_ANCAllele_Lin4Lin3LinDEV.txt > inputest-sfs_$i.allele; done

# edited generated file
for i in inputest-sfs_*.allele; do tail -n +2 $i | awk -F'\t' 'BEGIN{OFS="\t"} {gsub(/2/,"1",$2); gsub(/2/,"1",$3); print}' > $i.txt; done

# run est-sfsls 
echo "running first chr..."
est-sfs config_file.txt groupfile_Lin3_chrVXBX01009921.allele.txt seedfile.txt Lin3_chrVXBX01009921_output-file-sfs.txt Lin3_chrVXBX01009921_output-file-pvalues.txt
echo "you made it! next"
est-sfs config_file.txt groupfile_Lin3_chrVXBX01004249.allele.txt seedfile.txt Lin3_chrVXBX01009921_output-file-sfs.txt Lin3_chrVXBX01009921_output-file-pvalues.txt
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





