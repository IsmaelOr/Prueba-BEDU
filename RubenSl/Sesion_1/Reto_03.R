# Reto 3:

# Generar vector de 44 posiciones aleatorias

  ran <- rnorm(44)
  
# loop que eleve al cubo y sume 12 a las primeras 15 posiciones
  
  res <- vector()
  
  for (i in 1:15) {
    res[i] <- ran[i]**3 +12
    print(res[i])
  }
  
# Guardar en un data.frame (1° col -> numero aleat, 2° col -> result)
  
  df.al <- data.frame(ran = ran[1:15], result = res)
  
  df.al
  
#pseudocodigo del loop
  
  # ran <- {sgenera vector aleat de 44 pos}
  # 
  # res <- {inicializa un vector vacio}
  # 
  # for (contador desde 1 hasta 15 ){
  #   res[contador] <- operación aritmética
  #   se imprime el resultado (el[contador])
  # }
  