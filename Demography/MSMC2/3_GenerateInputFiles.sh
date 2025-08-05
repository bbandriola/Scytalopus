# Combining Multiple Individuals into One Input File
# script generate_multihetsep.py from MSMC-tools
git clone https://github.com/stschiff/msmc-tools.git

# generate msmc2 input from mask files and VCFs
# generate a loop to every 
for maskfile in *_maskfile.bed.gz; do
    # Extract the sampleid and scaffold number from the filename
    base=$(basename "$maskfile"_maskfile.bed.gz)

    # Construct the names of the other required files
    vcfmask="${base}_outMSMC2vcf.gz"
    output="${base}_multihetsep.txt"

    # Run the command
    msmc-tools.git/generate_multihetsep.py \
        --mask "$maskfile" \
        --mask "$vcfmask" \
        > "$output"
done
