2+3

6-4

4^2

sqrt(36)


81^(1/3)


pi

log(exp(2))


log(exp(2))


mean(c(2,5,7))


# tôi đang cài package

# install.packages("ggplot2")

library(ggplot2)
library(car)


x <- 3+4
y = 6 - 5

y == 1

x == 13

x != y

x < y 
x > y
x >= y
x <= y 

is.na(x)

x == 7 & y == 4
x == 7 | y == 4

z <- NA 
is.na(y)

?sqrt


str(x)

a <- "hello"

str(a)

b <- x == 7

str(b)

str(x)

x <- 7L

str(x)

x + y


id <- c(1, 2, 3, 4, 5)
name <- c("Ninh", "Hanh", "Xuân", "Ngân", "Hồng")

note <- c(4, "OK", T, 3L)

# data frame
abc <- cbind.data.frame(id, name)

# list 

list_df <- list(predoc24, note, id, name)

# cách tạo vector

x <- c(1, 8, 23, -7, 13)
y <- 1:20
z <- seq(from = 3, to = 8, by = 0.2)
t <- rep("Female", 10)

x + 5

length(x)
sum(x)
mean(x)
min(x)
max(x)

id <- 1:6
gender <- rep(c("F", "M"), each = 3)
age <- rep(8, 6)
students <- cbind(id, gender, age)
students


students <- cbind.data.frame(id, gender, age)
students


summary(students)


id <- 1:6
math <- c(9, 6, 7, 8, 10, 5)
english <- c(8, 5, 9, 8, 9, 7)
results <- cbind.data.frame(id, math, english)


df <- merge(students, results)

sub1 <- df[1:3, 1:2]
sub1

sub2 <- df[, c(1, 4:5)]
sub2

sub3 <- df$gender

sub4 <- subset(df, math > 7, select = c(id, english))


df1 <- df[order(df$math), ]
df1




id <- 1:6
gender <- rep(c("F", "M"), each = 3)
age <- rep(8, 6)
students <- cbind(id, gender, age)
students


students <- cbind.data.frame(id, gender, age)
students


env <- read.delim('clipboard')



env_csv <- read.csv("C:/Users/nbngo/OneDrive/Teaching/ResearchMethods_G/quant_rm/Data/1 Raw/Dataset_environmental_sustainability.csv", sep = ",", header = T)

install.packages('readxl')
library(readxl)


env <- read_excel("C:/Users/nbngo/OneDrive/Teaching/ResearchMethods_G/quant_rm/Data/1 Raw/Dataset_environmental_sustainability.xlsx")

summary(env)


data("mtcars")
head(mtcars)

summary(mtcars)

sd(mtcars$mpg)

var(mtcars$mpg)

library(ggplot2)


ggplot(mtcars, aes(x = mpg)) + geom_histogram()


ggplot(mtcars, aes(x = mpg)) + geom_histogram(binwidth = 5) + theme_bw()

ggplot(mtcars, aes(x = mpg)) + geom_histogram(binwidth = 5) + theme_minimal()


ggplot(mtcars, aes(x = mpg)) + geom_histogram(aes(y = after_stat(density)), binwidth = 2, fill = "white", color = "black") + geom_density(linewidth = 1) + theme_bw()

ggplot(mtcars, aes(x = mpg)) + geom_histogram(aes(y = ..density..),
                                              binwidth = 2, fill = "white", color = "black") + geom_density(linewidth = 1) +
  theme_bw()


ggplot(mtcars, aes(x = am)) + geom_bar(fill = "lightblue", color = "grey50") +
  theme_bw()

mtcars$am_f <- factor(mtcars$am)

ggplot(mtcars, aes(x = am_f)) + geom_bar(fill = "lightblue",
                                         color = "grey50") + theme_bw()

mtcars$am_f <- factor(mtcars$am, labels = c("auto", "manual"))

ggplot(mtcars, aes(x = am_f)) + geom_bar(fill = "lightblue",
                                         color = "grey50") + theme_bw()



fit1 <- lm(mpg ~ am_f, mtcars)
summary(fit1)

fit2 <- lm(mpg ~ wt, mtcars)
summary(fit2)




fit3 <- lm(mpg ~ wt + am_f, mtcars)
summary(fit3)
