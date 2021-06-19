a1 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
a2 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
a3 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
a4 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"

setwd("D:/BEDU/ArchivosCSV/reto3")

download.file(url = a1, destfile = "2017_2018.csv", mode = "wb")
download.file(url = a2, destfile = "2018_2019.csv", mode = "wb")
download.file(url = a3, destfile = "2019_2020.csv", mode = "wb")
download.file(url = a4, destfile = "2020_2021.csv", mode = "wb")

lista <- lapply(dir(), read.csv)
lista

lista <- lapply(lista, select, c("Date","HomeTeam","AwayTeam","FTHG","FTAG","FTR"))
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])

data <- do.call(rbind, lista)

data
