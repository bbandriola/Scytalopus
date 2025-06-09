#!/usr/bin/env python

####Description: Concatenate each genome to generate alignment windows using a *.list file
####List file: The absolute path for the five genomes in order, P1 - first genome, P2 - second genome...
####Use: createDfoil_fasta_final.py DATASETXXX.list
####Written by: Henrique V Figueiro - henriquevf@gmail.com

from Bio import SeqIO
import sys
import os

print ('Use: python createWindow_aln.py LIST_FILE')
print ('List file must contain the full path for all fasta files')
print ('The order of the list will be the order of the alignment')

#Open dataset.list file

dataset = open(sys.argv[1], 'r')
lines=dataset.readlines()

dataset_name = sys.argv[1].split('.')[0] #used to name the folders and files for the aln (Example: dataset05; panthera05)

#Create dataset and windows folders

if not os.path.exists(os.getcwd()+'/'+dataset_name):
	os.makedirs(os.getcwd()+'/'+dataset_name)

if not os.path.exists(os.getcwd()+'/'+dataset_name+'/windows'):
	os.makedirs(os.getcwd()+'/'+dataset_name+'/windows')

chr_dir = os.getcwd()+'/'+dataset_name+'/windows/'

#Read genome filenames and get spp names (Name should the first part of file name,
#otherwise this part should be modified)
#Example /media/labgenoma2/dfoil/PTI_windows.fasta; it will get 'PTI' portion as spp name

P1 = str(lines[0].rstrip())
P1_name = str(P1.split('/')[-1].split('_')[0])

P2 = str(lines[1].rstrip())
P2_name = str(P2.split('/')[-1].split('_')[0])

P3 = str(lines[2].rstrip())
P3_name = str(P3.split('/')[-1].split('_')[0])

P4 = str(lines[3].rstrip())
P4_name = str(P4.split('/')[-1].split('_')[0])

P5 = str(lines[4].rstrip())
P5_name = str(P5.split('/')[-1].split('_')[0])

P6 = str(lines[5].rstrip())
P6_name = str(P6.split('/')[-1].split('_')[0])

P7 = str(lines[6].rstrip())
P7_name = str(P7.split('/')[-1].split('_')[0])

P8 = str(lines[7].rstrip())
P8_name = str(P8.split('/')[-1].split('_')[0])

P9 = str(lines[8].rstrip())
P9_name = str(P9.split('/')[-1].split('_')[0])

P10 = str(lines[9].rstrip())
P10_name = str(P10.split('/')[-1].split('_')[0])

P11 = str(lines[10].rstrip())
P11_name = str(P11.split('/')[-1].split('_')[0])

P12 = str(lines[11].rstrip())
P12_name = str(P12.split('/')[-1].split('_')[0])

P13 = str(lines[12].rstrip())
P13_name = str(P13.split('/')[-1].split('_')[0])

P14 = str(lines[13].rstrip())
P14_name = str(P14.split('/')[-1].split('_')[0])

P15 = str(lines[14].rstrip())
P15_name = str(P15.split('/')[-1].split('_')[0])

P16 = str(lines[15].rstrip())
P16_name = str(P16.split('/')[-1].split('_')[0])

P17 = str(lines[16].rstrip())
P17_name = str(P17.split('/')[-1].split('_')[0])

P18 = str(lines[17].rstrip())
P18_name = str(P18.split('/')[-1].split('_')[0])

P19 = str(lines[18].rstrip())
P19_name = str(P19.split('/')[-1].split('_')[0])

P20 = str(lines[19].rstrip())
P20_name = str(P20.split('/')[-1].split('_')[0])

P21 = str(lines[20].rstrip())
P21_name = str(P21.split('/')[-1].split('_')[0])

P22 = str(lines[21].rstrip())
P22_name = str(P22.split('/')[-1].split('_')[0])

P23 = str(lines[22].rstrip())
P23_name = str(P23.split('/')[-1].split('_')[0])

P24 = str(lines[23].rstrip())
P24_name = str(P24.split('/')[-1].split('_')[0])

P25 = str(lines[24].rstrip())
P25_name = str(P25.split('/')[-1].split('_')[0])

P26 = str(lines[25].rstrip())
P26_name = str(P26.split('/')[-1].split('_')[0])

P27 = str(lines[26].rstrip())
P27_name = str(P27.split('/')[-1].split('_')[0])

P28 = str(lines[27].rstrip())
P28_name = str(P28.split('/')[-1].split('_')[0])

P29 = str(lines[28].rstrip())
P29_name = str(P29.split('/')[-1].split('_')[0])

P30 = str(lines[29].rstrip())
P30_name = str(P30.split('/')[-1].split('_')[0])

P31 = str(lines[30].rstrip())
P31_name = str(P31.split('/')[-1].split('_')[0])

P32 = str(lines[31].rstrip())
P32_name = str(P32.split('/')[-1].split('_')[0])

P33 = str(lines[32].rstrip())
P33_name = str(P33.split('/')[-1].split('_')[0])

P34 = str(lines[33].rstrip())
P34_name = str(P34.split('/')[-1].split('_')[0])

P35 = str(lines[34].rstrip())
P35_name = str(P35.split('/')[-1].split('_')[0])

P36 = str(lines[35].rstrip())
P36_name = str(P36.split('/')[-1].split('_')[0])

P37 = str(lines[36].rstrip())
P37_name = str(P37.split('/')[-1].split('_')[0])

