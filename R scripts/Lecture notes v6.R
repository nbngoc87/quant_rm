# install.packages("ggplot2")
library(ggplot2)

# install.packages("scico")
library(scico)

# install.packages("dplyr")
library(dplyr)


set.seed(1712)

water <- read.csv("C:/Users/nbngo/OneDrive/PhD/wal-water/data/processed/utilities_survey_Aquawal_CEHD_Wal/surv14_obs_AquaWal_prd.csv")

water <- water[, c("id", "csmptv", "rwtank", "iceqac2", "hhs_tot", "cfdiwq", "livara")]

# water <- water[complete.cases(water),]
# 
# smp_id <- sample(water$id, 20)
# 
# water_sub <- water[water$id %in% smp_id,]
# 
# water <- water[water$csmptv < 130,]
# 
# summary(water_sub)
# 
# table(water_sub$hhs_tot)
# 
# summary(water_sub$csmptv[water_sub$rwtank %in% "yes"])
# summary(water_sub$csmptv[water_sub$rwtank %in% "no"])
# 
# cor.test(water_sub$csmptv, water_sub$livara)
# 
# summary(lm(csmptv ~ rwtank + livara, water))
# 
# summary(water$livara)
# 
# ggplot(water_sub, aes(x  = csmptv)) +
#   geom_point(aes(x = csmptv, y = 0)) + 
#   theme_bw() + 
#   ylim(0, 450) + 
#   labs(x = "water consumption", y = "count")
# 
# ggplot(water, aes(x  = csmptv)) + 
#   geom_point(aes(x = csmptv, y = 0)) + 
#   theme_bw() + 
#   ylim(0, 450) + 
#   labs(x = "water consumption", y = "count")
# 
# 
# ggplot(water, aes(x  = csmptv))  + 
#   geom_histogram(binwidth = 20, fill = "white", color = "black") + 
#   geom_point(aes(x = csmptv, y = 0)) + 
#   theme_bw() + 
#   ylim(0, 450) + 
#   labs(x = "water consumption", y = "count")
# 
# ggplot(water, aes(x  = csmptv))  + 
#   geom_histogram(aes(y=..density..), binwidth = 20, fill = "white", color = "black") + 
#   geom_density(size = 1, adjust = 2) + 
#   geom_point(aes(x = csmptv, y = 0)) + 
#   theme_bw() + ylim(0, 0.015) + 
#   labs(x = "water consumption", "density")

id <- c(137, 431, 655, 730, 780, 781, 1048, 1403, 1405, 1432, 1476, 1757, 2183, 2334, 2345, 2375, 2687, 2704, 2714, 2752)
water_20 <- water[water$id %in% id, c('id', "csmptv", "rwtank", "iceqac2")]


mean(water_20$csmptv)
min(water_20$csmptv)
max(water_20$csmptv)
median(water_20$csmptv)

ggplot(water_20, aes(x  = csmptv)) +
  geom_histogram(binwidth = 10)


ggplot(water_20, aes(x  = csmptv)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(16.23,139) +
  ylim(0, 0.008) +
  geom_segment(aes(x = 62 , y = 0, xend = 62, yend = 0.0074), size = 1, color = "#FF0000") +
  geom_segment(aes(x = 67.68 , y = 0, xend = 67.68, yend =0.00735), size = 1, color = "#00B050") +
  geom_segment(aes(x = 69.24 , y = 0, xend = 69.24, yend = 0.0073), size = 1, color = "#00B0F0")+ 
  theme_bw() + 
  labs(x = "water consumption", y = "density")

ggplot(water_20, aes(x  = csmptv)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(16.23,139) +
  ylim(0, 0.008) +
  geom_errorbarh(aes(xmin = 16.23, xmax = 139, y = 0.001), height = 0.0005, linewidth = 1) + 
  theme_bw() + 
  labs(x = "water consumption", y = "density")

ggplot(water_20, aes(x  = csmptv)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(16.23,139) +
  ylim(0, 0.008) +
  geom_segment(aes(x = 69.24 , y = 0, xend = 69.24, yend = 0.0073), size = 1, color = "#00B0F0") +
  geom_errorbarh(aes(xmin = 16.23, xmax = 139, y = 0.001), height = 0.0005, linewidth = 1)  +
  geom_point(aes(x = 69.24, y = 0.002), size = 5, color = "#00B0F0") +
  geom_errorbarh(aes(xmin = 32.01, xmax = 106.47, y = 0.002), height = 0.0005, linewidth = 1) + 
  theme_bw() + 
  labs(x = "water consumption", y = "density")

quantile(water_20$csmptv, c(0.25, 0.75))
ggplot(water_20, aes(x  = csmptv)) + 
  geom_density(size = 1, adjust = 2)  + 
  xlim(16.23,139) +
  ylim(0, 0.008) +
  geom_segment(aes(x = 67.68 , y = 0, xend = 67.68, yend =0.00735), size = 1, color = "#00B050") +
  geom_segment(aes(x = 32.83 , y = 0, xend = 32.83, yend =0.00637), size = 1, color = "#7030A0") +
  geom_segment(aes(x = 101.25 , y = 0, xend = 101.25, yend =0.006), size = 1, color = "#7030A0") + 
  theme_bw() + 
  labs(x = "water consumption", y = "density")

prop.table(table(water_20$rwtank))

ggplot(water_20, aes(x = factor(1), fill = factor(rwtank))) +
  geom_bar(stat="count") +
  theme_void()+
  coord_polar("y", start=0) +
  labs(fill = "Rainwater tank") +
  scale_fill_scico_d(palette = "batlow", end = 0.7, begin = 0.3)

prop.table(table(water_20$iceqac2))

water_20$iceqac2 <- factor(water_20$iceqac2, levels = levels(as.factor(water_20$iceqac2))[c(4, 3, 1, 2)])

ggplot(water_20, aes(x = iceqac2)) +
  geom_bar(stat = "count") + 
  theme_bw() + 
  labs(x = "Income", y = "Count")

wt_rwt <- water_20 %>%
  group_by(rwtank) %>%
  summarise(mean = mean(csmptv),
            sd = sd(csmptv))


ggplot(water_20, aes(x = rwtank, y = csmptv)) +
  geom_bar(stat = "summary", fun = "mean") + 
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(50,85))

ggplot(water_20, aes(x = rwtank, y = csmptv)) +
  geom_bar(stat = "summary", fun = "mean") + 
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(0, 150))

ggplot(wt_rwt, aes(x = rwtank, y = mean)) +
  geom_point(size = 5) + 
  geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), linewidth = 1, width = 0.08) +
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(0, 150))


