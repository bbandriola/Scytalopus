#!usr/bin/env python

'''
Custom filtering of VCF files
based on jarobinson vacquita_filterVCF.py
modified to only filter based on depth of coverage from Schweizer RM, Grummer JA, Tobin KB, Corpuz R, Geib SM, Cox-Foster D, Kimsey LS, Koch JBU, Branstetter MG, "Museum genomics suggests long-term population decline in a putatively extinct bumble bee"
This script was copied from their repository https://github.com/renaschweizer/Bombus_franklini_pop_gen/blob/main/scripts/processing_genotyping/filterVCF_Robinson_et_al.py

Input: raw VCF
Output: filtered VCF prints to screen
- Sites failing filters are marked as FAIL_? or WARN_? in the 7th column
- Sites where REF is in [A,C,G,T] and ALT is in [A,C,G,T,.] go on to genotype filtering if AD and DP present in FORMAT
- Filtered out genotypes are changed to './.', all others reported
- Sites with non-reference alleles remaining after genotype filtering also filtered based on values in INFO column

Possible usage:

SCRIPT=filterVCF.py
python ${SCRIPT} myfile.vcf.gz | bgzip > myfile_filtered.vcf.gz
tabix -p vcf myfile_filtered.vcf.gz

'''

import sys
import gzip
import re

vcf_file = sys.argv[1]
VCF = gzip.open(vcf_file, 'rt')


# Min depth (1/3x mean)
minD={'Sdiamantinensis':8,
'SerradaLontras5_lin1':5,
'BoaEsperanca2_lin6':10,
'BoaEsperanca3_lin7':12,
'Snovacapitalis':11,
'Spachecoi':11,
'CentroLesteSC1_lin7':10,
'DevonianaPR8_lin5':10,
'DevonianaSP3_lin5':6,
'DevonianaSP4_lin5':4,
'Spetrophilus':6,
'NorteMantiqueira2_lin3':4,
'NortePR4_lin7':3,
'NortePR5_lin7':6,
'CentroLestePR1_lin7':6,
'DevonianaPR5_lin5':6,
'DevonianaPR6_lin5':6,
'DevonianaPR7_lin5':8,
'ExtremoSulRS3_lin7':5,
'SulMantiqueira2_lin3':5,
'SulMantiqueira3_lin3':5,
'SulMantiqueira5_lin3':5,
'BocainaSerraDoMarRJ1_lin4':5,
'SerradaLontras2_lin1':5,
'SerradaLontras3_lin1':4,
'BocainaSerraDoMarRJ3_lin4':4,
'HCentroLesteSC_lin7':4,
'BoaEsperanca1_lin6':4,
'NortePR1_lin7':7,
'DevonianaPR2_lin5':6,
'BocainaSerraDoMarRJ4_lin4':5,
'HNortePR_lin7':7,
'NorteMantiqueira1_lin3':6,
'Caparao_lin3':6,
'SerraDaOuricana2_lin1':5,
'SerraDaOuricana3_lin1':6,
'SerraDaOuricana4_lin1':5,
'SerradaLontras4_lin1':7,
'CunhaSerraDoMarRJ2_lin4':5,
'ExtremoSulSC1_lin7':5,
'DevonianaSP1_lin5':5,
'DevonianaSP2_lin5':4,
'SerraDaOuricana1_lin1':3,
'SerradaLontras1_lin1':5,
'ExtremoSulRS2_lin7':5,
'CentroOesteSC1_lin7':5,
'CentroOesteSC2_lin7':5,
'CentroOesteSC3_lin7':5,
'CentroOesteSC4_lin7':5,
'SulMantiqueira4_lin3':7,
'CentroOesteSC5_lin7':5,
'NorteMantiqueira3_lin3':7,
'NorteMantiqueira4_lin3':4,
'NortePR2_lin7':5,
'SerraDosOrgaos3_lin2':4,
'DevonianaPR3_lin5':4,
'DevonianaPR4_lin5':4,
'NortePR3_lin7':7,
'Ssuperciliaris':4}

