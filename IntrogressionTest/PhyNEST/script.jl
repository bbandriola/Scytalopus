# Input phylip: 1 kb windows with a interval of 25kb between each, filtered for the individuals included in the analysis
# check for the sequences without Ns
# transfer a fasta file to a phylip format with vcf2phylip.py script 

# ACTUAL RUN PhyNEST
# based on https://github.com/sungsik-kong/PhyNEST.jl/wiki/ tutorial 
# "parse the input sequence alignment and compute observed quartet site pattern frequencies"
phylip_data = readPhylip("FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15.min4.phy",checkpoint=true,writecsv=true,csvname="inputPhyNEST") 
  # check the site pattern matrix 
df=show_sp(phylip_data)
  # parse topology function
starting_topology=readTopology("(Snovacapitalis,((SerradaLontras4_lin1,SerradaLontras3_lin1),((SerraDosOrgaos3_lin2,(Caparao_lin3,(SulMantiqueira4_lin3,NorteMantiqueira3_lin3))),((CunhaSerraDoMarRJ2_lin4,BocainaSerraDoMarRJ1_lin4),(((BoaEsperanca3_lin7,BoaEsperanca1_lin6),((ExtremoSulSC1_lin7,CentroOesteSC4_lin7),HCentroLesteSC_lin7)),(NortePR3_lin7,(HNortePR_lin7,(DevonianaPR8_lin5,DevonianaPR2_lin5))))))));")
  # compute the composite likelihood with the informed tree and phylip file 
stats,topology_1=do_optimization(starting_topology,phylip_data)

### in case happens an error: readCheckPoint(FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0.15.min4.phy.ckp)


# RUN phynest
  # 1. parallelization
  using Distributed
  length(Sys.cpu_info()) # check cores available for julia to work with 
  addprocs(8) # choose the number of cores to be used 
  @everywhere using PhyNEST # following this command run the phyne! function 
# hmax = maximum number of hybridization 
test1 = phyne!(starting_topology,phylip_data,"Snovacapitalis",do_hill_climbing=false,number_of_burn_in=30,hmax=5,filename="PhyNESR_sa_FilteredInd_FilteredPCAandUCE_Max30missingDepthmin10LD0")
# "Conducts Patterson's D-statistic test. The result prints site pattern frequencies ABAB and ABBA used to compute the D-statistic, Z-score, and the p-value for each quartet tested"
Dstat(p::Phylip, outgroup::String;
        alpha=0.05, 
        displayall=false,
        writecsv=true,filename="")
