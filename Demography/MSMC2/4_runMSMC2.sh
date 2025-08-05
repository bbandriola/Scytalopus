# run msmc
msmc2 --nrThreads 10 -p "2+2+30*2+4+6+10" -o outputprefix $OUTDIR/pop1.chr*.multihetsep.txt

# 20 bootstrap
msmc-tools/multihetsep_bootstrap.py -n 20 --nr_chromosomes 2 --seed 8 /bootstrap/pop1_bs $OUTDIR/pop1.chr*.multihetsep.txt
$ for i in {1..20}; do 
msmc2 --nrThreads 5 -o /bootstrap/pop1_bs$i /bootstrap/pop1_bs_$i/bootstrap*.txt; done

# plot graphic 
#wget 
