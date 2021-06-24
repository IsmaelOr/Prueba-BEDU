
library(ggplot2)
library(plotly)

setwd(choose.dir(caption = "Select folder"))

Soccer <- read.csv("Soccer_2017-2020.csv")

# Se extrae los goles anotados por los equipos
  G_Casa <- Soccer[, "FTHG"]        # Goles anotados por equipos de casa
  G_Visitante <- Soccer[, "FTAG"]   # Goles anotados por equipos visitantes

# Se realiza las tablas de frecuencia para obtener las sig probabilidades
  F_GCasa <- table(G_Casa); F_GCasa                  # T.Frec. goles de casa
  F_GVisitante <- table(G_Visitante); F_GVisitante   # T.Frec. goles visitantes

# La probabilidad (marginal) de que el equipo de casa anote X goles
P_GCasa <- prop.table(F_GCasa)
paste("La probabilidad (%) de que el equipo de casa anote X goles es: ")
P_GCasa <- round((P_GCasa * 100), 3); P_GCasa

# La probabilidad (marginal) de que el equipo de visitante anote Y goles
P_GVisitante <- prop.table(F_GVisitante)
paste("La probabilidad (%) de que el equipo visitante anote Y goles es: ")
P_GVisitante <- round((P_GVisitante * 100), 3); P_GVisitante

# La probabilidad (conjunta) de que el equipo de casa anote X goles y el 
# equipo que juega como visitante anote Y goles
P_Conj <- prop.table(table(G_Casa, G_Visitante))
paste("La probabilidad conjunta (%) de que el equipo de casa anote X goles y el equpo visitante anote Y goles: ")
P_Conj <- round((P_Conj * 100), 3); P_Conj

g <-Soccer %>%
  ggplot() + 
  aes(FTHG) +
  geom_histogram(binwidth = 1)

ggplotly(g)

ggplotly(plot(x=P_GCasa))

L <- as.data.frame(P_GCasa);L

V <- as.data.frame(P_GVisitante);V

row.names(L) <- c("Goles","Probabilidad")

gl <- ggplot(L, aes(x=G_Casa, y=Freq)) + geom_col(colour = "black", fill= "yellow")+
  ggtitle("Probabilidades marginales de goles de equipos Locales") + 
  xlab("Goles") +
  ylab("Probabilidades") +
  theme_light()

ggplotly(gl)

gv <- ggplot(V, aes(x=G_Visitante, y=Freq)) + geom_col(colour = "black", fill= "yellow")+
  ggtitle("Probabilidades marginales de goles de equipos Visitantes") + 
  xlab("Goles") +
  ylab("Probabilidades") +
  theme_light()

ggplotly(gv)
