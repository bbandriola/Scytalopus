for i in /media/labgenoma4/DATAPART6/bandriola/Scytalopus/Raxml_windows/5kb/raxml_BestTree/RAxML_bestTree.edited*.fa; do
    echo "$i" >> result_all_treefiles_50kbint100kb.txt
    cat $i >> ./result_all_treefiles_50kbint100kb.txt
done
