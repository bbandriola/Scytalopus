# Combining Multiple Individuals into One Input File
# script generate_multihetsep.py from MSMC-tools
git clone https://github.com/stschiff/msmc-tools.git

# generate msmc2 input from mask files and VCFs
# generate a loop to every 
msmc-tools.git/generate_multihetsep.py --mask maskfile.bed.gz --mask vcf.gz > ind_multihetsep.txt
