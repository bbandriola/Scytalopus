# 1. convert vcf to phylip
python3 ~/Softwares/vcf_to_phylipIUPACode.py FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis.recode.vcf.gz FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis.phy

# 2. Run HyDe
python run_hyde.py -i FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis.phy -m map_separaringDevoniana.txt -o out -n 54 -t 15 -s 1636679 -q --prefix complex_novacapout

# 3. testing for the dynamic of the introgression between individuals (to understand if is uniform or not)
# it needs the input of the triplets. So we would test only the populations that seemed introgressed 
# the triple file can be the output of the run_hyde.py run
python individual_hyde.py -i FilteredLDfiltered_MinDPMaxDPperInd20MaxMissBialelicSNPs_FilteredPCAandUCE_GeographicNames_complex_novacapitalis.phy -m map_separaringDevoniana.txt -tr triplets2test.txt -o out -n 55 -t 8 -s 1801056 --prefix Individualtest_

