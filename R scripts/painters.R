
library(dplyr)
library(stringi)
artists <- read.csv("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/Pantheon/artists.csv")[,c(1:5,8)]
artists$name_en <- stri_trans_general(artists$name, id = "Latin-ASCII")


pantheon <- read.csv("C:/Users/nbngo/OneDrive/Work/[C]_ResearchMethods/quant_rm/Data/Pantheon/person_2019_update.csv")



painters <- pantheon[pantheon$occupation == "PAINTER", c("name", "occupation", "gender", "twitter", "alive", "l", "hpi_raw", "bplace_country", "birthyear", "deathyear", "non_en_page_views", "hpi")]
painters$name_en <- stri_trans_general(painters$name, id = "Latin-ASCII")




joined <- inner_join(painters, artists, by = c("name_en"))

