
# Introduction ---------------
## R -----------------
# * Developed from S - interpreted language
# * mostly use in statistics and data analysis
# * free & open-source
# * extendable with packages and new functions
# * [https://cran.r-project.org/](https://cran.r-project.org/)

## RStudio ----------------
# * Interface
# * only work with R installed
# * free & open-source
# * start and save scripts
# * Ctrl+Enter to run
# * [http://rstudio.com/](http://rstudio.com/)





## Let's start with some simple calculations -----------



2+3

4^2

sqrt(25)

8^(1/3)

pi
exp(1)

log(exp(2))
log10(100)




## Packages & Functions ----------------

# * packages add additional functions
# * packages need to be installed once 
# * sometime will need to be installed again after update
# * load before every run

# huong dan cai packages

install.packages("ggplot2")
library(ggplot2)




# * functions receive arguments => return results



rnorm(50, mean = 160, sd = 20) # random normal
x <- rnorm(50, mean = 160, sd = 20) 
hist(rnorm(50, mean = 160, sd = 20))
hist(x)


## Operators -------------



x <- 2+3

x
y = 6-5

x == 3
x == 5
y != 2
x < 0
y < 4
x >= 5
y <= 10


is.na(x)

x < 0 & y < 4

x < 0 | y < 4



## Getting help ----------------


?sqrt

?rnorm


a + 3
a <- 2
a + 3
b <- 2L


 
# Data --------------
## Data types -------------

# * numeric: e.g. `1`, `45.3`
# * integer: e.g. `2L`, `53L`
# * logical: e.g. `TRUE`, `T`, `FALSE`, `F`
# * character: e.g. `"orange"`, `"female"`, `"Totally agree"`


## Data structure ------------

# * Vectors
# * Matrix
# * Data frame
# * List

### Vectors ----------------
# * simplest type


x <- c(1, 8, 23, -7, 13)
z <- c(18,34, 67,23, 55)

y <- c("a", "b", "c", "d", "e")
y




# * same type of data



a <- c(1, "a", 3L, T)
a 
str(a)
str(x)
str(y)

b = c(1L, 8L, 23L, -7L, 13L)
str(b)



# * creating vector 



x <- c(1, 8, 23, -7, 13)
x <- 1:20
y <- seq(from = 8, to = 12, by = 0.5) # sequence
y

z <- rep("Female", 10) #repeat
z


# * Vectorization



x <- c(3, 7, 6, 3, 5, 2)
x + 1
x*2
sqrt(x)




# * logical vector



x <- c(18,34, 67,23, 55)
z <- x > 30
z


y <- c("a", "b", "a", "d", "e")

t <- y == "A"
t
t <- y == "a"
t



# * useful functions for vectors



x
length(x)
sum(x)
max(x)
min(x)
sort(x)
order(x, decreasing = F)
unique(x)

x <- c(x, 23)

mean(x)
sd(x)

y <- c(23, 22, 18, 19, 20, 22)
sd(y)



y <- c("Fr", "En", "Ge", "USA", "Jp", "Ge")
y
length(y)
unique(y)






# * subset vector


x
x[1]
x[3:5]
x[c(1,3:5)]

x[-2]


x[x >= 30]


v <- 3
v[1]
length(v)
mean(v)


### Matrices ------------

# * same type of data
# * columns & rows

a <- c(1:4)
b <- c(5:8)


x <- rbind(a, b)
x
dim(x)
dimnames(x)
attributes(x)

x <- cbind(a, b)
attributes(x)

x <- matrix(1:8, nrow = 2, ncol = 4, byrow = T)
x
x <- matrix(1:8, nrow = 2, ncol = 4, byrow = F)
x



### Data frame -------------

# * extension of matrix
# * columns of different data type

id <- 1:6
gender <- rep(c("F", "M"), each = 3)
age <- rep(8, 6)

students <- cbind(id, gender, age) # column bind
students
str(students)
summary(students)

students <- cbind.data.frame(id, gender, age)
students
str(students) # string
summary(students)

id <- 1:6
math <- c(9, 6, 7, 8, 10, 5)
english <- c(8, 5, 9, 8, 9, 7)

results <- cbind.data.frame(id, math, english)


summary(results)


df <- merge(students, results)
df


# * subset data frame



sub1 <- df[1:3, 1:2]
sub1

sub2 <- df[, c(1, 4:5)]
sub2

sub2b <- df[3:4,]
sub2b

sub3 <- df$math
sub3

sub4 <- subset(df, math > 7, select = c(id, math, english))
sub4

sub5 <- subset(df, english <= 7, select = -age)
sub5


# * reorder the data frame



df1 <- df[order(df$math),]
df1 




### List ----------------

# * contain different type of data
# * can contain data frame

cls1 <- data.frame(id = 1:5, names = c("Lan", "Hung", "Tuan", "Mai", "Long"))
cls2 <- data.frame(id = 6:10, names = c("Thanh", "Son", "Nghia", "Hanh", "Thuy"))

ls <- list(classA = cls1, classB = cls2)
ls



# * subset list


ls[1]
ls[[1]]

ls$classA


str(ls[[1]])

## Import data ---------------

# * Direct typing
# * From clipboard


