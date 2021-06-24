url_liga <- "https://www.football-data.co.uk/mmz4281/2021/SP1.csv"

setwd("C:/Users/ibzan/OneDrive/Documentos/Cursos/BEDU/Modulo2/1 - Introduccion a R y Software/Retos/files")

liga_19.20.df <- read.csv(url_liga)

head(liga_19.20.df)

#install.packages("dplyr")
library(dplyr)

fthg <- table(liga_19.20.df[, "FTHG"])

?table
?prop.table

fthg_prob <- prop.table(fthg)

ftag <- table(liga_19.20.df[, "FTAG"])

ftag_prob <- prop.table(ftag)

?rbind
fthg_y_ftag <- rbind(fthg_prob, ftag_prob)
row.names(fthg_y_ftag) <- c("FTHG_Prob", "FTAG_Prob")

#fthg_y_ftag <- prop.table(fthg_y_ftag)
