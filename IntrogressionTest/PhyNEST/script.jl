# based on https://github.com/sungsik-kong/PhyNEST.jl/wiki/ tutorial 
# "parse the input sequence alignment and compute observed quartet site pattern frequencies"
phylip_data = readPhylip("combined1kb.phy",checkpoint=true,writecsv=true) 
  # check the site pattern matrix 
df=show_sp(phylip_data)
  # parse topology function
starting_topology=readTopology("(Snovacapitalis,(Lin1,((Lin2,Lin3),(Lin4,((Lin6,Lin7),Lin5)))));")
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

