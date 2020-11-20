install.packages("readr")
install.packages("recommenderlab")
install.packages("Matrix")
install.packages("caTools")

library(readr)
library(recommenderlab)
library(Matrix)
library(caTools)

book <- read.csv("C:\\Users\\91755\\Desktop\\Assignment\\17 - Recomendation System\\books.csv")
attach(book_data)
View(book_data)
str(book_data)

#Based on Publishers and Rating
book1 <- book[-c(1, 3, 4)]
View(book1)
hist(book1$ratings...3.)

rating_matrix1 <- as(book1, "realRatingMatrix")

#Model Building
#Popularity Based
pop1 <- Recommender(rating_matrix1, method = "POPULAR")

#Prediction
rpop1 <- predict(pop1, rating_matrix1[1000:1005], n=5)
as(rpop1, "list")
View(rpop1)
summary(rpop1)

## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering
##User Based Collaborative Filtering

pop2 <- Recommender(rating_matrix1, method="UBCF")

#prediction
rpop2 <- predict(pop2, rating_matrix1[200:201], n=3) 
as(rpop2, "list")
View(rpop2)
summary(rpop2)

#Based on author and rating
book2 <- book[-c(1, 3, 5)]
View(book2)
hist(book2$ratings...3.)

rating_matrix2 <- as(book2, "realRatingMatrix")

#Model Building: Popularity Based
pop3 <- Recommender(rating_matrix2, method = "POPULAR")

#Prediction
rpop3 <- predict(pop3, rating_matrix2[415:416], n=5)
as(rpop3, "list")
View(rpop3)
summary(rpop3)

#Model Building: UBCF Method
pop4 <- Recommender(rating_matrix2, method="UBCF")

#Prediction
rpop4 <- predict(pop4, rating_matrix2[1000:1005], n=3)
as(rpop4)
View(rpop4)
summary(rpop4)
