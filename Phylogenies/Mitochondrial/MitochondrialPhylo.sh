# Workflow to generatethe mitochondrial phylogeny from mito genome 

# 1-> ML tree with RAxML
# GTR+Γ substitution model; 1,000 bootstrap replicatesm, separating partitions by codon
raxmlHPC-PTHREADS-AVX -PHTREADS -T 5 -s ../PaleomixMito/oneline_combinedFastasMito.fasta -m GTRGAMMA -o Ssuperciliaris -n mtDNA -p 3685124
raxmlHPC-PTHREADS-AVX -PHTREADS -T 5 -s ../PaleomixMito/oneline_combinedFastasMito.fasta -m GTRGAMMA -o Ssuperciliaris -n 1000bootsmtDNA -p 3685124 --bootstop-perms=1000

# 2-> Estimate divergence time with BEAST 
# generate Makefile in BEAUTi
# Param: 
# run make file in terminal: 
beast Makefile.xml
