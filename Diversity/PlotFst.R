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

# change searchstring for the fst folder you are analysing 
# change myname for the populations you are comparing

searchstring="Lin1Lin7"
base_dir <- "~/Desktop/Projetos/Sspeluncae/Analises/fst/1Mscaffolds/"
setwd(paste0(base_dir, searchstring))
myname="Lin1 x Lin7"
avg_fst=6
pdf(paste("FstWC_",searchstring,".pdf", sep=""), width=20, height=10)
plotwinhet(searchstring, myname,avg_fst)
dev.off()

################################################
############ statisticall tests ################
################################################
# not quit sure 

# compare mean FST
# Example data (replace with your mean FST values)
allmeanfst <- data.frame(
  Lin2x3=c(0.392,0.3634,0.283,0.4759),
  Lin2x4=c(0.461,0.4277,0.2124,0.6956),
  Lin2x5=c(0.381,0.3335,0.2399,0.4904),
  Lin2x67=c(0.544,0.5124,0.4105,0.6642),
  Lin2x7=c(0.409,0.3625,0.2679,0.5192),
  Lin3x4=c(0.52,0.4881,0.3073,0.7294),
  Lin3x5=c(0.488,0.4511,0.5379,0.5948),
  Lin3x67=c(0.667,0.6472,0.5467,0.7835),
  Lin3x7=c(0.527,0.4946,0.3961,0.6379),
  Lin4x5=c(0.359,0.3297,0.2672,0.421),
  Lin4x67=c(0.56,0.533,0.4555,0.6475),
  Lin4x7=c(0.402,0.3722,0.3044,0.469),
  Lin5x67=c(0.132,0.124,0.0936,0.1599),
  Lin5x7=c(0.065,0.0536,0.0412,0.0713),
  Lin67x7=c(0.114,0.1025,0.0694,0.1426),
  row.names=c("Mean","Median","Q1","Q2")
)

# do ANOVA
library(tidyr)
allmeanfst_long <- pivot_longer(
  allmeanfst,
  cols = everything(),
  names_to = "Population_Pair",
  values_to = "FST"
)
anova_result <- aov(FST ~ Population_Pair, data = allmeanfst_long)
summary(anova_result)
TukeyHSD(anova_result) 

# comparation between chr and pairs 

fstfiles=list.files(pattern= "Lin4Lin6")
number_of_files = length(fstfiles)
fstfiles=fstfiles[c(1:number_of_files)]
Lin4Lin6=ldply(fstfiles, read.table, header=TRUE, sep="\t")

# Example if you have a list of tables
tables <- list(Lin2Lin5, Lin4Lin6)  # Add all your tables here
comparisons <- c("Lin2Lin5", "Lin4Lin6")  # Change to your actual comparisons

# Process each table
processed_tables <- lapply(1:length(tables), function(i) {
  tables[[i]] %>% 
    rename(!!comparisons[i] := avg_wc_fst) %>% 
    select(chromosome, window_pos_1, window_pos_2, !!comparisons[i])
})

# Merge all tables
combined_table <- Reduce(
  function(x, y) left_join(x, y, by = c("chromosome", "window_pos_1", "window_pos_2")),
  processed_tables
)

# View the result
head(combined_table)
