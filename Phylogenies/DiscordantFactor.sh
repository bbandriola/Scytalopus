# annotate astrall tree
astral -q astral_species.tree -i loci.treefile -t 2 -o astral_species_annotated.tree 2> astral_species_annotated.log

# Concordant Factor 
# first calculate the site concordance vectors
iqtree3 -t ../run1/starttree_concordantfactor.newick -p /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/bams/Fastas/masked_fastas/8_2_LIST_FILE_1kb_10ind/windows/Final_Aligment2Use/ --scfl 100 --prefix ./scfl -T 2

# next calculate the gene concordance vectors
iqtree3 -te scfl.cf.tree --gcf ../run1/all_trees_1kb_10ind.newick --prefix ./gcf -T 2

# finally we do a dummy analysis in IQ-TREE. The only point of this is to get the branch lengths in coalescent units 
iqtree3 -te ../run1/1kb_int25kb.10ind_annotated.tree -blfix -p /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/bams/Fastas/masked_fastas/8_2_LIST_FILE_1kb_10ind/windows/Final_Aligment2Use/ --scfl 1 --prefix ./coalescent_bl -T 2
