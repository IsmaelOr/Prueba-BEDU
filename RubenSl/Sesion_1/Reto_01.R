# Reto 1: Abre el fichero que se encuentra en el repositorio y opten sus características, para 
# finalmente imprimir los resultados en un fichero CSV.


# 1. Leer el archivo "netflix_titles.csv" desde Github (https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-01/Data/netflix_titles.csv),
#    almacenarlo en un df llamado netflix

  data.url <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-01/Data/netflix_titles.csv")

# 2. Obtener la dimensión y el tipo de objeto que se obtiene

  dim(data.url)     # Dimension
  class(data.url)   # Tipo de obj

# 3. Obtener los títulos que se estrenaron después del 2015. Almacenar este df en una variable 
#    llamada net.2015 (Hint: primero podrías filtrar solo aquellas filas del data frame que 
#    corresponden a estrenos después del 2015, por ejemplo, dataframe[dataframe$columna > 2015, ])

  net.2015 <- data.url[data.url$release_year > 2015,]

# 4. Escribir los resultados en un archivo .csv llamado res.netflix.csv (Hint: consulta la función 
#    write.csv)
  getwd()
  setwd(choose.dir(caption = "Selec folder"))
  write.csv(net.2015, file = "res.netflix.csv")

    