          seed =  -1

       seqfile = Northlineages_lin5.phy
      Imapfile = Northlineages_lin5.Imap.txt
       outfile = Northlineages_lin5.txt
      mcmcfile = Northlineages_lin5_mcmc.txt

  speciesdelimitation = 0  * species delimitation rjMCMC algorithm1 finetune (a m)
         speciestree = 0 * speciestree pSlider ExpandRatio ShrinkRatio

*   speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

  species&tree = 4 lin2 lin3 lin4 lin5
                   1 8 4 10
                 ((lin3, (lin4)H[&phi=0.5,&tau-parent=no])S, (H[&tau-parent=no], B) T)R; 
         phase =   1  1  1  1  1  1  1  1   
                  
       usedata = 1  * 0: no data (prior); 1:seq like
         nloci = ####  * number of data sets in seqfile

     cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

    thetaprior = 3 0.002 e # invgamma(a, b) for theta
      tauprior = 3 0.03   # invgamma(a, b) for root tau & Dirichlet(a) for other tau's
*      phiprior = 1 1

*     heredity = 1 4 4
*    locusrate = 1 5

*     finetune =  1  # finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr

         print = 1 0 1 1 1   * MCMC samples, locusrate, heredityscalars, Genetrees
        burnin = 20000
      sampfreq = 3
       nsample = 500000
       threads = 15
