args <- commandArgs(trailingOnly = TRUE)
library(litedown)

input<-args[1]
output<-args[2]

litedown::mark(input=input, output=output)
