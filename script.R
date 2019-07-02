nomes <- c("Hebe Camargo", "Silvio Santos")
anoNascimneto <- c(1929, 1930)
falecido <- c(TRUE, FALSE)

dfDados <- data.frame(nomes, anoNascimneto, falecido)

str(dfDados)

caracol_data <- read.csv("Snail_feeding.csv", header = T, strip.white = T, na.strings = "")
str(caracol_data)

caracol_data <- caracol_data[,1:7]
str(caracol_data)

unique(caracol_data$Sex)
levels(caracol_data$Sex)

levels(caracol_data$Sex)[2] <- "female"
levels(caracol_data$Sex)[3] <- "male"
levels(caracol_data$Sex)[3] <- "male"

#converter de fator para numerico
caracol_data$Distance <- as.character(caracol_data$Distance)
caracol_data$Distance <- as.numeric(caracol_data$Distance)

#verificar NAs
which(is.na(caracol_data$Distance))

#substituir manualmente
caracol_data[682, "Distance"] <- 0.58
caracol_data[755, "Distance"] <- 0.356452

#removendo dados duplicados
which(duplicated(caracol_data))

index <- which(duplicated(caracol_data))
caracol_data <- caracol_data[-index,]

#estatisticas de cada variavel
summary(caracol_data)

# checar profundidade maior que 2 metros
caracol_data[which(caracol_data$Depth > 2),]

# substituir o valor
caracol_data[8, 6] <- 1.62
summary(caracol_data)

#retorna os nomes das colunas
names(caracol_data)

#retorna as primeiras linhas 6 linhas
head(caracol_data)

#ordenacao de vetorees
sort(caracol_data$Depth)

risco.survey <- data.frame("ID.part" = c(1, 2, 3, 4, 5), "av.risco" = c(3, 4, 5, 3, 1))


felicidade.survey <- data.frame("ID.part" = c(4, 2, 5, 1, 3), "feli.score" = c(20, 40, 50, 90, 53))

combinado.survey <- merge(x=risco.survey, y=felicidade.survey, by="ID.part", all=T)
combinado.survey

aggregate(formula = weight ~ Diet, FUN = mean, data = ChickWeight)

aggregate(formula = weight ~ Diet, FUN = mean, subset = Time < 10, data = ChickWeight)


View(caracol_data)
View(caracol_data[2,1:7])

#revisao
#acessando elementos do vetor
v<-c(1,1,1,10,10)

#which (QUAIS?) -> retorna a posicao dos elementos
which(v > 3)
v[which(v > 3)]

