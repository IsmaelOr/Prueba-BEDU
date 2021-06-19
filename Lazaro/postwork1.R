#Lázaro Raúl Díaz Lievano. BEDU. POSTWORK 1.
getwd()
setwd("C:/Users/Lazaro Diaz/Documents/")
football19_20 <- read.csv("SP1.csv")

class(football19_20)
str(football19_20)
?table
?cbind

fthg <- table(football19_20[,"FTHG"]); fthg
ftag <- table(football19_20[,"FTAG"]); ftag

?prop.table
#PROBABILIDAD MARGINAL DE METER "y" GOLES COMO LOCAL.
prop.table(fthg)
plot(prop.table(fthg))

#PROBABILIDAD MARGINAL DE METER "y" GOLES COMO VISITANTE.
prop.table(ftag)
plot(prop.table(ftag))


#PROBABILIDAD CONJUNTA DE QUE UN EQUIPO ANOTE "X" GOLES COMO LOCAL Y "y" GOLES COMO VISITANTE. 

#Definimos tab como la union de las tablas fthg y ftag y en la columna de 6 goles cambiamos el valor que nos devuelve cbind 
#por la funcion de residuo, es decir, cambiamos 136 por 0 dado que ningun equipo metio 6 goles jugando como visitante.
tab <- cbind(fthg,ftag); tab[7,2]=0; tab

#creamos la tabla de frecuencias global
prop.table(tab, margin=NULL)


