netflix <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-01/Data/netflix_titles.csv")
dim(netflix)
str(netflix)


net.2015 <- netflix[netflix$release_year>2015,]
View(net.2015)

write.csv(net.2015,file="res.netflix.csv", fileEncoding="UTF-8")
