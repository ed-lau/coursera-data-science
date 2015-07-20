###Question 1
library(datasets)
data(iris)
x <- split(iris[,1:4],iris$Species)
apply(x$virginica[,1:4],2,mean)

###Question 2
apply(iris,2,mean)


#Question 3
library(datasets)
data(mtcars)
tapply(mtcars$mpg,mtcars$cyl,mean)


# Question 4
tapply(mtcars$hp,mtcars$cyl,mean)
