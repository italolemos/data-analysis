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

#Exercicio
cafeina = read.table("cafeina.txt", header = T, sep = "", dec = ".")

View(cafeina)
str(cafeina)
summary(cafeina)

#media de idade para cada sexo
cafeina %>%
  group_by(gender) %>%
  summarise(
    mediaGenero = mean(age)
  )

# idade media para cada bebida
cafeina %>%
  group_by(drink) %>%
  summarise(
    mediaAge = mean(age)
  )

# idade media para cada nivel combinado de genero e bebida
cafeina %>%
  group_by(gender, drink) %>%
  summarise(
    mediaAge = mean(age)
  )

# calcular a pontuacao para cada idade
cafeina %>% 
  group_by(age) %>%
  summarise(
    pontuacao = median(score)
  )

# pontuacao maxima para cada idade apenas para homens
cafeina %>%
  group_by(age) %>%
  filter(gender == "male") %>%
  summarise(
    pontMax = max(score)
  )

cafeina %>%
  group_by(drink) %>%
  summarise(
    media = mean(score),
    mediana = median(score),
    desvio = sd(score)
  )

cafeina %>%
  group_by(drink, cups) %>%
  filter(gender == "female" & age > 20) %>%
  summarise(
    media = mean(score),
    mediana = median(score),
    desvio = sd(score)
  )

library(dplyr)

arg <- read.csv("arg.csv", sep = ";", encoding = "latin1")
str(arg)

arg.select <- arg %>%
  select(TIPO, PERIODO, CO_ANO, NO_FAT_AGREG, NO_PPE_PPI, VL_FOB, KG_LIQUIDO)

head(arg.select, 3)

unique(as.character(arg.select$TIPO))

unique(as.character(arg.select$PERIODO))

arg.filter <- arg.select %>%
  filter(TIPO == "EXPORTAÇÕES" & PERIODO == "Jan-Abr")

View(arg.filter)

#criar novas variaveis(colunas)
arg.mutate <- arg.filter %>%
  mutate(PRECO_VL_KG = VL_FOB/KG_LIQUIDO, LOG_KG = log(KG_LIQUIDO))
head(arg.mutate)


arg.group <- arg.filter %>%
  group_by(TIPO, PERIODO, CO_ANO, NO_FAT_AGREG) %>%
  summarise(SOMA_VL_FOB = sum(VL_FOB),
            MEDIA_KG = mean(KG_LIQUIDO))
head(arg.group)

arg.arrange <- arg.group %>%
  arrange(NO_FAT_AGREG, desc(SOMA_VL_FOB))
head(arg.arrange)
