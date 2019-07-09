df <- read.csv("datatran2018.csv", sep = ";", dec = ",", encoding = "pt_PT.ISO8859-1", na.strings = "")
View(df)

library(dplyr)

# dados de PE
dfPernambuco <- df %>%
  select(data_inversa, dia_semana, horario, uf, br, km, municipio, causa_acidente, tipo_acidente, classificacao_acidente,
         fase_dia, condicao_metereologica, pessoas, mortos, feridos_leves, ilesos, veiculos, latitude, longitude) %>%
  filter(uf == "PE")

dfPernambuco$data_inversa <- as.Date(dfPernambuco$data_inversa, format ="%Y-%m-%d")
dfPernambuco$km <- sub(",", ".", dfPernambuco$km)
dfPernambuco$km <- as.numeric(dfPernambuco$km)

View(dfPernambuco)
str(dfPernambuco)

#Acidentes por rodovias
acidentes_por_estrada <- dfPernambuco %>%
  na.omit() %>%
  count(br, sort = T)
View(acidentes_por_estrada)

library(ggplot2)
p <-ggplot(data = acidentes_por_estrada, aes(x = as.character(br), y = n)) + 
  labs(title="Quantidade de Acidentes em Rodovias Pernambucanas", y="Acidentes", x="Rodovia BR-xxx") +
  geom_bar(stat="identity", fill="steelblue") + 
  geom_text(aes(label=n), vjust=-0.3, size=3.5) +
  theme_minimal()

# Dia da Semana com mais acidentes
group_by(dfPernambuco, dia_semana) %>%
  count(sort = T)

# Mes
mes_acidente <- dfPernambuco %>%
  select(data_inversa) %>%
  mutate(Month_Year = substr(data_inversa, 1,7)) %>%
  group_by(Month_Year) %>%
  summarise(
    acidentes_mes = n()
  )


View(mes_acidente)
  
# causas de acidentes mais comuns
causas <- dfPernambuco %>%
  group_by(causa_acidente)  %>%
  summarise(
    Contador = n(),
  ) %>%
  arrange(desc(Contador))
View(causas)


View(dfPernambuco)
# acidentes no são joão em br 232
acidentes_recife_caruaru_junho <- dfPernambuco %>%
  filter(br == 232,
         between(data_inversa, as.Date("2018-06-01"), as.Date("2018-06-30")),
         between(km, 1, 140))

View(acidentes_recife_caruaru_junho)

#Rodovias com mais mortos
acidentes_com_mortos_por_estrada <- dfPernambuco %>%
  select(br, mortos) %>%
  group_by(br) %>%
  filter(mortos >= 1) %>%
  summarise(
    mortos = sum(mortos)
  ) 

barplot(acidentes_com_mortos_por_estrada$mortos,
        names.arg = paste("BR", acidentes_com_mortos_por_estrada$br, sep = "-"),
        width = c(0.2, 0.3),
        main = "Mortes por Rodovia",
        xlab = "Rodovia",
        ylab = "Mortes",
        beside = T,
        col = rainbow(11), 
        cex.names = 0.55,
        )
View(acidentes_com_mortos_por_estrada)
