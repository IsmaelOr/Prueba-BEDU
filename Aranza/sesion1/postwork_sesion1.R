#POSTWORK SESION 1

#Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php
#Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)
#Consulta cómo funciona la función table en R al ejecutar en la consola ?table
#Posteriormente elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:
#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)
#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)
#Notas para los datos de soccer: https://www.football-data.co.uk/notes.txt

#seleccionar directorio de trabajo
setwd("C:/Users/Aranza Pizano/Documents/R/csv")
#descargar csv desde url
download.file(url = "https://www.football-data.co.uk/mmz4281/1920/SP1.csv", destfile = "2019_2020.csv", mode = "wb")
#guardar los datos del csv en un dataframe
Season2019 <- read.csv("2019_2020.csv")
#lectura de los primeros valores para verificar la carga correcta
head(Season2019) 

#filtrado de las columnas (FTHG) y (FTAG)

T_FTHG <- table(Season2019[ ,"FTHG"]) #TABLE DE GOLES EN CASA agrupa la frecuencia de que se anoten goles
T_FTAG <- table(Season2019[ ,"FTAG"]) #TABLE DE GOLES DE VISITANTE

?prop.table
#La probabilidad (marginal) de que el equipo que juega en casa anote x goles 
x <- prop.table(T_FTHG); x

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles
y <- prop.table(T_FTAG); y

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles

loc_vist <- cbind(T_FTHG,T_FTAG); #unimos las dos tablas, pero como no son de la misma dimensión usa la funcion residuo para la fila 7 col 2
loc_vist[7,2]=0; loc_vist #forzamos el valor a cero ya que nadie anoto 6 goles de visitante

xy <- prop.table(loc_vist); xy   #sacamos las probabilidades de goles de local y de visitante
