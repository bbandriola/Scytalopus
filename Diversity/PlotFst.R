# Scipt to plot FST values through the genome estimated from genomic windowns with pixy 
# author: Bruna B Andriola

# libraries
library(ggplot2) # plotting
library(Rmisc) # multiplot
library(tidyverse)
library(hrbrthemes)
library(viridis)

Fst <- read.table("Lin3A3B_FstHudson_fst.txt", header=T)

# plot
plotwinhet = function(fstfile, myname, hete, calls) {
  fst=ldply(fstfile, read.table, header=TRUE, sep="\t")
  # median and quartiles
  median_fst = median(fst$avg_hudson_fst, na.rm = TRUE)
  quartiles = quantile(fst$avg_hudson_fst, probs = c(0.25, 0.75), na.rm = TRUE)
  mean_fst = mean(fst$avg_hudson_fst, na.rm = TRUE)
  # cumulative positions for continuous plotting
  chroms = unique(fst$chromosome)
  max_pos = max(fst$window_pos_2)
  cumulative_pos = numeric(nrow(fst))
  for (i in seq_along(chroms)) {
    chrom_mask = fst$chromosome == chroms[i]
    cumulative_pos[chrom_mask] = fst$window_pos_1[chrom_mask] + 
      (i - 1) * max_pos
  }
  # Prepare alternating colors for chromosomes
  mycols = rep(c("dodgerblue4", "dodgerblue3"), length.out = length(chroms))
  names(mycols) = chroms
  # Create plot title with statistics
  plotname = paste(myname, 
                   "\nMean FST = ", sprintf("%.4f", mean_fst),
                   " | Median FST = ", sprintf("%.4f", median_fst),
                   sep = "")
  par(mar = c(10, 5, 10, 5))
  plot(cumulative_pos, fst$avg_hudson_fst, 
       type = "h", lwd = 1, col = mycols[as.character(fst$chromosome)],
       xlab = "Genomic Position", ylab = "FST", 
       main = plotname, xaxt = "n")
  # Add horizontal lines for median and quartiles
  abline(h = median_fst, col = "red", lty = 15)
  abline(h = quartiles, col = "orange", lty = 15)
  
  # Add legend
  legend("topright", 
         legend = c(paste("Median:", round(median_fst, 4)),
                    paste("Q1:", round(quartiles[1], 4)),
                    paste("Q3:", round(quartiles[2], 4))),
         col = c("red", "orange", "orange"), lty = c(2, 3, 3), cex = 0.8)
  
  # Return the statistics
  return(list(mean_fst = mean_fst, median_fst = median_fst, quartiles = quartiles))
}


fstfile="Lin3A3B_FstHudson_fst.txt"
myname="Lin3A3B"
avg_hudson_fst=6
no_snps=7
pdf(paste("Lin3A3",myname,".pdf", sep=""), width=20, height=10)
plotwinhet(fstfile, myname,avg_hudson_fst,no_snps)
dev.off()
