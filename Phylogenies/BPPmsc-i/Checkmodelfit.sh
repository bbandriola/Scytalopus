# 1. for each model
./cal_marginal_likelihoods.py summarize ./BPP_introgression2to4first.ctl.betaweights.csv "introgression2to4first_b[0-9].txt" --label introgression2to4first --output-dir ./res_2to4first
./cal_marginal_likelihoods.py summarize ./BPP_introgression5to4first.ctl.betaweights.csv "introgression5to4first_b[0-9].txt" --label introgression5to4first --output-dir ./res_5to4first

# 2. comparation between both models
./cal_marginal_likelihoods.py compare introgression2to4first/MarginalLikelihoodRuns/res_2to4first/marginal_likelihood.tsv introgression5to4first/MarginalLikelihoodRuns/res_5to4first/marginal_likelihood.tsv --output-dir ./comparison_2to4_vs_5to4
