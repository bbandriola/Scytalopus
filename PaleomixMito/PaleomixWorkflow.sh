# workflow to run Paleomix software for mitochondrial genome

# create the Makefile.yalm 
# 1. rodar o dry run para checar se esta tudo okay com o makefile
#conda activate paleomix
paleomix bam dryrun --max-threads 10 --adapterremoval-max-threads 10 --bwa-max-threads 10 --jre-option=-Xmx16g --temp-root ./temp --destination ./ Makefile

# 2. rodar o paleomix
paleomix bam run --max-threads 10 --adapterremoval-max-threads 10 --bwa-max-threads 10 --jre-option=-Xmx16g --temp-root ./temp --destination ./ Makefile

# 3. gerar sequências Consensus
angsd -i infile.bam -doFasta 2 -doCounts 1 -explode 1 -setMinDepth 5 -p 10 -minQ 30 -out output_prefix

# 4. gerar fasta mascarado
RepeatMasker -specie testudines -dir masked_fastas/ *.fa
