

nba_data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-03/Reto-02/players_stats.csv")

str(nba_data)
summary(nba_data)

nba_data <- na.omit(nba_data)


# Graficar el histograma con ggplot()
library(ggplot2)
library(dplyr)

g <- nba_data %>%
  ggplot() + 
  aes(MIN) +
  geom_histogram(binwidth = 50, col = "blue", fill = "yellow") +
  ggtitle("Histograma de Minutos jugados ") +
  ylab("Frecuencia") +
  xlab("Minutos") + 
  theme_light() +
  geom_vline(aes(xintercept = (mean(MIN))))

g

ggplotly(g)

edad <- nba_data %>%
  ggplot() + 
  aes(Age) +
  geom_histogram(binwidth = 2, col = "blue", fill = "green") +
  ggtitle("Histograma de Edad ") +
  ylab("Frecuencia") +
  xlab("Edad") + 
  theme_light() +
  geom_vline(aes(xintercept = (mean(Age))))


ggplotly(edad)



alto <- which.max(nba_data$Height)
paste("El jugador más alto es:", nba_data$Name[alto],"con una altura de:" ,round(nba_data$Height[alto]/100,2), "m")

bajito <- which.min(nba_data$Height)
paste("El jugador más bajito es:", nba_data$Name[bajito],"con una altura de:" ,round(nba_data$Height[bajito]/100,2), "m")


(my_scatplot <- ggplot(nba_data, 
                       aes(x = Weight, y = Height)) + 
                       geom_point() +
                       
    
  )

cor(nba_data$Weight, nba_data$Height)

