          seed =  -1

       seqfile = /home/bruna.andriola/Scytalopus/BPP/msci/last40000.phy
      Imapfile = /home/bruna.andriola/Scytalopus/BPP/msci/speluncae_novacapitalis.Imap.txt
       jobname = introgression5to4first
 
  speciesdelimitation = 0 * fixed species tree
	speciestree = 0 * speciestree pSlider ExpandRatio ShrinkRatio

   speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

  species&tree = 7 Snovacapitalis152win1kb Lin1 Lin2 Lin3 Lin4 Lin5 Lin67
                   1 2 1 3 2 3 4
(Snovacapitalis152win1kb, (Lin1,(((H2[&phi=0.100000,tau-parent=no],Lin2)T2,Lin3)P2,(((Lin4)H1[&phi=0.900000,tau-parent=yes])H2[&phi=0.900000,tau-parent=yes],(Lin67,(H1[&phi=0.100000,tau-parent=no],Lin5)T1)P5)P4)P1));
	phase = 1 1 1 1 1 1 1
                 
       usedata = 1  * 0: no data (prior); 1:seq like
         nloci = 500 * number of data sets in seqfile

     cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

    thetaprior = 3 0.002 e # invgamma(a, b) for theta
      tauprior = 3 0.03   # invgamma(a, b) for root tau & Dirichlet(a) for other tau's
	phiprior = 1 1
      finetune = 1  # auto-tune step lengths during burnin (append key:val pairs to customize)

         print = 1 0 1 1 1   * MCMC samples, locusrate, heredityscalars, Genetrees
        burnin = 20000
      sampfreq = 5
       nsample = 100000
       threads = 48
	checkpoint = 100000 20000
