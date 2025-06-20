# 5kb 
# 1. run RAxML
for i in edited*.fa; do raxmlHPC-PTHREADS -T 10 -s $i -w /media/labgenoma4/DATAPART6/bandriola/Scytalopus/Raxml_windows/5kb_run2/ -m GTRGAMMA -o Ssuperciliariswin5kb -n $i -p 2352890; done

# 2. separate directorios
cd /media/labgenoma4/DATAPART6/bandriola/Scytalopus/Raxml_windows/5kb_run2/
mkdir raxml_BestTree
mv RAxML_bestTree*fa ./raxml_BestTree/
mkdir raxml_Info
mv RAxML_info*fa ./raxml_Info/
mkdir raxml_Log
mv RAxML_log*fa ./raxml_Log/
mkdir raxml_Parsimony
mv RAxML_parsimony*fa ./raxml_Parsimony/
mkdir raxml_Result
mv RAxML_result*fa ./raxml_Result/

cd raxml_BestTree
for i in RAxML*.fa; do cat $i >> allbestTrees_5kbint100kb_run2.fa; done

# 3. Species tree with Astral
java -jar ../../../../Softwares/astral/ASTRAL/astral.5.7.8.jar -i allbestTrees_5kb.fa --output 5kb_int100kb.allspecies.tree --branch-annotate 2 --outgroup Ssuperciliariswin5kb

# 4. trees frequency
nw_topology -I allTrees_raxml*.fa | nw_order - | sort | uniq -c | sort -k1 -n > 5kb_run2_frequency.csv
