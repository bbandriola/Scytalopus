# This workflow will generate masked genomic windows of 5, 10, 20, 50kb with 100kb interval between windows

# 1. Mask fastas with birds repository from RepeatMasker
# https://stab.st-andrews.ac.uk/wiki/index.php/Repeatmasker | https://www.repeatmasker.org/RepeatMasker/
nano RepeatMaskerLin_1.sh
for i in *_lin1_final.bam.fa; RepeatMasker -species chicken -dir ./c/ -gff $i; done 
nano RepeatMaskerLin_2_Lin3.sh
for i in *_lin2_final.bam.fa; RepeatMasker -species chicken -dir ./masked_fastas/ -gff $i; done 
for i in *_lin3_final.bam.fa; RepeatMasker -species chicken -dir ./masked_fastas/ -gff $i; done
nano RepeatMaskerLin_4_Lin5.sh
for i in *_lin4_final.bam.fa; RepeatMasker -species chicken -dir ./masked_fastas/ -gff $i; done 
for i in *_lin5_final.bam.fa; RepeatMasker -species chicken -dir ./masked_fastas/ -gff $i; done
nano RepeatMaskerLin_6_Lin7.sh
for i in *_lin6_final.bam.fa; RepeatMasker -species chicken -dir ./masked_fastas/ -gff $i; done 
for i in *_lin7_final.bam.fa; RepeatMasker -species chicken -dir ./masked_fastas/ -gff $i; done 
nano RepeatMaskerOutgroups.sh
RepeatMasker -species chicken -dir ./masked_fastas/ -gff EleoindigoticusUCE_final.bam.fa    
RepeatMasker -species chicken -dir ./masked_fastas/ -gff EleopsychopompusUCE1_final.bam.fa  
RepeatMasker -species chicken -dir ./masked_fastas/ -gff Sdiamantinensis127_final.bam.fa    
RepeatMasker -species chicken -dir ./masked_fastas/ -gff SiraiensisUCE_final.bam.fa         
RepeatMasker -species chicken -dir ./masked_fastas/ -gff Snovacapitalis152_lin_final.bam.fa 
RepeatMasker -species chicken -dir ./masked_fastas/ -gff Spachecoi154_final.bam.fa
