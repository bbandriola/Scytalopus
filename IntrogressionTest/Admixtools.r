# source https://uqrmaie1.github.io/admixtools/articles/admixtools.html

list.of.packages <- c("admixtools", "tidyverse")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, library, character.only = TRUE)
