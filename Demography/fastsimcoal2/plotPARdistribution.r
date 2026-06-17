library(tidyverse)
setwd("./")
table=read.table("allmodel1.bestlhoods",header=T)

pdf("dist_MaxEstLhood.pdf", height = 5, width = 6)
ggplot(table)+geom_line(aes(y=RUN,x=MaxEstLhood))
dev.off()

