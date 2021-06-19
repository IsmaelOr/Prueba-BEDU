# Ejemplo 3. Listas y data frames

# Objetivo
# Crear listas y data frames
# Extraer información de estos
# Cálculo de estadísticos básicos

# Requisitos

# Prework
# R, RStudio
# Ejemplos 1 y 2

# Desarrollo

# Seguir el contenido y tratar de comprender el código mostrado a continuación

# Listas
#las listas se ponen entre parentesis para ver el resultado en consola

(milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9)))

# ESTRUCTURA propiedades de la lista

str(milista)

# Extrayendo elementos de la lista, recuerda que para ingresar se debe usar el símbolo $

milista$nombre

# Creando data frames

(x <- 10:21)
(y <- letters[x])

#Cada columna corresponde a cada una de las variables
(mydf <- data.frame(edad=x, grupo=y))
#en las df las observaciones son las filas y las variables las columnas
str(mydf) 

# Extrayendo información del df, se hace igual que con las matrices

mydf[1]
mydf[,1]
mydf$edad

# Calculando algunos estadísticos básicos

mydf$edad
mean(mydf$edad)     #promedio de edades

# Podemos hacer uso de la función `paste` para agregar un mensaje, concatena

paste("La media de la edad es:", mean(mydf$edad))

# Podemos inspeccionar a detalle el df utilizando `summary`

summary(mydf)

# También se puede conocer su dimensión

dim(mydf)

# Podemos agregar una columna extra con datos

mydf$sexo <- c("H", "M", "H", "M", "H", "H", "M", "H","H","M", "M", "H")
mydf

# Si fuera el caso, se puede eliminar una columna

(mydf$sexo <- NULL)