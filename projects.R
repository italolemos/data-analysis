df <- read.csv("datatran2018.csv", sep = ";", encoding = "latin1")
View(df)

library(dplyr)

# dados de PE
dfPernambuco <- df %>%
  filter(uf == "PE")
View(dfPernambuco)  


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
epoca_acidente <- dfPernambuco %>%
  select(data_inversa, tipo_acidente) %>%
  mutate(Month_Year = substr(data_inversa, 1,7)) %>%
  group_by(Month_Year)

View(epoca_acidente)
  
# causas de acidentes mais comuns
causas <- dfPernambuco %>%
  group_by(causa_acidente)  %>%
  summarise(
    Contador = n(),
  ) %>%
  arrange(desc(Contador))
View(causas)


