# POSTWORK 1. 

url_liga <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"

setwd("C:/Users/ibzan/OneDrive/Documentos/Cursos/BEDU/Modulo2/1 - Introduccion a R y Software/Retos/files")

liga_19.20.df <- read.csv(url_liga)

head(liga_19.20.df)

#install.packages("dplyr")
library(dplyr)

?table
?prop.table

# 1. La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)
fthg <- table(liga_19.20.df[, "FTHG"])
fthg_prob <- prop.table(fthg)
(fthg_prob <- fthg_prob * 100)
#write.csv(fthg_prob, file = "fthg_prob.csv")

# 2. La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
ftag <- table(liga_19.20.df[, "FTAG"])
ftag_prob <- prop.table(ftag)
(ftag_prob <- ftag_prob * 100)

# La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)
fthg_y_ftag <- prop.table(table(liga_19.20.df[, "FTHG"], liga_19.20.df[, "FTAG"]))
(fthg_y_ftag <- fthg_y_ftag * 100)
