# Reto 2:

# Obtenemos numeros aleatorios
set.seed(134)
x <- round(rnorm(98, 50, 12), 0)


# Funcion Mediana
mediana <- function(vector){
  
  x <- sort(vector) # Ordenamos
  
  if ((length(x) %% 2) != 0){
    
    return(x[length(x) / 2 + .5])
    
  } else {
    
    return((x[(length(x) / 2) + 1] + x[length(x) / 2]) / 2)
    
  } 
}


mediana(x)
median(x)
