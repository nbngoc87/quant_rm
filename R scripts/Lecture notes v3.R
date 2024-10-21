# install.packages("ggplot2")
library(ggplot2)

# install.packages("scico")
library(scico)

# install.packages("dplyr")
library(dplyr)


set.seed(1712)

water <- read.csv("C:/Users/nbngo/OneDrive/PhD/wal-water/data/processed/utilities_survey_Aquawal_CEHD_Wal/surv14_obs_AquaWal_prd.csv")

water <- water[, c("id", "csmptv", "rwtank", "iceqac2", "hhs_tot", "cfdiwq", "livara")]

water <- water[complete.cases(water),]

smp_id <- sample(water$id, 20)

water_sub <- water[water$id %in% smp_id,]

water <- water[water$csmptv < 130,]

summary(water_sub)

table(water_sub$hhs_tot)

summary(water_sub$csmptv[water_sub$rwtank %in% "yes"])
summary(water_sub$csmptv[water_sub$rwtank %in% "no"])

cor.test(water_sub$csmptv, water_sub$livara)

summary(lm(csmptv ~ rwtank + livara, water))

summary(water$livara)

ggplot(water_sub, aes(x  = csmptv)) +
  geom_point(aes(x = csmptv, y = 0)) + 
  theme_bw() + 
  ylim(0, 450) + 
  labs(x = "water consumption", y = "count")

ggplot(water, aes(x  = csmptv)) + 
  geom_point(aes(x = csmptv, y = 0)) + 
  theme_bw() + 
  ylim(0, 450) + 
  labs(x = "water consumption", y = "count")


ggplot(water, aes(x  = csmptv))  + 
  geom_histogram(binwidth = 20, fill = "white", color = "black") + 
  geom_point(aes(x = csmptv, y = 0)) + 
  theme_bw() + 
  ylim(0, 450) + 
  labs(x = "water consumption", y = "count")

ggplot(water, aes(x  = csmptv))  + 
  geom_histogram(aes(y=..density..), binwidth = 20, fill = "white", color = "black") + 
  geom_density(size = 1, adjust = 2) + 
  geom_point(aes(x = csmptv, y = 0)) + 
  theme_bw() + ylim(0, 0.015) + 
  labs(x = "water consumption", "density")



mean(water$csmptv)
median(water$csmptv)


ggplot(water, aes(x  = csmptv)) + 
  geom_density(size = 1, adjust = 2) +
  geom_segment(aes(x = 51 , y = 0.0025, xend = 51, yend = 0.011), size = 1, color = "#FF0000")+
  geom_segment(aes(x = 59.69 , y = 0.0025, xend = 59.69, yend = 0.01075), size = 1, color = "#009900") +
  geom_segment(aes(x = 56.74 , y = 0.0025, xend = 56.74, yend = 0.0109), size = 1, color = "#0066FF")+
  geom_point(aes(x = csmptv, y = 0)) + 
  theme_bw() + ylim(0, 0.015) + 
  labs(x = "water consumption", y = "density")



df <-data.frame(loc = rep(c("A", "B"), each = 1000) , temp = c(rnorm(1000, 25, 15), rnorm(1000, 25, 3))) 
gr_df <- df %>%
  group_by(loc) %>%
  summarise(mean = mean(temp),
            sd = sd(temp),
            min = min(temp),
            max = max(temp))
gr_df$temp <- gr_df$mean

gr_df$range_y <- c(-0.015, -0.01)
gr_df$sd_y <- c(-0.025, -0.02)

ggplot(df) + 
  geom_density(aes(x  = temp, color = loc), size = 1, adjust = 2) +
  geom_segment(aes(x = 25 , y = 0, xend = 25, yend = 0.118), size = 1, color = "black") +
  geom_point(aes(x  = temp, y = -0.005, color = loc)) + 
  theme_bw() + 
  labs(x = "Temperature (Celsius)", y = "Density", color = "Location") +
  scale_color_scico_d(palette = "batlow", end = 0.7, begin = 0.3) +
  geom_errorbarh(data = gr_df, aes(xmin = min, xmax = max, colour = loc, y = range_y), height = 0.0015, linewidth = 1) +
  geom_point(data = gr_df, aes(x = 25, y = sd_y, color = loc)) +
  geom_errorbarh(data = gr_df, aes(xmin = 25- sd, xmax = 25 + sd, colour = loc, y = sd_y), height = 0.0015, linewidth = 1)


+
  geom_errorbarh(data = gr_df, aes(xmin = min, xmax = max, colour = x, y = y2), height = 0.001, linewidth = 1)

ggplot() +  geom_errorbarh(data = gr_df, aes(xmin = min, xmax = max, colour = x, y = -0.008))
ggplot(df, aes(x = y, color = x)) +
  geom_density(linewidth = 1, adjust = 2)


### older versions -------------

ggplot(water_sub, aes(x  = csmptv)) + geom_density(size = 1, adjust = 2) + geom_point(aes(x = csmptv, y = 0)) + theme_bw() + ylim(0, 0.015) + scale_color_scico_d(palette = "batlow", end = 0.7, begin = 0.3)

ggplot(water, aes(x  = csmptv, color = rwtank)) + geom_density(size = 1, adjust = 2) + geom_point(aes(x = csmptv, y = 0)) + theme_bw() + ylim(0, 0.015) + scale_color_scico_d(palette = "batlow", end = 0.7, begin = 0.3)

scico_palette_show()

write.table(water_sub, "clipboard", sep = "\t")

install.packages("feather")
library("feather")

test <- read.csv("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/Pantheon/database.csv")




summary(lm(historical_popularity_index ~ article_languages, test))

plot(test$average_views, test$article_languages)

plot(test$birth_year, test$historical_popularity_index)
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

