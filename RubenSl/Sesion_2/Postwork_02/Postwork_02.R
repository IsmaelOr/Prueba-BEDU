# Postwork 2 - Rubén Sánchez Loperena

library(dplyr)

# 1-
# Se Importa datos de soccer de la temporada 2017/2018, 2018-2019, 2019-2020 de la primera división
URL_17_18 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
URL_18_19 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
URL_19_20 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"

setwd(choose.dir(caption = "Select folder"))

# Se descarga los dataset
download.file(url = URL_17_18, destfile = "soccer17_18.csv", mode = "wb")
download.file(url = URL_18_19, destfile = "soccer18_19.csv", mode = "wb")
download.file(url = URL_19_20, destfile = "soccer19_20.csv", mode = "wb")

# Se lee y guarda en una lista los 3 dataset
SoccerList <- lapply(dir(), read.csv)

# Verifica 
str(SoccerList[[1]])
str(SoccerList[[2]])
str(SoccerList[[3]])

SoccerList[[1]] <- mutate(SoccerList[[1]], Date = as.Date(Date, "%d/%m/%y"))
SoccerList[[2]] <- mutate(SoccerList[[2]], Date = as.Date(Date, "%d/%m/%Y"))
SoccerList[[3]] <- mutate(SoccerList[[3]], Date = as.Date(Date, "%d/%m/%Y"))


SoccerList <- lapply(SoccerList, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

str(SoccerList[[1]])
str(SoccerList[[2]])
str(SoccerList[[3]])

Soccer <- do.call(rbind, SoccerList)

str(Soccer)

write.csv(Soccer, "Soccer_2017-2020.csv", row.names = FALSE)



