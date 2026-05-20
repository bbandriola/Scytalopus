for i in chrVXBX0100*vcf.gz; do python SFS/Generate_input_est-sfs.py $i SFS/groupfile_Dev_3SP_1PR.txt > groupfileDev_$i.allele; done
for i in chrVXBX0100*vcf.gz; do python SFS/Generate_input_est-sfs.py $i SFS/groupfile_Lin3_4ind.txt > groupfileLin3_4ind_$i.allele; done

for i in groupfile*allele; do tail -n +2 $i | awk -F'\t' 'BEGIN{OFS="\t"} {gsub(/2/,"1",$2); gsub(/2/,"1",$3); print}' > $i.txt; done


echo "running first chr..."
est-sfs config_file.txt groupfile_Lin3_chrVXBX01009921.allele.txt seedfile.txt Lin3_chrVXBX01009921_output-file-sfs.txt Lin3_chrVXBX01009921_output-file-pvalues.txt
echo "you made it! next"
est-sfs config_file.txt groupfile_Lin3_chrVXBX01004249.allele.txt seedfile.txt Lin3_chrVXBX01009921_output-file-sfs.txt Lin3_chrVXBX01009921_output-file-pvalues.txt
echo "done! celebrate and do it all again"
