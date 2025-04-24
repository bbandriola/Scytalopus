Pi <- read.table("PI_lin6.txt")
average <- mean(Pi$V5, na.rm = TRUE)
print(average)
