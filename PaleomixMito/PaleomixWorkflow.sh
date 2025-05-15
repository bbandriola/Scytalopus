# workflow to run Paleomix software for mitochondrial genome

# create the Makefile.yalm 
# 1 -> rodar o dry run para checar se esta tudo okay com o makefile
#conda activate paleomix
paleomix bam dryrun --max-threads 10 --adapterremoval-max-threads 10 --bwa-max-threads 10 --jre-option=-Xmx16g --temp-root ./temp --destination ./ Makefile

# 2 -> run paleomix
paleomix bam run --max-threads 10 --adapterremoval-max-threads 10 --bwa-max-threads 10 --jre-option=-Xmx16g --temp-root ./temp --destination ./ Makefile

# 3 -> consensus sequence
for i in *bam; do angsd -i $i -doFasta 2 -doCounts 1 -explode 1 -setMinDepth 5 -p 10 -minQ 30 -out $i; done
