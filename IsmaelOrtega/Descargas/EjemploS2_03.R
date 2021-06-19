# Ejemplo 3. Funciones `na.omit` y `complete.cases`

# Ahora vamos a considerar el conjunto de datos `airquality`, observamos primero
# algunas de sus filas

head(airquality)
library(dplyr)

# El tipo de objeto que es y el tipo de variables que contiene

str(airquality)

# observamos la dimensión

dim(airquality)
summary(airquality)


# Con la función `complete.cases` podemos averiguar cuales son aquellas filas
# que no contienen ningún valor perdido (NA) y cuales son aquellas filas
# que tienen al menos un valor perdido.

bien <- complete.cases(airquality)
bien

# La variable bien, es un vector lógico con `TRUE` en las posiciones que 
# representan filas de `airquality` en donde no hay NA's y con `FALSE`
# en las posiciones que representan aquellas filas de `airquality` en donde
# se encontraron NA's

# Por tanto, podemos contar el número de filas en donde no hay NA´s de la 
# siguiente manera

sum(bien)              ##Cuenta el numero de TRUE en el vector

# Podemos filtrar aquellas filas sin NA's de la siguiente manera

new_air <- airquality[bien,]
mean(new_air$Ozone)

data <- select(airquality, Ozone:Temp)   ## Seleciona de este data frame desde la columna Ozono hasta Temperatura
apply(data, 2, mean)                     ## Aplica una funcion media sobre las columnas (2) y filas (1).
apply(data, 2, mean, na.rm = T)       ## Remove NA y ponlo como TRUE

# `na.omit` devuelve el objeto con casos incompletos eliminados

(m1 <- apply(na.omit(data), 2, mean))     ## con na.omit se vuela todos los na y calcula la función RECOMENDABLE

b <- complete.cases(data)                  ## complete.cases solo se usa para conocer la posicion de cada uno de los NA

(m2 <- apply(data[b,], 2, mean))

identical(m1, m2)
