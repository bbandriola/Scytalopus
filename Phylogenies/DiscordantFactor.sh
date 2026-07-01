# annotate astrall tree
astral -q astral_species.tree -i loci.treefile -t 2 -o astral_species_annotated.tree 2> astral_species_annotated.log

# Concordant Factor 
# first calculate the site concordance vectors
# inside /media/labgenoma5/DATAPART3/bandriola/Scytalopus/snparcher/bams/Fastas/masked_fastas/8_1kb_int100kb/windows/finalfragments/fragmentsonly/completed/*fa
iqtree3 -te /media/labgenoma5/DATAPART3/bandriola/Scytalopus/IQtree_windows/AllInd/annotated.tree -p ./ --scfl 100 --prefix /media/labgenoma5/DATAPART3/bandriola/Scytalopus/IQtree_windows/AllInd/ConcordantVectors/scfl -T 5
# next calculate the gene concordance vectors
iqtree3 -te scfl.cf.tree --gcf ../all_trees1kb_allind.newick --prefix ./gcf -T 5
# finally we do a dummy analysis in IQ-TREE. The only point of this is to get the branch lengths in coalescent units 
iqtree3 -te /media/labgenoma5/DATAPART3/bandriola/Scytalopus/IQtree_windows/AllInd/annotated.tree -blfix -p ./ --scfl 1 --prefix /media/labgenoma5/DATAPART3/bandriola/Scytalopus/IQtree_windows/AllInd/ConcordantVectors/coalescent_bl -T 5
