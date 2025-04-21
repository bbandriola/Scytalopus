## Workflow SNPArcher for Scytalopus samples
## https://snparcher.readthedocs.io/en/latest/index.html
## https://github.com/harvardinformatics/snpArcher
## add extra samples after mapping a few ones: https://github.com/harvardinformatics/snpArcher/issues/190

# 1 -> Set up conda env
conda activate snparcher

# 2 -> set up directories
mkdir snparcher
cd snparcher
mkdir project

# 3 -> construct the samples.csv file
# BioSample,LibraryName,Run,fq1,fq2,lat,long
# lat and long are not needed
# can be a number from 1-inf
# example: AUSturtle_1,turtle_1_lib,1,/media/labgenoma5/DATAPART1/sandro_group/Chelonioidea/N5239-Lo_1.fastq.gz,/media/labgenoma5/DATAPART1/sandro_group/Chelonioidea/N5239-Lo_2.fastq.gz,,

# 4 -> set up files
# directories needed in the project directory: config & profiles
# files needed in the project/config/: samples.csv
# files needed in the project/config/: config.yaml
# files needed in the project/profiles/: genoma/config.yaml (at least this one)

# to have this files and dir in the project file copy them from the original snparcher previously set up
# use command cp to copy

# 5 -> download ref genome
wget --recursive --no-host-directories --cut-dirs=6 ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/013/400/415/GCA_013400415.1_ASM1340041v1/ -P ./

# 6 -> run snparcher in the folder project
conda activate snparcher
# dryrun
snakemake -p -s /snpArcher/workflow/Snakefile -d ./ --cores 10 --use-conda --workflow-profile project/profiles/genoma --dryrun
# actual run
snakemake -p -s /snpArcher/workflow/Snakefile -d ./ --cores 10 --use-conda --workflow-profile project/profiles/genoma

# 5 -> Check BAM quality (NÃO RODEI PORQUE FALTOU MEMORIA. FAZER QUANDO TIVER TODOS OS BAMS)
# http://qualimap.conesalab.org/doc_html/analysis.html
for i in *bam; do qualimap bamqc -bam $i -outdir qualimap/ -outfile QCreport_$i.pdf -outformat PDF:HTML -nt 5; done
  # estimate the multibam QC with depth comparation 
  qualimap multi-bamqc --data QCbams.txt -outdir qualimap/ -outfile multibamQCqualimap -outformat PDF


# 6 -> genome coverage and mean depth
for i in *bam; do samtools depth -a $i | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' > coverage_$i.txt; done
