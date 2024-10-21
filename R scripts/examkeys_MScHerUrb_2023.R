pantheon <- read.csv("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/pantheon.csv", sep = ",", header = T)


summary(pantheon)
library(ggplot2)


library(dplyr)

table(pantheon$sex)
tab_contry <- as.data.frame(table(pantheon$country))
table(pantheon$continent)
table(pantheon$domain)

summary(pantheon$article_languages)
sd(pantheon$article_languages)

summary(pantheon$historical_popularity_index)
sd(pantheon$historical_popularity_index)

ggplot(data= pantheon, aes(x= domain,y= page_views)) +
  geom_bar(stat = "summary", fun = "mean") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

ggplot(data= pantheon, aes(x= occupation,y= historical_popularity_index)) +
  geom_bar(stat = "summary", fun = "mean") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


colnam
