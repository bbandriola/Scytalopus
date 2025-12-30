# 5kb 
# 1. run RAxML
for i in edited*.fa; do raxmlHPC-PTHREADS -T 10 -s $i -w /media/labgenoma5/DATAPART3/bandriola/Scytalopus/Raxml_windows/1kb/ -m GTRGAMMA --HKY83 -o Ssuperciliariswin1kb -n $i -p 2352890; done
for i in edited*._nosuperciliares.fasta; do raxmlHPC-PTHREADS -T 10 -s $i -w /media/labgenoma5/DATAPART3/bandriola/Scytalopus/Raxml_windows/1kb/nosuperciliaris/ -m GTRGAMMA -o Spetrophilus,Sdiamantinensis127win1kb,Snovacapitalis152win1kb,Spachecoi154win1kb -n $i -p 2352890; done
# 2. separate directorios
cd /media/labgenoma4/DATAPART6/bandriola/Scytalopus/Raxml_windows/5kb_run2/
mkdir raxml_BestTree
mv RAxML_bestTree*fasta ./raxml_BestTree/
mkdir raxml_Info
mv RAxML_info*fasta ./raxml_Info/
mkdir raxml_Log
mv RAxML_log*fasta ./raxml_Log/
mkdir raxml_Parsimony
mv RAxML_parsimony*fasta ./raxml_Parsimony/
mkdir raxml_Result
mv RAxML_result*fasta ./raxml_Result/

cd raxml_BestTree
for i in RAxML*.fa; do cat $i >> allbestTrees_5kbint100kb_run2.fa; done

# 3. Species tree with Astral
java -jar ../../../../Softwares/astral/ASTRAL/astral.5.7.8.jar -i allbestTrees_5kb.fa --output 5kb_int100kb.allspecies.tree --branch-annotate 2 --outgroup Ssuperciliariswin5kb

# 4. trees frequency
nw_topology -I allTrees_raxml*.fa | nw_order - | sort | uniq -c | sort -k1 -n > 5kb_run2_frequency.csv
