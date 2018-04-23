# Este script de R es la primera parte de la tarea de R
# 11 de abril de 2018
#Guardado en Prac_Uni7/maices/bin y lo llame ExplorandoMaiz.R, 
#que  y 2) responda lo siguiente.

# Paso previo ubicamos en donde estamos con getwd que equivale a pwd en Linux
getwd()

# Paso 1 Nos ponemos en la ruta corrrecta dando Sesion Working Directory/To Source location
# Ahora 1) cargue en R el archivo Prac_Uni7/maices/meta/maizteocintle_SNP50k_meta_extended.txt

maices <- read.delim(file= "../meta/maizteocintle_SNP50k_meta_extended.txt")

#2 ¿Qué tipo de objeto creamos al cargar la base, con el comando class?
# Respuesta un data.frame
class(maices)

# 3. ¿Cómo se ven las primeras 6 líneas del archivo? Utilizamos head
head(maices[1:6,])

#4.¿Cuántas muestras hay? Para esto podemos utilizar las siguientes opciones
tail(maices)
dim(maices)
nrow(maices)
ncol(maices)

#5.¿De cuántos estados se tienen muestras? como son factores la columna 5 tiene los estados
levels(maices [,5])

# 6. ¿Cuántas muestras fueron colectadas antes de 1980?
# Respuesta 13, solo le di <= 1980 a la columna
antes <- maices[maices$AÌ.o._de_colecta <= 1980 ,]
antes

# 7.¿Cuántas muestras hay de cada raza?
# Hay dos opciones
table(maices[,4])
table(maices$Raza)

# 8. En promedio ¿a qué altitud fueron colectadas las muestras?
# Solo seque el promedio de esa columna R = 1519.42
mean(maices$Altitud)

# 9. ¿Y a qué altitud máxima y mínima fueron colectadas?
# Con max y min de la columna obtengo el dato 
max(maices$Altitud)
min(maices$Altitud)

# 10.Crea una nueva df de datos sólo con las muestras de la raza Olotillo
# Esto lo hice con la función subset
olotillo <- subset(maices, Raza=="Olotillo")

# 11. Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
# Igualmente lo hice con subset
razas <- subset(maices, Raza==c("Reventador", "Jala", "Ancho"))


# 12. Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.
# Primero lo hago una matriz y luego escribo el csv
as.matrix(razas)
write.csv(razas, "../meta/submat.csv")




