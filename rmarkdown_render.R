args <- commandArgs(trailingOnly = TRUE)
input<-args[1]
output<-args[2]

library(rmarkdown)

output_format=html_document(keep_md=TRUE, 
                            mathjax="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js")
render(input=input,
       output_format=output_format, 
       output_file=output, 
       clean=TRUE)
