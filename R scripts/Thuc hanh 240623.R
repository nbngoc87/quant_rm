2+2


3^2

sqrt(25)

8^(1/3)
# install.packages('ggplot2')
library(ggplot2)

rnorm(100, 20, 5)

hist(rnorm(100, 20, 5))
x <- 2+3


?sqrt

?rnorm



x +2
x^2


id <- 1:6
gender <- rep(c("F", "M"), each = 3)
age <- rep(8, 6)

students <- cbind.data.frame(id, gender, age)

id <- 1:6
math <- c(9, 6, 7, 8, 10, 5)
english <- c(8, 5, 9, 8, 9, 7)
results <- cbind.data.frame(id, math, english)



load("Data/1 Raw/ntl_joined_avg.Rdata")
write.table(ntl_joined_avg, "clipboard", sep = "\t", row.names = F)


env <- read.csv("Data/1 Raw/Dataset_environmental_sustainability.csv",
                sep = ",", header = T)


data("mtcars")

hist(mtcars$mpg)

library(ggplot2)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "white", color = "black") +
  theme_bw()

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(aes(y = ..density..), binwidth = 2, fill = "white", color = "black") +
  geom_density(linewidth = 1) +
  theme_bw()

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(aes(y = ..density..), binwidth = 2, fill = "white", color = "grey50") +
  geom_density(linewidth = 1) +
  geom_vline(xintercept = 19.20, color = "green", linewidth = 1) +
  geom_vline(xintercept = 20.09, color = "blue", linewidth = 1) +
  geom_vline(xintercept = c(15.43, 22.8), color = "purple", linewidth = 1) +
  theme_bw()
mean(mtcars$mpg)



table(mtcars$cyl)

prop.table(table(mtcars$cyl))

table(mtcars$am)
prop.table(table(mtcars$am))


ggplot(mtcars, aes(x = am)) +
  geom_bar(fill = "lightblue", color = "grey50") +
  theme_bw()

mtcars$am_f <- factor(mtcars$am)


ggplot(mtcars, aes(x = am_f)) +
  geom_bar(fill = "lightblue", color = "grey50") +
  theme_bw()

mtcars$am_f <- factor(mtcars$am, labels = c("auto", "manual"))


ggplot(mtcars, aes(x = am_f)) +
  geom_bar(fill = "lightblue", color = "grey50") +
  theme_bw()

ggplot(mtcars, aes(x = am_f)) +
  geom_bar(fill = "lightblue", color = "grey50") +
  theme_bw() +
  labs(x = "Transmission", y = "Count")


ggplot(mtcars, aes(x = am_f, y = mpg)) +
  geom_bar(stat = "summary", fun = "mean", fill = "lightblue", color = "grey50") +
  theme_bw() +
  labs(x = "Transmission", y = "Miles/gallon")

install.packages("tidyverse")
library(tidyverse)


mpg_am <- mtcars %>%
  group_by(am_f) %>%
  summarise(mpg_mean = mean(mpg),
            mpg_sd = sd(mpg),
            mpg_min = min(mpg),
            mpg_max = max(mpg),
            mpg_q1 = quantile(mpg, 0.25),
            mpg_median = median(mpg),
            mpg_q3 = quantile(mpg, 0.75))

ggplot(mpg_am, aes(x = am_f, y = mpg_mean)) +
  geom_point(size = 3, shape = 18) +
  geom_errorbar(aes(ymin = mpg_mean - mpg_sd, ymax = mpg_mean + mpg_sd), width = 0.2) +
  theme_bw() +
  labs(x = "Transmission", y = "Miles/gallon")

ggplot(mtcars, aes(x = am_f, y = mpg)) +
  geom_boxplot() +
  theme_bw() +
  labs(x = "Transmission", y = "Miles/gallon")

ggplot(mpg_am, aes(x = am_f, y = mpg_mean)) +
  geom_point(size = 3, shape = 18) +
  geom_errorbar(aes(ymin = mpg_mean - mpg_sd, ymax = mpg_mean + mpg_sd), width = 0.2) +
  theme_bw() +
  labs(x = "Transmission", y = "Miles/gallon")

