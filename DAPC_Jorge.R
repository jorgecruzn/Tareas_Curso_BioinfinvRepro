#---Análisis discriminate de Componentes Principales con adegenet a partir de los datos de mi proyecto final
# Por Jorge Cruz

#Cargar librerias
library(adegenet)
library(gdsfmt)
library(SNPRelate)
library(Rcpp)
library(ape) # para la funcion nj
library(ggplot2)
library(vcfR) # Para leer los vcf

#----DAPC con adegenet

# Convertir a genlight  
vcf <- read.vcfR("../data/alignment/iptest.vcf") 
aa.genlight <- vcfR2genlight(vcf, n.cores = 1) 

# Realizar un PCA previo
pca.1 <- glPca(aa.genlight, nf=300, n.cores=1)
pca.1$eig[1]/sum(pca.1$eig) # Var explicada por el primer eje
pca.1$eig[2]/sum(pca.1$eig) # Var explicada por el segundo eje
pca.1$eig[3]/sum(pca.1$eig) # Var explicada por el tercer eje

#--preparar los datos para el DAPC 
grp <- find.clusters(aa.genlight, max.n.clust=15, glPca = pca.1, perc.pca = 
                       100, n.iter=1e6, n.start=1000)
7
7

#write.csv(grp$grp, "Kmedias_ind.csv") 
grupos <- (grp$grp)
grupos

# Preparar los datos de individuos

x <- data.frame(keyName=names(grp$grp), value=grp$grp, row.names=NULL)  

# convertir el vector a dataframe

x$pop <- as.factor(substr(x$keyName,16,1))
y<-x[order(x$pop),]                # ordenar 
grp.pop<-y[!duplicated(y$pop),]    # remover duplicados
coords <- read.csv ("../data/Individuos.csv")  # import tab-sep file 

#Realizar el DAPC

dapc1<-dapc(aa.genlight, grp$grp, glPca = pca.1)
7
7

## Graficarlo
scatter(dapc1)           # scatterplot 

# Modificar el scatterplot con forma de estrella
scatter(dapc1, cell = 0, pch = 18:23, cstar = 0, mstree = TRUE, lwd = 2, lty = 2)

# Visualizarlo de otra forma

scatter(dapc1, cex = 2, legend = TRUE,
        clabel = FALSE, posi.leg = "bottomleft", scree.pca = TRUE,
        posi.pca = "topleft", cleg = 0.75, xax = 1, yax = 2, inset.solid = 1)

# Verlo en grafica de barras
col <- rainbow(7) 
compoplot(dapc1, cex.names = 0.4, legend=F, col=col) 



