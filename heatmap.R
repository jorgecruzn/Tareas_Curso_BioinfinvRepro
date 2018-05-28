# Este Script genera 1 heatmaps uno con datos de oyamel
#Cargamos las librerias
#source("http://bioconductor.org/biocLite.R")
# biocLite("Heatplus") Solo la primera vez

library("Heatplus")

# Leer archivo
oyamel <- read.csv("../meta/3918_mybstr.csv")

# Quitamos la columna que no es numerica, de lo contrario no lo hace
oyamel2 <- oyamel[,-1]
heatmap(as.matrix(oyamel2, Rowv=NA, Colv=NA))

