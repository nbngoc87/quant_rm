library(ggplot2)
library(scico)

# install.packages("dplyr")
library(dplyr)

# install.packages("forcats") 
library(forcats)
set.seed(2611)

r1 = 0.6

r2 = 0

r3 = 0.99


visitors <- round(rnorm(200, mean = 152, sd = 80))
visitors <- visitors[visitors > 0 & visitors < 350] 
min(visitors)
max(visitors)


budget <- round(8.15 + 0.66* (r1*visitors + sqrt(1 - r1^2) * rnorm(length(visitors), mean(visitors), sd(visitors))))

min(budget)
max(budget)


events <- round(0.03* (r2*visitors + sqrt(1 - r2^2) * rnorm(length(visitors), mean(visitors), sd(visitors))))


cor.test(events, visitors)



level.n <-  r3*visitors + sqrt(1 - r3^2) * rnorm(length(visitors), mean(visitors), sd(visitors))

min(level.n)
max(level.n)

level.p <- (level.n - min(level.n))/(max(level.n) - min(level.n))



level <- ifelse(level.p < 0.5, "Provincial", ifelse(level.p > 0.8, "National-Special", "National"))
level <- factor(level, level = c("Provincial", "National", "National-Special"))
table(level)


cat.c <- c("Historical Monument", "Cultural Center", "Museum", "Archaeological Site") 

cat.p <- c(0.4, 0.1, 0.3, 0.2) 

category <- sample(cat.c, length(visitors), replace = TRUE, prob = cat.p) 

site <- 1:length(visitors)
df <- data.frame(site, visitors, budget, events, level, category)


write.table(df, "clipboard", sep = "\t", row.names = F)

prop.table(table(df$category))

summary(lm(visitors ~ budget, df))
summary(lm(visitors ~ events, df))
summary(lm(visitors ~ level, df))
summary(lm(visitors ~ category, df))
summary(lm(visitors ~ budget + level, df))
anova(lm(visitors ~ budget + level, df))


ggplot(df, aes(x = visitors)) + geom_histogram(binwidth = 20) + theme_bw()

v.mean <- mean(df$visitors)
v.median <- median(df$visitors)
v.min <- min(df$visitors)
v.max <- max(df$visitors)
v.q1 <- quantile(df$visitors, 0.25)
v.q3 <- quantile(df$visitors, 0.75)
v.sd <- sd(df$visitors)
v.sd^2


