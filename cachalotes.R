# Este Script es el ejercicio 1 de la tarea 7.6
# Por Jorge Cruz N
# Llamar devtools

# Cargar librerias
library(devtools)
#install_github("liamrevell/phytools") solo la primera ez
# Nota si no se ha llamada a devtools no jala esta instrucción
library(ape)
library(maps)

#1 ¿Cuantos árboles tiene el archivo .trees?
arboles <- read.nexus("../data/All_Pmac_Unique_hap_seqs_strict_100M.trees")
# Tiene 10001 árboles en cuanto lo lees aparece el dato

#2 Muestreo aleatorio de 100 árboles con la semilla 1058
set.seed(1058)
muestra <- sample(arboles, 100)

# 3 Encontrar un árbol consenso
consenso <- consensus(muestra, p = 1, check.labels = TRUE)

#4 ¿Cuantos machos y hembras hay?
cachalote <- read.csv("../meta/P_macro.csv")
summary(cachalote$SEX)

#5 Graficar árbol con colores por continente

plot(consenso, type="phylogram", edge.width=0.1, cex=0.5)

# Graficar por continente

# Asigno colores
numcolsneeded<-length(levels(cachalote$Ocean))
palette(rainbow(numcolsneeded)) 

# Grafico sin nombre de muestras
plot(consenso, type="phylogram", edge.width=0.3, show.tip=FALSE)

# Agrego tip labels correpondientes a los Oceanos
tiplabels(pch=20, col=cachalote$Ocean)
# Pongo leyenda
legend(x= "bottomleft", legend=levels(cachalote$Ocean), pch=19, col=1:numcolsneeded, cex=1, bty="n")  

# 6 Carga el shapefile
library(maptools)
library(rgdal)
mares<-readShapeSpatial("../data/i/GSHHS_i_L1.shp")

# 7 Colorea por continente en gris

plot(mares, border="black", col=mares$area)

# 8 Grafica puntos de muestreo

cachalote[1:5,c("Latitude", "Longitude")]
points(cachalote$Longitude, cachalote$Latitude, pch=19, col="black", cex=2)




