          seed =  -1

       seqfile = Sspeluncae_outgroupSdiamantinensis.txt
      Imapfile = Sspeluncae_outgroupSdiamantinensis.Imap.txt
       jobname = Sspeluncae_outgroupSdiamantinensis

* speciesdelimitation = 1 * fixed species tree
* speciesdelimitation = 1 0 2   * species delimitation rjMCMC algorithm0 and finetune(e)
  speciesdelimitation = 1 1 2 1  * species delimitation rjMCMC algorithm1 finetune (a m)
         speciestree = 1 * speciestree pSlider ExpandRatio ShrinkRatio

   speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

  species&tree = 8  Lin1  Lin2  Lin3  Lin4  Lin5  Lin67  Lin7  Sdiamantinensis
                    9  1  9  4  16  3  10  1
                 (Sdiamantinensis,(Lin1,((Lin2,Lin3),(Lin4,((Lin67,Lin7),Lin5)))))); 
         phase =   1  1  1  1  1  1  1  1   
                  
       usedata = 1  * 0: no data (prior); 1:seq like
         nloci = 1036  * number of data sets in seqfile
         model = JC69

     cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

   thetaprior = invgamma 3 0.003 # gamma(a, b) for theta (estimate theta)
     tauprior = invgamma 3 0.035 # gamma(a, b) for root tau & Dirichlet(a) for other tau's

*     heredity = 1 4 4
*    locusrate = 1 5

*     finetune =  1  # finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr

         print = 1 0 1 1 1   * MCMC samples, locusrate, heredityscalars, Genetrees
        burnin = 20000
      sampfreq = 3
       nsample = 600000
