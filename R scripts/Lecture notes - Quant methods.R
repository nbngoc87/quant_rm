data("airquality")
library(ggplot2)
head(airquality)
# install.packages("ggpubr")
library(scico)
library(ggpubr)
load("C:/Users/nbngo/OneDrive/Work/Course - Quant methods/Data - Quant methods/ntl_joined_avg.Rdata")
env_surv <- read.csv("C:/Users/nbngo/OneDrive/Work/Course - Quant methods/Data - Quant methods/Dataset_environmental_sustainability.csv")[,c(4:7, 9:28)]


water <- read.csv("C:/Users/nbngo/OneDrive/Work/[C] Quantitative research methods/quant_rm/Data/water consumption.csv")

water <- water[complete.cases(water$csmptv),]
t.test(water$csmptv[water$rwtank %in% "yes"], water$csmptv[water$rwtank %in% "no"])

ggplot(ntl_joined_avg,aes(x = avg_air_temp_adjusted, y = avg_ice_duration)) +
  geom_point()  + 
  theme_bw()


ggplot(ntl_joined_avg,aes(x = avg_air_temp_adjusted, y = avg_ice_duration)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) + 
  stat_cor(method = "pearson", label.x = -1, label.y = 140) + 
  theme_bw()

ggplot(ntl_joined_avg,aes(x = avg_air_temp_adjusted, y = avg_ice_duration)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  stat_regline_equation(label.x = -1, label.y = 140)+ 
  theme_bw()

ggplot(env_surv,aes(x = Q1, y = Q2)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) + 
  stat_cor(method = "spearman", label.x = 1, label.y = 6) + 
  theme_bw()

colnames(ntl_joined_avg)
data <- as.data.frame(table(env_surv$Year))

data$prop <- data$Freq*100/sum(data$Freq)
ggplot(data, aes(x="", y=prop, fill=Var1)) +
  geom_bar(stat="identity", width=1)+
  scale_fill_scico_d(palette = "batlow", end = 0.8) +
  coord_polar("y", start=0)+
  labs(fill = "Year")  +
  theme_void()
library(dplyr)
set.seed(2611)
df <-data.frame(x = rep(c("A", "B"), each = 20) , y= c(rnorm(20, 20, 10), rnorm(20, 20, 20))) 
gr_df <- df %>%
  group_by(x) %>%
  summarise(mean = mean(y),
            sd = sd(y))

ggplot(df, aes(x, y)) +
  geom_jitter(col =  scico(1, palette = "batlow", begin = 0.8), size = 2) +
  stat_summary(fun = mean, geom = "point", size = 5, fill = scico(1, palette = "batlow", begin = 0.2), shape = 23) +
  geom_errorbar(data = gr_df, aes(x = x, y = mean, ymin = mean - sd, ymax = mean + sd), width = 0.1, col = scico(1, palette = "batlow", begin = 0.2), size = 1)+
  theme_bw()

ggplot(df, aes(x, y))   +
  geom_jitter(col =  scico(1, palette = "batlow", begin = 0.8), size = 2)+ 
  geom_boxplot()+
  theme_bw()
fit <- lm(avg_ice_duration ~ avg_air_temp_adjusted, ntl_joined_avg)
plot(fit, ask = F)


ggplot(env_surv) +
  geom_bar(aes(x = Q2)) + theme_bw()

library(dplyr)
test <- env_surv %>%
  group_by(Q2) %>%
  summarise(count = n(),
            percent = n()*100/nrow(env_surv))

