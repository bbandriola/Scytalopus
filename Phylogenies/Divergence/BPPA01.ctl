          seed =  -1

       seqfile = combined_50kb.phy
      Imapfile = speluncae_novacapitalis.Imap.txt
       outfile = speluncae_novacapitalis.txt
      mcmcfile = speluncae_novacapitalis.txt

  speciesdelimitation = 0  * species delimitation rjMCMC algorithm1 finetune (a m)
         speciestree = 0 * speciestree pSlider ExpandRatio ShrinkRatio

*   speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

  species&tree = 16 Snovacapitalis SerradaLontras4_lin1 SerradaLontras3_lin1 SerraDosOrgaos3_lin2 Caparao_lin3 SulMantiqueira4_lin3 NorteMantiqueira3_lin3 CunhaSerraDoMarRJ2_lin4 BocainaSerraDoMarRJ1_lin4 BoaEsperanca3_lin7 BoaEsperanca1_lin6 ExtremoSulSC1_lin7 CentroOesteSC4_lin7 NortePR3_lin7 DevonianaPR8_lin5 DevonianaPR2_lin5
                   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
                 (Snovacapitalis,((SerradaLontras4_lin1,SerradaLontras3_lin1),((SerraDosOrgaos3_lin2,(Caparao_lin3,(SulMantiqueira4_lin3,NorteMantiqueira3_lin3))),((CunhaSerraDoMarRJ2_lin4,BocainaSerraDoMarRJ1_lin4),(((BoaEsperanca3_lin7,BoaEsperanca1_lin6),(ExtremoSulSC1_lin7,CentroOesteSC4_lin7)),(NortePR3_lin7,(DevonianaPR8_lin5,DevonianaPR2_lin5))))))); 
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
       nsample = 600000
       threads = 10
