 

u1011 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"

setwd("c:/Users/ruben/Escritorio/Bedu/Modulo_2/Sesion_2/Data_E/")

download.file(url = u1011, destfile = "2017-2018F.csv", mode = "wb")
download.file(url = u1112, destfile = "2018-2019F.csv", mode = "wb")
download.file(url = u1213, destfile = "2019-2020F.csv", mode = "wb")
download.file(url = u1314, destfile = "2020-2021F.csv", mode = "wb")


lista <- lapply(dir(), read.csv) # Guardamos los archivos en lista



lista <- lapply(lista, select, Date:FTR) # seleccionamos solo algunas columnas de cada data frame
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])

data <- do.call(rbind, lista)
head(data)
dim(data)
