####step 6

mkdir 5kb_fasta

echo "step 6"
echo "Gerar fasta somente com  scaffolds acima de 5kb"
#Gerar fasta somente com  scaffolds acima de 5kb
#grep -f arquivo.50kb.list -A1 arquivo_umalinha.fasta > arquivo_5kb.fasta

grep -f ./4_listkeepabove5kb/output_Sdiamantinensis127_final.5kb.list -A1	./Step1to2/output_Sdiamantinensis127_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sdiamantinensis127_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Snovacapitalis152_lin_final.5kb.list -A1	./Step1to2/output_Snovacapitalis152_lin_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Snovacapitalis152_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Spachecoi154_final.5kb.list -A1	./Step1to2/output_Spachecoi154_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Spachecoi154_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae101_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae101_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae101_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae103_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae103_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae103_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae106_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae106_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae106_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae107_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae107_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae107_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae109_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae109_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae109_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae110_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae110_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae110_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae113_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae113_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae113_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae114_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae114_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae114_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae116_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae116_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae116_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae117_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae117_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae117_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae118_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae118_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae118_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae119_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae119_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae119_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae120_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae120_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae120_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae121_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae121_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae121_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae122_lin6_final.5kb.list -A1	./Step1to2/output_Sspeluncae122_lin6_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae122_lin6_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae123_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae123_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae123_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae12_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae12_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae12_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae139_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae139_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae139_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae13_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae13_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae13_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae140_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae140_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae140_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae14_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae14_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae14_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae15_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae15_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae15_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae16_lin4_final.5kb.list -A1	./Step1to2/output_Sspeluncae16_lin4_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae16_lin4_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae19_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae19_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae19_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae1_lin4_final.5kb.list -A1	./Step1to2/output_Sspeluncae1_lin4_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae1_lin4_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae23_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae23_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae23_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae28_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae28_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae28_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae2_lin4_final.5kb.list -A1	./Step1to2/output_Sspeluncae2_lin4_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae2_lin4_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae30_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae30_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae30_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae32_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae32_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae32_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae33_lin_final.5kb.list -A1	./Step1to2/output_Sspeluncae33_lin_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae33_lin_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae38_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae38_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae38_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae3_lin4_final.5kb.list -A1	./Step1to2/output_Sspeluncae3_lin4_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae3_lin4_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae43_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae43_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae43_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae46_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae46_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae46_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae47_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae47_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae47_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae48_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae48_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae48_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae49_lin1_final.5kb.list -A1	./Step1to2/output_Sspeluncae49_lin1_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae49_lin1_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae4_lin4_final.5kb.list -A1	./Step1to2/output_Sspeluncae4_lin4_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae4_lin4_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae52_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae52_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae52_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae54_lin6_final.5kb.list -A1	./Step1to2/output_Sspeluncae54_lin6_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae54_lin6_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae56_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae56_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae56_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae57_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae57_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae57_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae59_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae59_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae59_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae5_lin4_final.5kb.list -A1	./Step1to2/output_Sspeluncae5_lin4_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae5_lin4_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae64_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae64_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae64_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae68_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae68_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae68_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae69_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae69_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae69_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae6_lin2_final.5kb.list -A1	./Step1to2/output_Sspeluncae6_lin2_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae6_lin2_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae71_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae71_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae71_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae72_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae72_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae72_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae73_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae73_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae73_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae74_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae74_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae74_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae75_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae75_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae75_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae83_lin2_final.5kb.list -A1	./Step1to2/output_Sspeluncae83_lin2_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae83_lin2_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae85_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae85_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae85_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae86_lin5_final.5kb.list -A1	./Step1to2/output_Sspeluncae86_lin5_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae86_lin5_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae87_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae87_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae87_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae8_lin2_final.5kb.list -A1	./Step1to2/output_Sspeluncae8_lin2_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae8_lin2_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae95_lin7_final.5kb.list -A1	./Step1to2/output_Sspeluncae95_lin7_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae95_lin7_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Sspeluncae9_lin3_final.5kb.list -A1	./Step1to2/output_Sspeluncae9_lin3_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Sspeluncae9_lin3_5kb.fasta
grep -f ./4_listkeepabove5kb/output_Ssuperciliaris_final.5kb.list -A1	./Step1to2/output_Ssuperciliaris_final.bam.fa.bam_masked.fa	>	./6_fasta_5kb/Ssuperciliaris_5kb.fasta
