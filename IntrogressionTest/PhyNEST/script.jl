# based on https://github.com/sungsik-kong/PhyNEST.jl/wiki/ tutorial 
# "parse the input sequence alignment and compute observed quartet site pattern frequencies"
phylip_data = readPhylip("filename.phy",checkpoint=true,writecsv=true)
# check the site pattern matrix 
df=show_sp(phylip_data)
