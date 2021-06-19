amazon.best <- read.csv("bestsellers with categories.csv")

tAmazon <- t(amazon.best)

tAmazon.df <- as.data.frame(tAmazon)

View(tAmazon.df)

str(tAmazon.df)


