# 1. convert vcf to phylip
python ../outgroup_Snovacap/vcf_to_phylipIUPACode.py NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_SpeluncaeLin1.recode.vcf.gz NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_SpeluncaeLin1.phy

# 2. Run HyDe
python run_hyde.py -i NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_SpeluncaeLin1.phy -m map.txt -o out -n 54 -t 7 -s 1636679 -q --prefix SpeluncaeLin1
python run_hyde.py -i NoZW_FilteredPCAandUCE_Max30missingDepthmin10LD015_GeographicNames_SpeluncaeLin1Snovacap.phy -m map.txt -o out -n 55 -t 8 -s 1801056 -q --prefix SpeluncaeLin1Snovacap