# Max depth (3x mean)
maxD={'Sdiamantinensis':75,
'SerradaLontras5_lin1':42,
'BoaEsperanca2_lin6':91,
'BoaEsperanca3_lin7':110,
'Snovacapitalis':100,
'Spachecoi':95,
'CentroLesteSC1_lin7':94,
'DevonianaPR8_lin5':87,
'DevonianaSP3_lin5':51,
'DevonianaSP4_lin5':35,
'Spetrophilus':56,
'NorteMantiqueira2_lin3':40,
'NortePR4_lin7':25,
'NortePR5_lin7':57,
'CentroLestePR1_lin7':53,
'DevonianaPR5_lin5':56,
'DevonianaPR6_lin5':53,
'DevonianaPR7_lin5':69,
'ExtremoSulRS3_lin7':45,
'SulMantiqueira2_lin3':49,
'SulMantiqueira3_lin3':43,
'SulMantiqueira5_lin3':43,
'BocainaSerraDoMarRJ1_lin4':47,
'SerradaLontras2_lin1':45,
'SerradaLontras3_lin1':35,
'BocainaSerraDoMarRJ3_lin4':35,
'HCentroLesteSC_lin7':40,
'BoaEsperanca1_lin6':38,
'NortePR1_lin7':61,
'DevonianaPR2_lin5':54,
'BocainaSerraDoMarRJ4_lin4':46,
'HNortePR_lin7':67,
'NorteMantiqueira1_lin3':50,
'Caparao_lin3':52,
'SerraDaOuricana2_lin1':42,
'SerraDaOuricana3_lin1':51,
'SerraDaOuricana4_lin1':47,
'SerradaLontras4_lin1':59,
'CunhaSerraDoMarRJ2_lin4':48,
'ExtremoSulSC1_lin7':43,
'DevonianaSP1_lin5':48,
'DevonianaSP2_lin5':38,
'SerraDaOuricana1_lin1':30,
'SerradaLontras1_lin1':44,
'ExtremoSulRS2_lin7':41,
'CentroOesteSC1_lin7':48,
'CentroOesteSC2_lin7':48,
'CentroOesteSC3_lin7':49,
'CentroOesteSC4_lin7':49,
'SulMantiqueira4_lin3':67,
'CentroOesteSC5_lin7':47,
'NorteMantiqueira3_lin3':60,
'NorteMantiqueira4_lin3':36,
'NortePR2_lin7':46,
'SerraDosOrgaos3_lin2':35,
'DevonianaPR3_lin5':33,
'DevonianaPR4_lin5':37,
'NortePR3_lin7':62,
'Ssuperciliaris':35}


# Individual genotype filtering function
#  - Genotypes failing filters are set to missing (./.)
#  - Applies individual min and max depth filters
#  - Filters heterozygotes if the allele balance (REF/DP) is <20% or >80%
#  - Filters homozygotes if more than 10% of the alleles are different type
#  - 'sample' is the sample name
#  - 'GT_entry' is the entire genotype entry for that individual (typically GT:AD:DP:GQ)
#  - 'ADpos' is the position of the AD field in FORMAT (determined below)
#  - 'DPpos' is the position of the DP field in FORMAT (determined below)

def GTfilter(sample, GT_entry, ADpos, DPpos):
    if GT_entry[:1]=='.' : return GT_entry
    else:
        gt=GT_entry.split(':')
        nocall='./.:' + ':'.join(gt[1:])
        #print(gt)
        #print(len(gt))
        #print(gt[0])
        #print(DPpos)
        #print(gt[DPpos])
        if len(gt)>1:
            if gt[0] in ('0/0','0/1','1/1') and gt[DPpos]!='.':
                DP=int(gt[DPpos])
                if minD[sample]<=DP<=maxD[sample]:
                    if gt[0]=='0/0':
                        return GT_entry
#		REF=float(gt[ADpos].split(',')[0])
#                AB=float(REF/DP)
                    elif gt[0]=='0/1':
                        REF=float(gt[ADpos].split(',')[0])
                        AB=float(REF/DP)
                        if 0.2<=AB<=0.8: return GT_entry
                        else: return nocall
                    elif gt[0]=='1/1':
                        REF=float(gt[ADpos].split(',')[0])
                        AB=float(REF/DP)
                        if AB<=0.1: return GT_entry
                        else: return nocall
                    else: return nocall
                else: return nocall
            else: return nocall
        else: return nocall

# Get list of samples in VCF file
samples=[]
for line in VCF:
    if line.startswith('##'):
        pass
    else:
        for i in line.split()[9:]: samples.append(i)
        break


# Go back to beginning of file
VCF.seek(0)


# Write pre-existing header lines & add new lines describing filters being applied
for line0 in VCF:
    if line0.startswith('#'):
        if line0.startswith('##FORMAT'):
            sys.stdout.write('##FILTER=<ID=FAIL_REF,Description="Reference allele not one of [A,C,G,T].">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_ALT,Description="Alternate allele not one of [A,C,G,T,.].">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_noADi,Description="AD not present in FORMAT.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_noDPi,Description="DP not present in FORMAT.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_noGT,Description="No called genotypes remain after filtering.">\n')
            sys.stdout.write('##FILTER=<ID=WARN_missing,Description="Excess missingness (>25% of samples uncalled or set to missing).">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_QD,Description="QD < 4.0.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_FS,Description="FS > 60.0.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_MQ,Description="MQ < 40.0.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_MQRankSum,Description="MQRankSum < -12.5.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_ReadPosRankSum,Description="ReadPosRankSum < -8.0.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_SOR,Description="SOR > 3.0.">\n')
            sys.stdout.write('##FILTER=<ID=FAIL_excessHet,Description="Excess heterozygosity (>75% of genotypes are 0/1).">\n')
            sys.stdout.write('##INFO=<ID=VariantType,Number=.,Type=String,Description="Whether the Variant is monomorphic or SNP).">\n')
            sys.stdout.write(line0)
            break
        #elif line0.startswith('##INFO'):
         #   sys.stdout.write('##INFO=<ID=VariantType,Number=.,Type=String,Description="Whether the Variant is monomorphic or SNP).">\n')
          #  sys.stdout.write(line0)
           # break
        else: sys.stdout.write(line0)


