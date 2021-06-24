# Reto 2:
# Realizar la lectura de los datos y seguir las instrucciones que se muestran a continuación.

# Utiliza el data frame de ventas de libros por Amazon y realiza las siguientes actividades:
  
# 1.Almacénalo en un data frame que se llame amazon.best

  amazon.best <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/bestsellers%20with%20categories.csv")

# 2.Calcula el data frame transpuesto, asígnale el nombre de tAmazon y conviértelo en un data frame (Hint: consulta la ayuda sobre las funciones t y as.data.frame)

  tAmazon <- as.data.frame(t(amazon.best))
  
# 3.Usa el nombre de los libros como el nombre de las columnas (Hint: consulta la documentación de names, tienes que hacer algo similar a names(dataframe) <- vector de nuevos nombres)

  colnames(tAmazon) <- tAmazon[1,]
  
  row.names(tAmazon)
  rownames(tAmazon)
  
# 4.¿Cuál es el libro de menor y mayor precio?
  
  which.max(tAmazon["Price",])  # Libro con mayor precio
  
  which.min(tAmazon["Price",])  # Libro con menor precio
  