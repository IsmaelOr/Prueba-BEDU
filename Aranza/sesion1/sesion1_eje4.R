
Obtenemos la ruta del directorio de trabajo

getwd()

# Fijando el directorio de trabajo

setwd("C:/Users/Aranza Pizano/Documents/R") # Depende del usuario donde ubicar su wd

# La función read.csv será util para leer fichero .csv

read.csv("bestsellers with categories.csv") # El archivo csv debe estar en el directorio de trabajo

# se puede asignar a un objeto el fichero leido anteriormente

amazon.books <- read.csv("bestsellers with categories.csv", sep=",", header = T)
str(amazon.books) 
head(amazon.books); tail(amazon.books) #te trae los primeros 6 y los ultimos 6 valores

# Calculamos la dimensión de la base de datos

dim(amazon.books)

# El tipo de objeto se puede saber utilizando class()

class(amazon.books)

# También se puede leer el fichero directamente desde una URL

data.url <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
str(data.url)
head(data.url); tail(data.url) 