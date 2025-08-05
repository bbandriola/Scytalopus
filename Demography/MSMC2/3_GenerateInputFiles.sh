#!/usr/bin/env bash
# uma arquivo por população 

# Combining Multiple Individuals into One Input File
# script generate_multihetsep.py from MSMC-tools
git clone https://github.com/stschiff/msmc-tools.git


INDIR=/path/to/VCF/and/mask/files
OUTDIR=/path/to/output_files
MAPDIR=/path/to/mappability/mask
generate_multihetsep.py --chr 1 \
--mask $INDIR/ind1.chr1.mask.bed.gz \ 
--mask $INDIR/ind2.chr1.mask.bed.gz \ 
--mask $INDIR/ind3.chr1.mask.bed.gz \
--mask $INDIR/ind4.chr1.mask.bed.gz \
--mask $MAPDIR/hs37d5_chr1.mask.bed \
$INDIR/ind1.chr1.vcf.gz $INDIR/ind2.chr1.vcf.gz $INDIR/ind3.chr1.vcf.gz \
$INDIR/ind4.chr1.vcf.gz \
> $OUTDIR/pop1.chr1.multihetsep.txt
