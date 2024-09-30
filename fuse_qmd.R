args <- commandArgs(trailingOnly = TRUE)

library(rmarkdown)
library(litedown)

input<-args[1]
output<-args[2]

#set echo to FALSE
chunk_options<-litedown::reactor()
chunk_options$echo = FALSE
options(litedown.enable.knitr_inline = TRUE)
options(litedown.inline.signif = 12)

#set the params in the environment
yaml<-rmarkdown::yaml_front_matter(input)
params<-yaml$params
litedown::fuse(input=input, output=output)
