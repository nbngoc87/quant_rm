data_bike <- read.csv("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/day.csv", sep = ",", header = T)
summary(data_bike)
library(ggplot2)
install.packages("ggplot2")

library(dplyr)

test <- data_bike %>%
  group_by(weathersit) %>%
  summarise(casual = max(casual),
            regis = max(registered))


ggplot(data=data_bike,aes(x=month,y=yr,fill=cnyt))+geom_tile()+labs(title="Bike Rental count by month and year",x="Month",y="Year")