P38 = str(lines[37].rstrip())
P38_name = str(P38.split('/')[-1].split('_')[0])

P39 = str(lines[38].rstrip())
P39_name = str(P39.split('/')[-1].split('_')[0])

P40 = str(lines[39].rstrip())
P40_name = str(P40.split('/')[-1].split('_')[0])

P41 = str(lines[40].rstrip())
P41_name = str(P41.split('/')[-1].split('_')[0])

P42 = str(lines[41].rstrip())
P42_name = str(P42.split('/')[-1].split('_')[0])

P43 = str(lines[42].rstrip())
P43_name = str(P43.split('/')[-1].split('_')[0])

P44 = str(lines[43].rstrip())
P44_name = str(P44.split('/')[-1].split('_')[0])

P45 = str(lines[44].rstrip())
P45_name = str(P45.split('/')[-1].split('_')[0])

P46 = str(lines[45].rstrip())
P46_name = str(P46.split('/')[-1].split('_')[0])

P47 = str(lines[46].rstrip())
P47_name = str(P47.split('/')[-1].split('_')[0])

P48 = str(lines[47].rstrip())
P48_name = str(P48.split('/')[-1].split('_')[0])

P49 = str(lines[48].rstrip())
P49_name = str(P49.split('/')[-1].split('_')[0])

P50 = str(lines[49].rstrip())
P50_name = str(P50.split('/')[-1].split('_')[0])

P51 = str(lines[50].rstrip())
P51_name = str(P51.split('/')[-1].split('_')[0])

P52 = str(lines[51].rstrip())
P52_name = str(P52.split('/')[-1].split('_')[0])

P53 = str(lines[52].rstrip())
P53_name = str(P53.split('/')[-1].split('_')[0])

P54 = str(lines[53].rstrip())
P54_name = str(P54.split('/')[-1].split('_')[0])

P55 = str(lines[54].rstrip())
P55_name = str(P55.split('/')[-1].split('_')[0])

P56 = str(lines[55].rstrip())
P56_name = str(P56.split('/')[-1].split('_')[0])

P57 = str(lines[56].rstrip())
P57_name = str(P57.split('/')[-1].split('_')[0])

P58 = str(lines[57].rstrip())
P58_name = str(P58.split('/')[-1].split('_')[0])

P59 = str(lines[58].rstrip())
P59_name = str(P59.split('/')[-1].split('_')[0])

#Create each window fasta file and append the subsequent genomes

with open(P1, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'w') as out_file:
            seq_name = str('>'+ P1_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()


with open(P2, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P2_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()


with open(P3, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P3_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P4, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P4_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()


with open(P5, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P5_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P6, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P6_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P7, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P7_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P8, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P8_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P9, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P9_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P10, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P10_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P11, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P11_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P12, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P12_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P13, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P13_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P14, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P14_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P15, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P15_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P16, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P16_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P17, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P17_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P18, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P18_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P19, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P19_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P20, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P20_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P21, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P21_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P22, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P22_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P23, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P23_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P24, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P24_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P25, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P25_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P26, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P26_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P27, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P27_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P28, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P28_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P29, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P29_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P30, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P30_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P31, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P31_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P32, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P32_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P33, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P33_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P34, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P34_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P35, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P35_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P36, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P36_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P37, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P37_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P38, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P38_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P39, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P39_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()
		
with open(P40, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P40_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P41, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P41_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P42, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P42_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P43, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P43_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P44, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P44_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P45, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P45_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P46, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P46_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P47, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P47_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P48, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P48_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P49, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P49_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P50, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P50_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P51, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P51_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P52, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P52_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P53, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P53_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P54, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P54_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P55, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P55_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P56, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P56_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P57, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P57_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P58, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P58_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

with open(P59, 'r') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        with open(chr_dir + record.id + ".fa", 'a') as out_file:
            seq_name = str('>'+P59_name)
            seq =  str(record.seq)
            out_file.write(seq_name + '\n' + seq + '\n')
        out_file.close()

	
#Generate dfoil commands for the dataset

#This part is in beta, comment this section if you don't need it,
#or change it to suit your needs

#This section will create a bash script to run the dfoil pipeline with the information
#from the alignment file

#The other scripts used here are available by request

#Change the path where dfoil is installed on your machine (lines 111, 115, 117)

#with open(os.getcwd()+'/'+dataset_name+'/'+dataset_name+".sh", "a") as bash_file:
#	bash_file.write('#fasta2dfoil command:'+'\n')
#	bash_file.write('for i in windows/*.fa; do python ~/programs/dfoil-master/fasta2dfoil.py $i --out $i.count --names '+P1_name+','+P2_name+','+P3_name+','+P4_name+','+P5_name+'; done'+'\n')
#	bash_file.write('#concatenate count files:'+'\n')
#	bash_file.write('cat windows/*.count > '+dataset_name+'.count'+'\n')
#	bash_file.write('#dfoil command:'+'\n')
#	bash_file.write('python ~/programs/dfoil-master/dfoil.py --infile '+dataset_name+'.count --out '+dataset_name+'.stats'+'\n')
#	bash_file.write('#dfoil_analyze command:'+'\n')
#	bash_file.write('python ~/programs/dfoil-master/dfoil_analyze.py '+dataset_name+'.stats > '+dataset_name+'_results.txt'+'\n')
#	bash_file.write('#created plot input files:'+'\n')
#	bash_file.write('bash getIntrogressed_regions.py '+dataset_name+'\n')

