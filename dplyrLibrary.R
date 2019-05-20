# carregar pacote
install.packages("dplyr")
library(dplyr)

# filter
filter(airquality, Temp<70, Wind>14)
names(airquality)

# select
head(select(airquality, Temp, Wind))

# mutate
# create new variable
new_df <- mutate(airquality, celsius = (airquality$Temp-32)/1.8)
head(new_df)

# arrange
# ordena as colunas
head(arrange(new_df, celsius))

# summarise
summarise(airquality, 
          maxfahrenheit=max(Temp),
          Contador = n()
          )

temp_by_moth <- group_by(airquality, Month)
summarise(temp_by_moth,
          maxfahrenheit=max(Temp)
          )

airquality %>%
  group_by(Month) %>%
  filter(Temp > 80) %>%
  summarise(
    SomaTemp = sum(Temp),
    mediaWind = mean(Wind)
  )

group_by(ChickWeight, Diet)


str(ChickWeight)


head(temp_by_moth)
View(airquality)
