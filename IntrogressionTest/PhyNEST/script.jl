# Input phylip: 1 kb windows with a interval of 25kb between each, filtered for the individuals included in the analysis
# check for the sequences without Ns
# transfer a fasta file to a phylip format with vcf2phylip.py script 

# ACTUAL RUN PhyNEST
# based on https://github.com/sungsik-kong/PhyNEST.jl/wiki/ tutorial 
# "parse the input sequence alignment and compute observed quartet site pattern frequencies"
phylip_data = readPhylip("all1kbfilesSelectedInd.phy",checkpoint=true,writecsv=true) 
  # check the site pattern matrix 
df=show_sp(phylip_data)
  # parse topology function
starting_topology=readTopology("(Snovacapitalis152win1kb,(Sspeluncae120,((Sspeluncae83,(Sspeluncae116,(Sspeluncae73,Sspeluncae113))),((Sspeluncae16,Sspeluncae2),(((Sspeluncae123,Sspeluncae54),((Sspeluncae19,Sspeluncae72),Sspeluncae52)),(Sspeluncae87,(Sspeluncae64,(Sspeluncae140,Sspeluncae59))))))));")
  # compute the composite likelihood with the informed tree and phylip file 
stats,topology_1=do_optimization(starting_topology,phylip_data)

# RUN phynest
  # 1. parallelization
  using Distributed
  length(Sys.cpu_info()) # check cores available for julia to work with 
  addprocs(8) # choose the number of cores to be used 
  @everywhere using PhyNEST # following this command run the phyne! function 
# hmax = maximum number of hybridization 
test1 = phyne!(starting_topology,phylip_data,"Sdiamantinensis127win1kb",do_hill_climbing=false,number_of_burn_in=30,hmax=5)

