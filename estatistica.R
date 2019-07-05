# teste t para uma amostra
x<- c(5.1,5.0,4.8,5.0,5.0,4.9,4.9, 4.7)
media <- 4.8
ns <- 0.05
t.test(x, alternative = "two.sided", mu = media, conf.level = ns)

shapiro.test(x)
#Teste de Hipotese
indice <- c(27, 24, 21, 25, 26, 22)
media <- 23
ns <- 0.05
t.test(indice, alternative = "two.sided", mu = media, conf.level = ns)
#rejeita H0

consumo <- c(300, 400, 350, 450, 100, 220, 150, 500, 900, 800, 600, 150, 50, 170, 370, 200)
media <- 600
t.test(consumo, alternative = "two.sided", mu = media, conf.level = ns)
# rejeira H0

# Shapiro testa a hipotese nula, de que as amostras sao de uma distribuicao normal
shapiro.test(consumo)
# nao provem de uma distribuicao normal
t.test(ToothGrowth$supp, ToothGrowth$dose, alternative = "two.sided", conf.level = ns)

antes <- c(635, 704, 662, 560, 603, 745, 698, 575, 633, 669)
depois <- c(640, 712, 681, 558, 610, 740, 707, 585, 635, 682)
t.test(antes, depois, paired = T)

#vem de uma distribucao normal
shapiro.test(antes)
shapiro.test(depois)

# aceita que H0 a variancia das amostras sao as mesmas
var.test(antes, depois)

#Correlacao
cor.test(formula = ~ speed + dist, data = cars)
#Regressao Linear Simples
head(marketing)
plot(marketing$youtube, marketing$sales)
cor.test(marketing$sales, marketing$youtube)
#determinar a os coeficientes betas
model <- lm(sales ~ youtube, data = marketing)
model