ggplot(df, aes(x = visitors)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(v.min, v.max) +
  geom_segment(aes(x = 142 , y = 0, xend = 142, yend = 0.00404), size = 1, color = "#FF0000") +
  geom_segment(aes(x = v.median , y = 0, xend = v.median, yend =0.004), size = 1, color = "#00B0A0") +
  geom_segment(aes(x = v.mean , y = 0, xend = v.mean, yend = 0.00399), size = 1, color = "#00B0A0")+ 
  theme_bw() + 
  labs(x = "Visitors (thousand/year)", y = "density")



ggplot(df, aes(x = visitors)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(v.min, v.max) +
  geom_errorbarh(aes(xmin = v.min, xmax = v.max, y = 0), height = 0.0005, linewidth = 1) + 
  theme_bw()  + 
  labs(x = "Visitors (thousand/year)", y = "density")

ggplot(df, aes(x = visitors)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(v.min, v.max) +
  geom_segment(aes(x = v.mean , y = 0, xend = v.mean, yend = 0.004), size = 1, color = "#00B0F0") +
  geom_errorbarh(aes(xmin = v.min, xmax = v.max, y = 0), height = 0.0005, linewidth = 1)  +
  geom_point(aes(x = v.mean, y = 0.0005), size = 5, color = "#00B0F0") +
  geom_errorbarh(aes(xmin = v.mean - v.sd, xmax = v.mean + v.sd, y = 0.0005), height = 0.0005, linewidth = 1) + 
  theme_bw()  + 
  labs(x = "Visitors (thousand/year)", y = "density")


ggplot(df, aes(x = visitors)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(v.min, v.max)  +
  geom_segment(aes(x = v.median , y = 0, xend = v.median, yend =0.004), size = 1, color = "#00B050") +
  geom_segment(aes(x = v.q1 , y = 0, xend = v.q1, yend =0.0037), size = 1, color = "#7030A0") +
  geom_segment(aes(x = v.q3 , y = 0, xend = v.q3, yend =0.0034), size = 1, color = "#7030A0") + 
  theme_bw()+ 
  labs(x = "Visitors (thousand/year)", y = "density")

df$category <- fct_infreq(df$category)
table(df$category)
prop.table(table(df$category))

ggplot(df, aes(x = factor(1), fill = factor(category))) +
  geom_bar(stat="count") +
  theme_void()+
  coord_polar("y", start=0, direction = -1) +
  labs(fill = "Category") +
  scale_fill_scico_d(palette = "batlow", end = 0.7, begin = 0.3)



table(df$level)

prop.table(table(df$level))



ggplot(df, aes(x = level)) +
  geom_bar(stat = "count") + 
  theme_bw() + 
  labs(x = "Level", y = "Count")

ggplot(df, aes(x = budget, y = visitors, color = level)) + geom_point() + theme_bw()



vs_lvl <- df %>%
  group_by(level) %>%
  summarise(mean = mean(visitors),
            sd = sd(visitors))


ggplot(df, aes(x = level, y = visitors)) +
  geom_bar(stat = "summary", fun = "mean") + 
  theme_bw() +
  labs(x = "", y = "Visitors (thousand/year)") + 
  coord_cartesian(ylim=c(80,310)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(df, aes(x = level, y = visitors))  +
  geom_bar(stat = "summary", fun = "mean") + 
  theme_bw() +
  labs(x = "", y = "Visitors (thousand/year)") + 
  coord_cartesian(ylim=c(0, 310)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(vs_lvl, aes(x = level, y = mean)) +
  geom_point(size = 3) + 
  geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), linewidth = 1, width = 0.2) +
  theme_bw() +
  labs(x = "", y = "Visitors (thousand/year)") + 
  coord_cartesian(ylim=c(0, 370)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


ggplot(df, aes(x = level, y = visitors)) +
  geom_boxplot() + 
  theme_bw() +
  labs(x = "", y = "Visitors (thousand/year)")+ 
  coord_cartesian(ylim=c(0, 370)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


ggplot(df, aes(x = budget, y = visitors)) + geom_point() + theme_bw()+
  labs(x = "Budget (thousand USD/year)", y = "Visitors (thousand/year)") 



cor.test(budget, visitors)

vs_cat <- df %>%
  group_by(category) %>%
  summarise(mean = mean(visitors),
            sd = sd(visitors))

t.test(df$visitors[df$category %in% "Museum"], df$visitors[df$category %in% "Cultural Center"], alternative = "greater")

ggplot(df, aes(x = budget, y = visitors)) + geom_point() + theme_bw()+
  labs(x = "Budget (thousand USD/year)", y = "Visitors (thousand/year)") + stat_smooth(method = "lm", se = F)

fit1 <- lm(visitors ~ budget, df)
summary(fit1)

ggplot(df, aes(x = budget, y = visitors)) + geom_point() + theme_bw()+
  labs(x = "Budget (thousand USD/year)", y = "Visitors (thousand/year)") + stat_smooth(method = "lm", se = F)



ggplot(df, aes(x = budget, y = visitors, color = level)) + geom_point() + theme_bw()+
  labs(x = "Budget (thousand USD/year)", y = "Visitors (thousand/year)") 
fit2 <- lm(visitors ~ level, df)
summary(fit2)


fit3 <- lm(visitors ~ budget+level, df)
anova(fit3)
summary(fit3)
n <- 20
u1 <- seq(1,41, 2)
xstart <- 10
xdif <- 0.5
beta <- 0.3
nx <- 10
x <- rnorm(nx, xstart,5)
y <- u1[1] + x*beta + rnorm(nx,0, 0.2)

for(i in 2:n) {
  xnew <- rnorm(nx,(xstart - (i-1)*xdif), 5)
  ynew <- u1[i] + xnew*beta + rnorm(nx,0, 0.2)
  x <- c(x, xnew)
  y <- c(y, ynew)
}

ex<- data.frame(x = x, y = y, id = rep(1:n, each = nx)) 

ggplot(ex, aes(x = x, y = y)) + geom_point() + theme(legend.position = "none") + theme_bw()

ggplot(ex, aes(x = x, y = y)) + geom_point() + theme(legend.position = "none") + geom_smooth(method="lm", se = F) + theme_bw()


ggplot(ex, aes(x = x, y = y, color = factor(id))) + geom_point()  + geom_smooth(method="lm", se = F) + theme_bw()+ theme(legend.position = "none")


