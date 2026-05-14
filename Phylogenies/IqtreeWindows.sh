# 5kb 
# 1. run Iqtree
for i in edited*fa; do iqtree -s $i -o Ssuperciliariswin1kb ; done
for i in edited*fa; do iqtree -s $i -o Sspeluncae120 ; done

# 2. separate directorios
for i in *.iqtree; do awk '/Tree in newick format:/ {flag=1;next} /ALISIM COMMAND/ {flag=0} flag && NF' "$i"; done > all_trees_1kb_10ind.newick

# 3. Species tree with Astral
java -jar ../../../../Softwares/astral/ASTRAL/astral.5.7.8.jar -i allbestTrees_5kb.fa --output 5kb_int100kb.allspecies.tree --branch-annotate 2 --outgroup Ssuperciliariswin5kb
java -jar ~/Softwares/astral/ASTRAL/astral.5.7.8.jar -i all_trees_1kb_10ind.newick --output 1kb_int25kb.10ind.tree --branch-annotate 3 --outgroup Sspeluncae120

# 4. Concordant Factor
iqtree3 -t starttree_concordantfactor.newick --gcf all_trees_1kb_10ind.newick -s ../../snparcher/bams/Fastas/masked_fastas/8_2_LIST_FILE_1kb_10ind/windows/edited.GVXBX010*.fa --scf 100 --prefix concordantFactor.10ind -T 5 --seed 123456

# 4. trees frequency
nw_topology -I allTrees_raxml*.fa | nw_order - | sort | uniq -c | sort -k1 -n > 5kb_run2_frequency.csv