ggplot(water_20, aes(x = rwtank, y = csmptv)) +
  geom_boxplot() + 
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(0, 150))
#######


69.24+37.23
ggplot(water, aes(x  = csmptv)) + 
  geom_density(size = 1, adjust = 2) +
  geom_segment(aes(x = 59.69 , y = 0.0025, xend = 59.69, yend = 0.01075), size = 1, color = "#009900") +
  geom_segment(aes(x = 56.74 , y = 0.0025, xend = 56.74, yend = 0.0109), size = 1, color = "#0066FF") +
  geom_segment(aes(x = 35.12 , y = 0.0025, xend = 35.12, yend = 0.01015), size = 1, color = "purple") +
  geom_segment(aes(x = 81.54 , y = 0.0025, xend = 81.54, yend = 0.0084), size = 1, color = "purple") +   theme_bw() + 
  labs(x = "water consumption", y = "density") +
  geom_errorbarh(aes(xmin = 0, xmax = 129.67, y = 0.001), height = 0.0005, linewidth = 1) +
  geom_point(aes(x = 59.69, y = -0.001), size = 3) +
  geom_errorbarh(aes(xmin = 28.87, xmax = 90.51, y = -0.001), height = 0.0005, linewidth = 1)


df <-data.frame(loc = rep(c("A", "B"), each = 1000) , temp = c(rnorm(1000, 25, 15), rnorm(1000, 25, 3))) 
gr_df <- df %>%
  group_by(loc) %>%
  summarise(mean = mean(temp),
            sd = sd(temp),
            min = min(temp),
            max = max(temp))
gr_df$temp <- gr_df$mean

gr_df$range_y <- c(-0.025, -0.015)
gr_df$sd_y <- c(-0.045, -0.035)

ggplot(df) + 
  geom_density(aes(x  = temp, color = loc), size = 1, adjust = 2) +
  geom_segment(aes(x = 25 , y = 0, xend = 25, yend = 0.113), size = 1, color = "black") +
  geom_point(aes(x  = temp, y = -0.005, color = loc)) + 
  theme_bw() + 
  labs(x = "Temperature (Celsius)", y = "Density", color = "Location") +
  scale_color_scico_d(palette = "batlow", end = 0.7, begin = 0.3) +
  geom_errorbarh(data = gr_df, aes(xmin = min, xmax = max, colour = loc, y = range_y), height = 0.0015, linewidth = 1) +
  geom_point(data = gr_df, aes(x = 25, y = sd_y, color = loc)) +
  geom_errorbarh(data = gr_df, aes(xmin = 25- sd, xmax = 25 + sd, colour = loc, y = sd_y), height = 0.0015, linewidth = 1)

mean(water$csmptv)
sd(water$csmptv)
min(water$csmptv)
max(water$csmptv)

