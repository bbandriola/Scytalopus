#!/bin/bash
# 1. file generation for every ind of the populations
# will generate VCF for every scaffold for every ind and a mask file

BAM_LIST="bam_list.txt"
COV_LIST="coverage.txt"
REF="ref.fa"
NUM_SCAFFOLDS=10  # Change this to the actual number of scaffolds

mapfile -t BAMS < "$BAM_LIST"
mapfile -t COVS < "$COV_LIST"

for i in "${!BAMS[@]}"; do
    BAM="${BAMS[$i]}"
    COV="${COVS[$i]}"
    SAMPLE=$(basename "$BAM" .bam)

    for SCAFFOLD in $(seq 1 $NUM_SCAFFOLDS); do
        samtools mpileup -B -q 20 -Q 20 -C 50 -g -r "$SCAFFOLD" -f "$REF" "$BAM" | \
        bcftools call -c -V indels | \
        ./bamCaller.py "$COV" "${SAMPLE}_scaffold${SCAFFOLD}_mask.bed.gz" | \
        gzip -c > "${SAMPLE}_scaffold${SCAFFOLD}_outMSMC2.vcf.gz"
    done
done

# where you need to give the average sequencing depth as <mean_cov>
