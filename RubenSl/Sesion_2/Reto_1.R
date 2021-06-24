#Reto 1:

# Librerias 
library(DescTools)

set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)

# Media
mean(x)
# Mediana
median(x)
# Moda
Mode(x)

# Deciles
quantile(x, seq(0.1,0.9, by = 0.1)) # Deciles

# Rango intercuartilico
IQR(x)

# Varianza
var(x)

# Desviacion estandar
sd(x)

# Grafica
plot(x)

