# convert to run SVDQuartets
for i in edited*fa; do seqmagick convert --output-format nexus --alphabet dna $i ./nexusFormat/$i.nex; done
