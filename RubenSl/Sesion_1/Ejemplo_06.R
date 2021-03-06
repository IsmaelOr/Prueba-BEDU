# EJEMPLO 6. Loops y pseudoc�digo: for, while, if, else, if-else

# Objetivo
# Conocer la inicializaci�n de variables
# Ejecutar un loop, for, while, if y if-else

# Desarrollo
# Durante este ejemplo se dar�n las bases para inicializar una variable que sea utilizada dentro de un loop, adicionalmente se utilizaran los comandos while, if y if-else para poder utilizarlos adecuadamente

# Este ejemplo se elevar�n al cuadrado las entradas de un vector cualquiera

w <- c(2,4,6,8,10)
print("Este loop calcula el cuadrado de los elementos del vector w")
for(i in 1:length(w) ) {
  w.sq <- w[i]**2
  print(w.sq)
}

# Los bucles WHILE comienzan comprobando una condici�n. Si esta es verdadera, entonces se entra al cuerpo del bucle. Una vez completada una ejecuci�n de este bloque, se comprueba la condici�n nuevamente y as� sucesivamente hasta que la comprobaci�n de la condici�n de falso.

# while(<condicion>) {
#                     c�digo
#                     ...
#             }

# Ejemplo:

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

# Pseudoc�digo para IF - ELSE

# if(<condicion>) {
## bloque de c�digo
# }

## Continua con el resto del c�digo

# if(<condicion>){
## bloque de c�digo
#               } else {
## otro bloque de c�digo
#                      }

# if(<condition1>) {
## bloque de c�digo
#                 } else if(<condicion2>) {
## otro bloque de c�digo
#                                        } else {
## otro bloque de c�digo
#                                               }

# Ejemplo

(x <- runif(1, 0, 10)) ## creamos un n�mero aleatorio entre 0 y 10

if(x > 5) {
  y <- TRUE
  print(paste(y, ", x=", round(x,2) ,"> 5"))
} else {
  y <- FALSE
  print(paste(y, ", x=", round(x,2) ,"> 5"))
}



# De este modo estamos asignando un valor a una variable en funci�n del valor de otra. Lo que se debe tener en cuenta es que la condici�n debe retornar un valor TRUE o FALSE.