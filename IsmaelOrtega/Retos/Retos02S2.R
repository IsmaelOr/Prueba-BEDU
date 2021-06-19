

mediana <- function(vector){
  x <-sort(vector)
  if(length(vector) %% 2 != 0){
    return(x[length(x)/2+1])
  }else{
    return((x[length(x) / 2 + 1] + x[length(x) / 2]) / 2)
  }
}

x <- c(1:5)       # [ 1 , 2, 3, 4, 5]
## length(x)/2+1
mediana(x)
median(x)

y <- c(1:6)       #[1, 2, 3, 4, 5, 6]
mediana(y)
median(x)

set.seed(134)
aleatorio <- round(rnorm(99, 50, 12), 0)
aleatorio

mediana(aleatorio)
median(aleatorio)
