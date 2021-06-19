set.seed(134) 
x <- round(rnorm(1000, 175, 6), 1)

mean(x)  ## media
median(x)   ## mediana

library(DescTools)      ##moda
Mode(x)

quantile(x, seq(0.1,0.9, by = 0.1))    ##deciles

IQR(x)       #Rango intercuartílico

var(x)     #varianza
sd(x)      #desviación estándar


# getmode <- function(v) {
# uniqv <- unique(v)
# uniqv[which.max(tabulate(match(v, uniqv)))]   #Con esto obtenemos la moda
# }


# sort(table(x),T)[1]       #Otra forma de sacar la moda
