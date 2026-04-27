# 1. generate est-sfs 
# python 3
for i in groupfile_*.txt; python Generate_input_est-sfs.py *.vcf.gz > $i.allele ; done 
# INGROUP: sample1 sample2 sample3
# OUTGROUP1: sample11
# OUTGROUP2: sample12 sample13
  # remove header 
  # run the command bellow to change the two from outgroup alleles to one 
  awk -F'\t' 'BEGIN{OFS="\t"} {gsub(/2/,"1",$2); gsub(/2/,"1",$3); print}' file.allele > file.allele.txt

# 2. run est-sfs to obtain the anc allele 
est-sfs config_file.txt groupfile_Lin4.txt.allele.txt seedfile.txt Lin4_sfs Lin4_p_anc

# 3. generate uSFS 
# ./easySFS.py -i input.vcf -p pops_file.txt --proj 12,20
# https://www.popgen.dk/angsd/index.php/SFS_Estimation -doSAF
# realSFS 




