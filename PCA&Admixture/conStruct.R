# conStruct R = https://github.com/gbradburd/conStruct
# https://github.com/gbradburd/conStruct/blob/master/man/conStruct-manual.pdf
# installed in labgenoma2 
# prepare data 
# genarate allele frequency matrix: one row for each sample and one column for each loci giving the frequency of the counted allele at each locus in each sample
# vcftools 
# coords matrix: one row for each sample, in the same order as the allele frequency matrix, followed by two columns, first longitude and second latitude.  
# pairwise genetic distance matrix with 


library("conStruct")

# test 1 
conStruct(spatial=TREU, K=7,matrix_of_allele_frequencies,matrix_withlonglatcoords,outputprefix, n.iter=300, make.figs=TRUE, save.files=TRUE)
# test k = 9 (taking into account caparaó and others possible structures)
conStruct(spatial=TREU, K=0,matrix_of_allele_frequencies,matrix_withlonglatcoords,outputprefix, n.iter=300, make.figs=TRUE, save.files=TRUE)

x.validation(train.prop=0.9, n.reps=10,K=1:7, freqs_matrix, geoDistbetweensamples, coords_matrix, output_prefix,n.iter, make.figs=TRUE, save.files=TRUE, parallel=TRUE, n.nodes=5)
