#!/bin/bash
echo "step 7"
#bedtools getfasta -fi CONSENSO.FASTA -bed ARQUIVO.bed -fo JANELAS.FASTA

bedtools getfasta -fi	./6_fasta_5kb/Sdiamantinensis127_5kb.fasta	-bed	./5_bed_5kb/Sdiamantinensis127.bed	-fo	./7_windows5kb_int100kb/Sdiamantinensis127win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Snovacapitalis152_5kb.fasta	-bed	./5_bed_5kb/Snovacapitalis152.bed	-fo	./7_windows5kb_int100kb/Snovacapitalis152win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Spachecoi154_5kb.fasta	-bed	./5_bed_5kb/Spachecoi154.bed	-fo	./7_windows5kb_int100kb/Spachecoi154win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae101_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae101_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae101_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae103_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae103_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae103_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae106_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae106_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae106_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae107_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae107_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae107_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae109_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae109_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae109_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae110_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae110_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae110_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae113_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae113_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae113_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae114_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae114_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae114_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae116_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae116_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae116_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae117_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae117_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae117_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae118_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae118_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae118_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae119_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae119_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae119_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae120_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae120_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae120_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae121_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae121_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae121_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae122_lin6_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae122_lin6.bed	-fo	./7_windows5kb_int100kb/Sspeluncae122_lin6win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae123_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae123_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae123_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae139_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae139_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae139_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae13_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae13_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae13_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae140_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae140_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae140_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae14_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae14_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae14_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae15_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae15_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae15_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae16_lin4_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae16_lin4.bed	-fo	./7_windows5kb_int100kb/Sspeluncae16_lin4win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae19_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae19_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae19_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae23_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae23_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae23_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae28_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae28_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae28_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae2_lin4_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae2_lin4.bed	-fo	./7_windows5kb_int100kb/Sspeluncae2_lin4win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae30_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae30_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae30_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae32_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae32_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae32_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae33_lin_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae33_lin.bed	-fo	./7_windows5kb_int100kb/Sspeluncae33_linwin5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae38_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae38_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae38_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae43_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae43_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae43_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae46_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae46_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae46_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae47_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae47_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae47_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae48_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae48_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae48_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae49_lin1_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae49_lin1.bed	-fo	./7_windows5kb_int100kb/Sspeluncae49_lin1win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae4_lin4_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae4_lin4.bed	-fo	./7_windows5kb_int100kb/Sspeluncae4_lin4win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae52_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae52_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae52_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae54_lin6_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae54_lin6.bed	-fo	./7_windows5kb_int100kb/Sspeluncae54_lin6win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae56_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae56_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae56_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae59_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae59_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae59_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae5_lin4_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae5_lin4.bed	-fo	./7_windows5kb_int100kb/Sspeluncae5_lin4win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae64_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae64_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae64_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae68_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae68_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae68_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae69_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae69_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae69_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae71_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae71_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae71_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae72_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae72_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae72_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae73_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae73_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae73_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae74_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae74_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae74_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae75_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae75_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae75_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae83_lin2_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae83_lin2.bed	-fo	./7_windows5kb_int100kb/Sspeluncae83_lin2win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae85_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae85_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae85_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae86_lin5_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae86_lin5.bed	-fo	./7_windows5kb_int100kb/Sspeluncae86_lin5win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae87_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae87_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae87_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae95_lin7_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae95_lin7.bed	-fo	./7_windows5kb_int100kb/Sspeluncae95_lin7win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Sspeluncae9_lin3_5kb.fasta	-bed	./5_bed_5kb/Sspeluncae9_lin3.bed	-fo	./7_windows5kb_int100kb/Sspeluncae9_lin3win5kb_int100kb.fasta
bedtools getfasta -fi	./6_fasta_5kb/Ssuperciliaris_5kb.fasta	-bed	./5_bed_5kb/Ssuperciliaris.bed	-fo	./7_windows5kb_int100kb/Ssuperciliariswin5kb_int100kb.fasta

echo "numero de janelas"
grep '>' ./7_windows5kb_int100kb/Sspeluncae9_lin3win5kb_int100kb.fasta | wc -l
