# Postwork 3.
setwd("c:/Users/ibzan/OneDrive/Documentos/Cursos/BEDU/Modulo2/1 - Introduccion a R y Software/Postwork/files/")

data_LaLiga <- read.csv(file = "datos_LaLiga.csv")

# La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
g_casa <- data_LaLiga[, "FTHG"]
p_g_casa <- table(g_casa)
p_g_casa <- prop.table(p_g_casa)
(p_g_casa <- p_g_casa * 100)

# La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)
g_visita <- data_LaLiga[, "FTAG"]
p_g_visita <- table(g_visita)
p_g_visita <- prop.table(p_g_visita)
(p_g_visita <- p_g_visita * 100)

# La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)
g_casa_visita <- prop.table(table(g_casa, g_visita))
(g_casa_visita <- g_casa_visita * 100)

library(ggplot2)
library(plotly)
#install.packages("extrafont")
library(extrafont)

# Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa.
p_g_casa <- as.data.frame(p_g_casa)
names(p_g_casa) <- c("Goles", "Probabilidad")
font_import("Trebuchet MS")
font_import()
y
g.p_g_casa <- ggplot(data = p_g_casa, aes(x = Goles, y = Probabilidad)) +
  geom_bar(stat = "identity", col = "#962D2D", fill = "#E798AE") +
  labs(title = "Probabilidades", caption = "Basado en los datos de LaLiga") +
  theme(text = element_text(family = "Trebuchet MS", size = 18, face = "bold"), plot.title = element_text(face = "bold"))

ggplotly(g.p_g_casa)

# Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.
p_g_visita <- as.data.frame(p_g_visita)
names(p_g_visita) <- c("Goles", "Probabilidad")

g.p_g_visita <- ggplot(data = p_g_visita, aes(x = Goles, y = Probabilidad)) +
  geom_bar(stat = "identity", col = "#005F99", fill = "#00EAD3") +
  labs(title = "Probabilidades", caption = "Basado en los datos de LaLiga") +
  theme(text = element_text(family = "open sans", size = 18, face = "bold"), plot.title = element_text(face = "bold"))

ggplotly(g.p_g_visita)

# Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.
g_casa_visita <- as.data.frame(g_casa_visita)
names(g_casa_visita) <- c("GolesCasa", "GolesVisita", "Probabilidad")
head(g_casa_visita)

g.g_casa_visita <- ggplot(g_casa_visita, aes(x = GolesCasa, y = GolesVisita, fill = Probabilidad)) +
  geom_tile() +
  scale_fill_gradient(low = "#F7FD04", high = "#FC5404") +
  theme_linedraw() +
  theme(text = element_text(family = "Trebuchet MS", size = 18, face = "bold")) +
  labs(title = "HeatMap datos LaLiga", caption = "Basado en los datos de LaLiga")

ggplotly(g.g_casa_visita)
