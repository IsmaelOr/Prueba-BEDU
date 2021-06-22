#definimos donde se guardaran los archivos
setwd("C:/Users/Lazaro Diaz/Documents/reto3")
#definimos los url
u1011 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"

#descargamos los archivos con estos nombres
download.file(url = u1011, destfile = "SP1-17-18.csv", mode = "wb")
download.file(url = u1112, destfile = "SP1-18-19.csv", mode = "wb")
download.file(url = u1213, destfile = "SP1-19-20.csv", mode = "wb")
#verificamos que esten los archivos correctos en el directorio 
dir()

#el primer csv tiene las fechas como caracteres y con la estructura dd/mm/yy, mientras que los demas archivos tienen 
#el formato dd/mm/yyyy, por lo tanto debemos trabajar primero con este archivo y cambiar el formato
df_1819 <- read.csv("C:/Users/Lazaro Diaz/Documents/reto3/SP1-17-18.csv")
str(df_1819)
df_1819 <- mutate(df_1819, Date = as.Date(Date, "%d/%m/%y"))
df_1819$Date <- format(as.Date(df_1819$Date, format = "%Y-%m-%d"), "%d/%m/%Y")
str(df_1819)
#una vez ya cambiado el formato, lo guardamos en la misma carpeta
setwd("C:/Users/Lazaro Diaz/Documents/reto3")
write.csv(df_1819, "SP1-1718.csv", row.names = FALSE)
#guardamos el archivo con la fecha ya corregida y en el explorador de archivos 
#reemplazamos el SP1-17-18.csv original por el corregido.

?dir
#hacemos una lista con los archivos dentro del directorio 
lista <- lapply(dir(), read.csv)
head(lista)

#redefinimos "lista" como las tablas donde solo estan las columnas Date, HomeTeam, etc. 
lista <- lapply(lista, select, c("Date","HomeTeam","AwayTeam","FTHG","FTAG","FTR"))
str(lista)
?as.list


#observamos las columnas de las distintas tablas que tenemos
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); 

str(lista)
#
#juntamos los df de la lista en un solo dataframe
data <- do.call(rbind, lista)
str(data)
head(data)

#cambiamos el datatype de los datos de la columna Date, estaba en chr, lo cambiamos a Date.
data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))

str(data)
head(data); tail(data)
dim(data)
summary(data)
