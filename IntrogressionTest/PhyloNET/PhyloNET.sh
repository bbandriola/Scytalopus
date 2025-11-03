#

# 1. generate file with all newick from 1kb genomic windows
for i in RAxML_bestTree*.fa; do cat $i >> allbestTrees*.csv; done
sed 's//;/g' allbestTrees*.txt > allbestTrees_*.txt # add ; at the end of each topology

# 2. nexus file 