ggplot(mtcars, aes(x = am_f, y = mpg)) +
  geom_boxplot() +
  theme_bw() +
  labs(x = "Transmission", y = "Miles/gallon")


ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_bw() +
  labs(x = "Weight (1000 lbs)", y = "Miles/gallon")


ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  theme_bw() +
  labs(x = "Weight (1000 lbs)", y = "Miles/gallon")


cor(mtcars$wt, mtcars$mpg)
cor.test(mtcars$wt, mtcars$mpg)



table(mtcars$cyl, mtcars$am_f)
prop.table(table(mtcars$cyl, mtcars$am_f), 1)
prop.table(table(mtcars$cyl, mtcars$am_f), 2)


ggplot(mtcars, aes(x = am_f, fill = cyl, group = cyl)) +
  geom_bar() +
  theme_bw() +
  labs(x = "Transmission", y = "Count", fill = "Number of cylinders")


mtcars$cyl_f <- factor(mtcars$cyl)

ggplot(mtcars, aes(x = am_f, fill = cyl_f, group = cyl)) +
  geom_bar() +
  theme_bw() +
  labs(x = "Transmission", y = "Count", fill = "Number of cylinders")

ggplot(mtcars, aes(x = am_f, fill = cyl_f, group = cyl)) +
  geom_bar(position = "fill") +
  theme_bw() +
  labs(x = "Transmission", y = "Proportion", fill = "Number of cylinders")


ggplot(mtcars, aes(x = wt, y = mpg, col = am_f)) +
  geom_point()  +
  theme_bw() +
  labs(x = "Weight (1000 lbs)", y = "Miles/gallon", col = "Transmission")

ggplot(mtcars, aes(x = wt, y = mpg, col = am_f)) +
  geom_point()  +
  geom_smooth(method = "lm", se = F) +
  theme_bw() +
  labs(x = "Weight (1000 lbs)", y = "Miles/gallon", col = "Transmission")

ggplot(mtcars, aes(x = wt, y = mpg, col = am_f)) +
  geom_point()   +
  facet_grid(.~cyl_f, labeller = labeller(.cols = label_both)) +
  theme_bw() +
  labs(x = "Weight (1000 lbs)", y = "Miles/gallon", col = "Transmission")



fit1 <- lm(mpg ~ am_f, mtcars)
summary(fit1)

fit2 <- lm(mpg ~ wt, mtcars)
summary(fit2)

fit3 <- lm(mpg ~ am_f + wt, mtcars)
summary(fit3)

fit4 <- lm(mpg ~ wt + I(wt^2), mtcars)
summary(fit4)


AIC(fit2)
AIC(fit3)
AIC(fit4)

anova(fit3, fit2)
anova(fit4, fit2)



# install.packages("lavaan")
library(lavaan)


round(cor(env[,9:20], method = "spearman"),2)


# att_bhv <- env[,9:20]


model1 <- '
  att =~ Q1 + Q2 + Q3 + Q4 + Q5 + Q6 + Q7
  bhv =~ Q8 + Q9 + Q10 + Q11 + Q12
'

cfa_result <- cfa(model1, data = env, std.lv=TRUE)
summary(cfa_result, fit.measures = T, standardized = T)



# install.packages("psych")
library(psych)

att_bhv_sc <- scale(att_bhv)

fa <- fa(r = att_bhv_sc, nfactors = 2)
summary(fa)
fa$loadings



model2 <- '
  att =~ Q1 + Q3 + Q4 + Q5 + Q7
  bhv =~ Q8 + Q9 + Q11 + Q12
'

cfa_result <- cfa(model2, data = env, std.lv=TRUE)
summary(cfa_result, fit.measures = T, standardized = T)

model3 <- '
  att =~ Q1 + Q3 + Q5 
  bhv =~ Q8 + Q9 + Q10 + Q11 + Q12
'

cfa_result <- cfa(model3, data = env, std.lv=TRUE)
summary(cfa_result, fit.measures = T, standardized = T)

