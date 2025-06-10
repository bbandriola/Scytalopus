# Scipt to plot FST values through the genome estimated from genomic windowns with pixy 
# Bruna B Andriola

# libraries
library(ggplot2) # plotting
library(Rmisc) # multiplot
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(plyr)
library(dplyr)
library(ggplot2)


# plot
plotwinhet = function(searchstring, myname, avg_fst) {
  fstfiles=list.files(pattern= searchstring)
  number_of_files = length(fstfiles)
  fstfiles=fstfiles[c(1:number_of_files)]
  allfst=ldply(fstfiles, read.table, header=TRUE, sep="\t")
  # median and quartiles
  median_fst = median(allfst$avg_wc_fst, na.rm = TRUE)
  quartiles = quantile(allfst$avg_wc_fst, probs = c(0.25, 0.75), na.rm = TRUE)
  meanfst=mean(allfst$avg_wc_fst, na.rm = TRUE)
  # plot title
  plotname=bquote("Mean" ~ F[ST] == .(sprintf("%.3f", meanfst)) ~ .(myname))
  # position of chr
  pos=as.numeric(rownames(unique(data.frame(allfst$chromosome)[1])))
  pos=append(pos,length(allfst$chromosome))
  numpos=NULL
  for (i in 1:length(pos)-1){numpos[i]=(pos[i]+pos[i+1])/2}
  # colors chr 
  mycols=NULL
  for (i in (seq(1,length(numpos), by=2))){mycols[i]="mediumpurple1"}
  for (i in (seq(2,length(numpos), by=2))){mycols[i]="purple1"}
  # plot
  par(mar=c(6,5,4,1))
  b=barplot(allfst$avg_wc_fst, ylim=c(0,1), 
            border=mycols[as.factor(allfst$chromosome)], 
            col=mycols[as.factor(allfst$chromosome)], ylab = expression(F[ST] ~ ("per scaffold")), 
            main=plotname)
  axis(side=1, at=b[pos], labels=F)
  abline(h = median_fst, col = "deeppink1", lty = 15,lwd=3)
  abline(h = quartiles, col = "orange", lty = 15,lwd=3)
  legend("topright", 
         legend = c(paste("Median:", round(median_fst, 4)),
                    paste("Q1:", round(quartiles[1], 4)),
                    paste("Q3:", round(quartiles[2], 4))),
         col = c("deeppink1", "orange", "orange"), lty = c(2, 3, 3), cex = 0.8)
}

searchstring="Lin2Lin5_"
myname="Lin2 x Lin5"
avg_fst=6
pdf(paste("FstWC_",myname,".pdf", sep=""), width=20, height=10)
plotwinhet(searchstring, myname,avg_fst)
dev.off()
