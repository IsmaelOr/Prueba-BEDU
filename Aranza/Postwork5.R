#  ---------------------------
# | Postwork 2 - Equipo 15  |
#  --------------------------
library(dplyr)

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
SmallData <- lapply(dir(), read.csv)
#filtramos las columnas que necesitamos
SmallData <- lapply(SmallData,select, Date, HomeTeam, FTHG, AwayTeam ,FTAG)
#Unimos las listas en un solo dataframe
SmallData <- do.call(rbind, SmallData)
#damos formato a los datos según vamos a requerir en fbRanks
SmallData <- mutate(SmallData, Date = as.Date(Date, "%d/%m/%y"))
SmallData <- rename(SmallData, date = Date, home.team = HomeTeam, 
               home.score = FTHG, away.team = AwayTeam, 
               away.score = FTAG)

write.csv(SmallData, file = "soccer.csv", row.names = FALSE)

listasoccer <- create.fbRanks.dataframes(
  scores.file = "soccer.csv")
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

head(listasoccer$scores)

#Con ayuda de la función unique crea un vector de fechas (fecha) 
#que no se repitan y que correspondan a las fechas en las que se jugaron partidos. 
?unique

fecha <- unique(SmallData$date)
n <- length(fecha)

#obtenemos los rankings desde el 18/08/2017 al 23/12/2020
#Team Ranks Via Poission Regression: Creates ranks using a dataframe of match records. 
ranking <- rank.teams(anotaciones,equipos, 
                      max.date = max(fecha), min.date = min(fecha), 
                      date.format = '%d/%m/%Y')

#Predict function for fbRanks Objec  will predict the result (win, loss, tie) 
#and goals for a set of matches between teams.
#Cargamos la lista de ranking y escogemos la posición del vector de fechas para que nos de las predicciones
predict(ranking, date = fecha[n-1])