# Go through VCF file line by line to apply filters
for line0 in VCF:
    if line0.startswith('#'):
        sys.stdout.write(line0)
        continue
    line=line0.strip().split('\t')
    #print(line)

### Site filtering:
### Keep any filters that have already been applied
    filter=[]
    if line[6] not in ('.', 'PASS'):
        filter.append(line[6])

### Check REF allele
    if line[3] not in ['A','C','G','T']:       
        filter.append('FAIL_REF') 

### Check ALT allele
    if line[4] not in ['A','C','G','T','.']:
        filter.append('FAIL_ALT') 

### Access INFO field annotations
    if ';' in line[7]:
        INFO=line[7].split(';')
        d=dict(x.split('=') for x in INFO)
    else:
        INFO=line[7]
        if '=' in INFO:
            d={INFO.split('=')[0]:INFO.split('=')[1]}
        else: d={}

### Get the position of AD, DP in genotype fields
    if 'AD' in line[8]:
        ADpos=line[8].split(':').index('AD')
#    else: filter.append('FAIL_noADi')
    else: ADpos=999 

    #print(ADpos)
	
    if 'DP' in line[8]:
        DPpos=line[8].split(':').index('DP')
    else: filter.append('FAIL_noDPi')

### If any filters failed, write out line and continue
    if filter!=[]:
        sys.stdout.write('%s\t%s\t%s\n' % ('\t'.join(line[0:6]), ';'.join(filter), '\t'.join(line[7:])) )
        continue

### Genotype filtering:
    GT_list=[]
    for i in range(0,len(samples)):
        GT=GTfilter(samples[i],line[i+9],ADpos,DPpos)
        GT_list.append(GT)

### Recalculate AC, AN, AF for INFO (after this step, modified INFO values will be output)
    REF=2*[x[:3] for x in GT_list].count('0/0') + [x[:3] for x in GT_list].count('0/1')
    ALT=2*[x[:3] for x in GT_list].count('1/1') + [x[:3] for x in GT_list].count('0/1')
    if REF+ALT==0:
        filter.append('FAIL_noGT')
        sys.stdout.write('%s\t%s\t%s\t%s\n' % ('\t'.join(line[0:6]), ';'.join(filter), '\t'.join(line[7:9]), '\t'.join(GT_list)) )
        continue    
    d['AC']=ALT
    d['AN']=REF+ALT
    d['AF']=round(float(ALT)/(float(REF)+float(ALT)), 4)

### Warn if >25% of genotypes missing
    n_missing=[x[:3] for x in GT_list].count('./.')
    if n_missing>0.25*len(samples):
        filter.append('WARN_missing')

### Fail sites with excess heterozygosity (>75% of genotypes are heterozygous)
    n_het=sum(x[:3]=='0/1' for x in GT_list)
    n_called=sum(x[:3]!='./.' for x in GT_list)
    if float(n_het/n_called)>0.75:
        filter.append('FAIL_excessHet')
        
### Set VariantType, outputting sites with just hom. REF genotypes without further filtering
    if ALT==0:
        d['VariantType']='NO_VARIATION'   
        if filter==[]:
            filter.append('PASS')
        sys.stdout.write('%s\t%s\t%s\t%s\t%s\n' % ('\t'.join(line[0:6]), ';'.join(filter), ';'.join('{0}={1}'.format(key, val) for key, val in sorted(d.items())), line[8], '\t'.join(GT_list)) )
        continue
    elif REF==0:
        d['VariantType']='NO_VARIATION'
    else:
        d['VariantType']='SNP'

### Fail sites with poor variant metrics
    if 'QD' in d and float(d['QD']) < 4.0:
        filter.append('FAIL_QD')
    if 'FS' in d and float(d['FS']) > 60.0:
        filter.append('FAIL_FS')
    if 'MQ' in d and float(d['MQ']) < 40.0:
        filter.append('FAIL_MQ')
    if 'MQRankSum' in d and float(d['MQRankSum']) < -12.5:
        filter.append('FAIL_MQRankSum')
    if 'ReadPosRankSum' in d and float(d['ReadPosRankSum']) < -8.0:
        filter.append('FAIL_ReadPosRankSum')
    if 'SOR' in d and float(d['SOR']) > 3.0:
        filter.append('FAIL_SOR')

### Write out new line
    if filter==[]:
        filter.append('PASS')
    sys.stdout.write('%s\t%s\t%s\t%s\t%s\n' % ('\t'.join(line[0:6]), ';'.join(filter), ';'.join('{0}={1}'.format(key, val) for key, val in sorted(d.items())), line[8], '\t'.join(GT_list)) )


# Close files and exit
VCF.close()
exit()
