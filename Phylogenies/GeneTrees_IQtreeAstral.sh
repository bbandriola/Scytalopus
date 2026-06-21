### Species tree with independent aligment fragments
# 1. run Iqtree
for i in edited*fa; do iqtree -s $i -o Ssuperciliariswin1kb ; done
for i in edited*fa; do iqtree -s $i -o Sspeluncae120 ; done

# 2. separate directorios
for i in *.iqtree; do awk '/Tree in newick format:/ {flag=1;next} /ALISIM COMMAND/ {flag=0} flag && NF' "$i"; done > all_trees_1kb_10ind.newick
for i in *.iqtree; do awk '/Tree in newick format:/ {flag=1;next} /ALISIM COMMAND/ {flag=0} flag && NF' "$i"; done > all_trees1kb_allind.newick

# 3. Species tree with Astral
# 10 ind
java -jar ~/Softwares/astral/ASTRAL/astral.5.7.8.jar -i all_trees_1kb_10ind.newick --output 1kb_int25kb.10ind.tree --branch-annotate 3 --outgroup Sspeluncae120
# all species
java -jar ~/Softwares/astral/ASTRAL/astral.5.7.8.jar -i all_trees1kb_allind.newick --output ../1kb_int100kb.allspecies.tree --outgroup Ssuperciliariswin1kb
  # branch support calculation
  astral -q 1kb_int100kb.allspecies.tree -i all_trees1kb_allind.newick -t 2 -o astral_species_annotated.tree 2> astral_species_annotated.log


### Species tree estimated with SNPs only
# 1. vcf to phy 
#python vcf2phylip/vcf2phylip.py -i FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.vcf.gz

# 2. IQ-TREE
#iqtree -s ../vcffiles/FinalVCFs/FilteredPCA_FilteredMax30missingDepthmin5_GeographicNames_allsamples.min4.phy -o Ssuperciliaris -T 5 -b 100 --prefix allsamples_FilteredPCA_FilteredMax30missingDepthmin5_100

#iqtree3 -s FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15.min4.phy -m MFP --prefix FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15 # model finder with a reduced dataset of indidivuals 
