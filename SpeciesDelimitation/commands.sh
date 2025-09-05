#rename fasta labels to be in correct way to bpp analysis
for i in filtered_oneline_edited.GVXBX010*; do sed -i -f patterns2change.sed $i; done