df <- read.delim("clipboard")


# * From csv 
# "C:\Users\nbngo\OneDrive\Work\[C]_ResearchMethods\quant_rm\Data - Quant Methods\Dataset_environmental_sustainability.csv"


data_env <- read.csv("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/Dataset_environmental_sustainability.csv", sep = ",", header = T)


# * From xlsx


install.packages("readxl")
library(readxl)

df2 <- read_excel("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/Dataset_environmental_sustainability.xlsx")



# * From Rdata


load("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/ntl_joined_avg.Rdata")




## Export data -----------

# * as Rdata


save(data_env, file = "C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/environment_survey.Rdata")




# * to clipboard

write.table(df, "clipboard", sep = "\t", row.names = F)

df_sub <- df[1:20, ]
write.table(df_sub, "clipboard", sep = "\t", row.names = F)


# * to csv

write.csv(ntl_joined_avg, file = "C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/ice_cover_lake.csv", row.names = F)



# Exploring and plotting data -------------
## Data --------------
# * mtcars data in R

data <- mtcars

head(mtcars)


# * [explaining variables](https://rstudio-pubs-static.s3.amazonaws.com/61800_faea93548c6b49cc91cd0c5ef5059894.html)
# 
# * summary() gives overall information of the data


summary(data)


## Numerical/continuous (ratio/interval) variables ---------


summary(data$mpg)

mean(data$mpg)
median(data$mpg)

sd(data$mpg) # độ lệch chuẩn
var(data$mpg) # phương sai
quantile(data$mpg, seq(0, 1, 0.2)) 

hist(data$mpg)
# install.packages("ggplot2")
library(ggplot2)



ggplot(data, aes(x = mpg)) +
  geom_histogram()

ggplot(data, aes(x = mpg)) +
  geom_histogram(binwidth = 5)

ggplot(data, aes(x = mpg)) +
  geom_histogram(binwidth = 5) +
  theme_bw()

??theme_bw

ggplot(data, aes(x = wt)) +
  geom_histogram(binwidth = 2) +
  theme_bw()


## Character/Factor (Nominal/Ordinary/Categorical) -----------


table(data$cyl)



prop.table(table(data$cyl))

table(data$am)
prop.table(table(data$am))


ggplot(data, aes(x = am)) +
  geom_bar() +
  theme_bw()

data$am_f <- factor(data$am)


ggplot(data, aes(x = am_f)) +
  geom_bar() +
  theme_bw()

data$am_f <- factor(data$am, labels = c("auto", "manual"))


ggplot(data, aes(x = am_f)) +
  geom_bar() +
  theme_bw()




## Bivariate  ---------------
# * continuous & discrete



ggplot(data, aes(x = am_f, y = mpg)) +
  geom_bar(stat = "summary", fun = "mean") +
  theme_bw()

ggplot(data, aes(x = am_f, y = mpg)) +
  geom_bar(stat = "summary", fun = "mean", fill = "lightblue") +
  theme_bw()

ggplot(data, aes(x = am_f, y = mpg)) +
  geom_boxplot() +
  theme_bw()


install.packages("dplyr")
library("dplyr")

data %>%
  group_by(am_f) %>%
  summarize(mean = mean(mpg),
            sd = sd(mpg),
            min = min(mpg),
            q1 = quantile(mpg, 0.25),
            median = median(mpg),
            q3 = quantile(mpg, 0.75),
            max = max(mpg))




# * Continuous & continuous



ggplot(data, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_bw()


ggplot(data, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_bw()


ggplot(data, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red", se = F) +
  theme_bw()


cor(data$wt, data$mpg)
cor.test(data$wt, data$mpg)


# * Discrete & discrete



table(data$cyl, data$am_f)


ggplot(data, aes(x = am_f, fill = cyl, group = cyl)) +
  geom_bar() +
  theme_bw()


data$cyl_f <- factor(data$cyl)

ggplot(data, aes(x = am_f, fill = cyl_f, group = cyl)) +
  geom_bar() +
  theme_bw()

ggplot(data, aes(x = am_f, fill = cyl_f, group = cyl)) +
  geom_bar(position = "dodge") +
  theme_bw()



## Add dimension -----------




ggplot(data, aes(x = wt, y = mpg, col = cyl_f)) +
  geom_point()  +
  theme_bw()

ggplot(data, aes(x = wt, y = mpg, col = cyl_f)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)  +
  theme_bw()

ggplot(data, aes(x = wt, y = mpg, col = cyl_f)) +
  geom_point() +
  facet_grid(.~am_f) +
  theme_bw()




# Linear regression --------------

## Compare means --------------




fit1 <- lm(mpg ~ am_f, data)
summary(fit1)

fit2 <- lm(mpg ~ cyl_f, data)
summary(fit2)



## Simple linear regression -------------




fit3 <- lm(mpg ~ wt, data)
summary(fit3)



## Multiple linear regression ------------




fit4 <- lm(mpg ~ wt + cyl_f + am_f, data)
summary(fit4)

fit5 <- lm(mpg ~ wt + cyl_f , data)
summary(fit5)

AIC(fit4)
AIC(fit5)

anova(fit4, fit5)
anova(fit5, fit3)

# plot(fit5, ask = F)


