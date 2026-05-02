python Generate_input_est-sfs.py chrVXBX01004249_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.vcf.recode.vcf.gz groupfile_Lin3.txt > groupfile_Lin3_chrVXBX01009921.allele 

awk -F'\t' 'BEGIN{OFS="\t"} {gsub(/2/,"1",$2); gsub(/2/,"1",$3); print}' groupfile_Lin3_chrVXBX01009921.allele > groupfile_Lin3_chrVXBX01009921.allele.txt 

python Generate_input_est-sfs.py chrVXBX01004249_FilteredMinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_allsamples.vcf.recode.vcf.gz groupfile_Lin3.txt > groupfile_Lin3_chrVXBX01004249.allele 

awk -F'\t' 'BEGIN{OFS="\t"} {gsub(/2/,"1",$2); gsub(/2/,"1",$3); print}' groupfile_Lin3_chrVXBX01004249.allele > groupfile_Lin3_chrVXBX01004249.allele.txt


echo "running first chr..."
est-sfs config_file.txt groupfile_Lin3_chrVXBX01009921.allele.txt seedfile.txt Lin3_chrVXBX01009921_output-file-sfs.txt Lin3_chrVXBX01009921_output-file-pvalues.txt
echo "you made it! next"
est-sfs config_file.txt groupfile_Lin3_chrVXBX01004249.allele.txt seedfile.txt Lin3_chrVXBX01009921_output-file-sfs.txt Lin3_chrVXBX01009921_output-file-pvalues.txt
echo "done! celebrate and do it all again"
