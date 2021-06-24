# Reto 1
# Guardar el csv
data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-03/Reto-01/BD_Altura_Alunos.csv", sep =";")

# Analizar los componentes
head(data)
names(data)
str(data)

summary(data)

# Graficar el histograma con hist()
hist(data$Altura, breaks = seq(145,195, 5), 
     main = "Histograma de Alturas",
     xlab = "Alturas",
     ylab = "Frecuencia")


# Graficar el histograma con ggplot()
library(ggplot2)
library(dplyr)

g <- data %>%
  ggplot() + 
  aes(Altura) +
  geom_histogram(binwidth = 5, col = "blue", fill = "yellow") +
  ggtitle("Histograma de Alturas") +
  ylab("Frecuencia") +
  xlab("Alturas") + 
  theme_light()

g

# Grafica mas dinamica con ggplotly()
ggplotly(g)
