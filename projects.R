df <- read.csv("datatran2018.csv", sep = ";", dec = ",", encoding = "latin1", 
               na.strings = "")
View(df)
str(df)
library(dplyr)
library(ggplot2)
library(DT)

# dados de PE
dfPernambuco <- df %>%
  select(data_inversa, dia_semana, horario, uf, br, km, municipio, causa_acidente, tipo_acidente, classificacao_acidente,
         fase_dia, condicao_metereologica, pessoas, mortos, feridos, veiculos, latitude, longitude) %>%
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


ggplot(data = acidentes_por_estrada, aes(x = as.character(br), y = n)) + 
  labs(title="Quantidade de Acidentes em Rodovias Pernambucanas", y="Acidentes", x="Rodovia BR-xxx") +
  geom_bar(stat="identity", fill="steelblue") + 
  geom_text(aes(label=n), vjust=-0.3, size=3.5) +
  theme_minimal()

# Dia da Semana com mais acidentes
group_by(dfPernambuco, dia_semana) %>%
  count(sort = T)
library(tidyverse)

# Acidente_Mes
mes_acidente <- dfPernambuco %>%
  select(data_inversa) %>%
  mutate(month = format(data_inversa, "%Y-%m")) %>%
  group_by(month) %>%
  summarise(
    acidentes = n()
  )


library(zoo)

mes_acidente$month <- as.Date(as.yearmon(mes_acidente$month))
  
ggplot(data = mes_acidente, aes(x = month, y = acidentes, group = 1)) + 
  geom_line(color = "#00AFBB", size = 1) + scale_x_date(date_labels = "%b") + 
  labs(subtitle = "Ocorrências em Perbambuco nos meses de 2018")

  
# causas de acidentes mais comuns
causas <- dfPernambuco %>%
  group_by(causa_acidente)  %>%
  summarise(
    Contador = n(),
  ) %>%
  arrange(desc(Contador))
View(causas)


View(dfPernambuco)

# acidentes no sao joão em br 232
acidentes_recife_caruaru_junho <- dfPernambuco %>%
  filter(br == 232,
         between(data_inversa, as.Date("2018-06-01"), as.Date("2018-06-30")),
         between(km, 1, 140)) %>%
  group_by(dia_semana) %>%
  summarise(
    acidentes = n(),
    mortes = sum(mortos)
  )

ggplot(acidentes_recife_caruaru_junho, aes(x=factor(dia_semana), group = 1)) + 
  geom_line(aes(y=acidentes), stat = "identity") +
  geom_line(aes(y=mortes, col = "red"), stat = "identity")


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

# Nuvem de Palavras
install.packages("tm")
install.packages("wordcloud")
install.packages("RColorBrewer")

library(tm)
library(wordcloud)
library(RColorBrewer)

motivos <- paste(dfPernambuco$causa_acidente, copllapse = " ")
corpus <- Corpus(VectorSource(motivos))
inspect(corpus)
#limpeza de dados
#Coloca tudo em min?sculo
corpus <-tm_map(corpus, tolower)
#Remove pontua??o
corpus <-tm_map(corpus, removePunctuation)
#Remove n?meros
corpus <-tm_map(corpus, removeNumbers)
#Remove espa?os extras em branco
corpus <-tm_map(corpus, stripWhitespace)
#Remove palavras ru?do 
corpus <-tm_map(corpus, removeWords, stopwords('portuguese'))

tdm<-as.matrix(TermDocumentMatrix(corpus))

#Fornece as frequ?ncias ordenadas de cada palavra.
fre<-sort(rowSums(tdm),decreasing=TRUE)

#Escolhendo um subconjunto dos dados.
aux<-subset(fre, fre>2)

#Gerar o gr?fico.
barplot(aux, las=2, col= rainbow(10))

# correlacao 
cor(dfPernambuco$mortos, dfPernambuco$condicao_metereologica)

# condicao meteorologica
library(tidyr)

condicao_tempo <- dfPernambuco %>%
  na.omit() %>%
  select(br, condicao_metereologica) %>%
  gather(br, condicao_metereologica) %>%
  group_by(br, condicao_metereologica) %>%
  summarise(
    n = n()
  )
 

# fase do dia
acidentes_fase_dia <- dfPernambuco %>%
  na.omit() %>%
  select(br, fase_dia) %>%
  gather(br, fase_dia) %>%
  group_by(br, fase_dia) %>%
  summarise(
    acidentes = n()
  )
theme_set(theme_classic())

ggplot(acidentes_fase_dia, aes(x=br, y=acidentes)) + 
  geom_bar(aes(fill=fase_dia), width = 0.5, stat="identity") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  labs(title="Rela??o de acidentes com a fase do dia ")


View(condicao_tempo)
View(acidentes_fase_dia)
View(mpg)
install.packages("DT")



# Acidentes por tipo
acidentes_pelo_tipo <- dfPernambuco %>%
  group_by(tipo_acidente) %>%
  summarise(
    Acidentes = n(),
    Feridos = sum(feridos),
    Mortos = sum(mortos)
  ) %>%
  adorn_totals("row")

View(acidentes_pelo_tipo)

library(knitr)
library(kableExtra)

kable(acidentes_pelo_tipo) %>%
  kable_styling("striped", full_width = F) %>%
  row_spec(c(2, 6, 15), bold = T, color = "white", background = "#D7261E") %>%
  row_spec(17, bold = T, color = "black", background = "#D3D3D3")
  
  