ggplot(water, aes(x  = csmptv)) + 
  geom_density(size = 1, adjust = 2) +
  geom_segment(aes(x = 59.69 , y = 0.0025, xend = 59.69, yend = 0.01075), size = 1, color = "#009900") +
  geom_segment(aes(x = 56.74 , y = 0.0025, xend = 56.74, yend = 0.0109), size = 1, color = "#0066FF") +
  geom_segment(aes(x = 35.12 , y = 0.0025, xend = 35.12, yend = 0.01015), size = 1, color = "purple") +
  geom_segment(aes(x = 81.54 , y = 0.0025, xend = 81.54, yend = 0.0084), size = 1, color = "purple") +   theme_bw() + 
  labs(x = "water consumption", y = "density") +
  geom_errorbarh(aes(xmin = 0, xmax = 129.67, y = 0.001), height = 0.0005, linewidth = 1) +
  geom_point(aes(x = 59.69, y = -0.001), size = 3) +
  geom_errorbarh(aes(xmin = 28.87, xmax = 90.51, y = -0.001), height = 0.0005, linewidth = 1)

ggplot(water, aes(x = factor(1), fill = factor(rwtank))) +
  geom_bar(stat="count") +
  theme_void()+
  coord_polar("y", start=0) +
  labs(fill = "Rainwater tank") +
  scale_fill_scico_d(palette = "batlow", end = 0.7, begin = 0.3)

prop.table(table(water$iceqac2))

water$iceqac2 <- factor(water$iceqac2, levels = levels(as.factor(water$iceqac2))[c(4, 3, 1, 2)])

ggplot(water, aes(x = iceqac2)) +
  geom_bar(stat = "count") + 
  theme_bw() + 
  labs(x = "Income", y = "Count")

wt_rwt <- water %>%
  group_by(rwtank) %>%
  summarise(mean = mean(csmptv),
            sd = sd(csmptv))


ggplot(water, aes(x = rwtank, y = csmptv)) +
  geom_bar(stat = "summary", fun = "mean") + 
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(50,65))

ggplot(water, aes(x = rwtank, y = csmptv)) +
  geom_bar(stat = "summary", fun = "mean") + 
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(0, 130))

ggplot(wt_rwt, aes(x = rwtank, y = mean)) +
  geom_point(size = 5) + 
  geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), linewidth = 1, width = 0.08) +
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(0, 130))


ggplot(water, aes(x = rwtank, y = csmptv)) +
  geom_boxplot() + 
  theme_bw() +
  labs(x = "Rainwater tank", y = "Water consumption") + 
  coord_cartesian(ylim=c(0, 130))

rwt_inc <- as.data.frame(prop.table(table(water$iceqac2, water$rwtank), 2))


ggplot(rwt_inc, aes(x = Var2, y = Freq, fill = Var1)) +
  geom_col() + 
  theme_bw() +
  scale_fill_scico_d(palette = "batlow", begin = 0.3, end = 0.7) +
  labs(x = "Rainwater tank", y = "Percentage", fill = "Income")

write.table(as.data.frame(table(water$iceqac2, water$rwtank)), "clipboard", sep = "\t")

t.test(csmptv ~ rwtank, water)

summary(lm(csmptv ~ livara, water))
summary(lm(csmptv ~ rwtank, water))
summary(lm(csmptv ~ livara + rwtank, water))



env <- read.csv("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/1 Raw/Dataset_environmental_sustainability.csv")

install.packages("Hmisc")
library(Hmisc)

att_bhv <- env[, 9:20]




r = rcorr(as.matrix(att_bhv), type = "spearman")$r

p = rcorr(as.matrix(att_bhv), type = "spearman")$P


lt <- lower.tri(r, diag = F)

plotdf <- data.frame(row = rownames(r)[row(r)[lt]], col = colnames(r)[col(r)[lt]], r = r[lt], p = p[lt], stringsAsFactors = F)

plotdf$row <- factor(plotdf$row, levels =  paste0("Q", 1:12))

plotdf$col <- factor(plotdf$col, levels =  paste0("Q", 1:12))

plotdf$ptext <- NA
plotdf$ptext <- ifelse(plotdf$p < 0.05 & plotdf$p >= 0.01, "*", plotdf$ptext)
plotdf$ptext <- ifelse(plotdf$p < 0.01 & plotdf$p >= 0.001, "**", plotdf$ptext)
plotdf$ptext <- ifelse(plotdf$p < 0.001 , "***", plotdf$ptext)

ggplot(data = plotdf, aes(row, col, fill = r))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "#075AFF", mid = "#FFFFCC", high = "#FF0000",limit = c(-1,1), space = "Lab", name="Spearman\nCorrelation") +
  geom_text(aes(row, col, label = round(r,2)), color = "black", size = 3, vjust = -0.5) +
  geom_text(aes(row, col, label = ptext), color = "black", size = 3, vjust = 1.5)+
  
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.45, 0.7),
    legend.direction = "horizontal",
    legend.text = element_text(size = 10),
    legend.title = element_text(size = 11)) +
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1, title.position = "top", title.hjust = 0.5)) +
  coord_fixed() 


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

