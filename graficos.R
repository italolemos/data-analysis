#Grafico de Linha
x <- 1:15
y <- x**2
t <- x**3
plot(x, y, type="o", pch=3, cex=1, col="red",
     xlab="Eixo X",
     ylab="Eixo Y",
     main="Gr??fico simples",
     cex.axis=1.0,
     cex.lab=1.2,
     cex.main=1.1,
     xlim = c(0, 20), ylim=c(0, 300))
lines(t, type = "o", col = "red")
v <- x
lines(v, type="o", col = "blue")
legend("topleft", pch = c(1,3),
       col = c("red", "black"),
       legend = c("Dados 1", "Dados 2"))

# Grafico de dispers??o
# correla????o entre duas vari??veis
plot(iris$Sepal.Length,
     iris$Petal.Length,
     main = "Iris Data",
     col = iris$Species,
     pch = 17, cex=2,
     xlab = "Sepal Length",
     ylab = "Petal Length")
legend(x = 4.5, y = 7, pch = 17, col = c(1:3), legend = levels(iris$Species))

# Exercicio dispers??o
plot(mtcars$mpg,
     mtcars$qsec,
     main = "MPG VS QSEC",
     xlab = "Milhas por Gal??o",
     ylab = "Tempo de 1/4 de milha", col = c(1:32))

sapos <- c(6, 5, 10, 11, 26, 16, 17, 37, 18, 21, 22, 15, 24, 25, 29, 31, 32, 13, 39, 40)
umidade <- c(62, 24, 21, 30, 34, 36, 41, 48, 56, 74, 57, 46, 58, 61, 68, 76, 79, 33, 85, 86)
temp <- c(31, 23, 28,30,15, 16,24,27, 18,10, 17, 13, 25, 22, 34, 12, 29, 35, 26, 19)
par(mfrow=c(1,2))
plot(sapos, umidade, main = "Sapos vs Umidade", xlab = "Sapos", ylab = "Umidade")
plot(sapos, temp, main = "Sapos vs Temperatura", xlab = "Sapos", ylab = "Temperatura")

#Graficos de barra
max.temp <- c(30, 35, 40, 38, 25, 24, 23)
barplot(max.temp,
        main = "M??xima temperatura em uma semana",
        ylab = "Graus em Celsius",
        xlab = "Dia",
        names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"), col = rainbow(7),
        horiz = T)
# barras empilhadas    
colors= c("green","orange","brown")
months<-c("Mar","Apr","May","Jun", "Jul")
regions<-c("East","West","North")
Values<-matrix(c(2,9,3,11,9,4,8,7,3,12,5,2, 8,10,11), nrow= 3, ncol= 5, byrow= TRUE)

barplot(Values, main = "Rendimento total", names.arg = months, xlab = "Meses", ylab = "Rendimento", col = colors, beside = T)

# Exerc??cio
peso <- c(42, 52, 59, 64, 76)
dias <- c(2, 4, 6, 8, 10)
barplot(peso,
        main = "Peso m??dio de pintinhos",
        xlab = "Dias",
        ylab = "Peso(g)",
        names.arg = dias,
        col = c("orange", "yellow", "green", "red"),
        horiz = T
        )
qualidade <- matrix(c(53.8, 33.9, 2.6, 0.0, 43.6, 54.2, 60.5, 21.4, 2.6, 11.9, 36.8, 78.6), nrow = 3, ncol = 4, byrow = T)
price <- c("$10-19", "$20-29", "$30-39", "$40-49")
quality <- c("Good", "Very Good", "Excellent")
barplot(qualidade, main = "Qualidade das refei????es de acordo com o Pre??o",
        names.arg = price,
        xlab = "Valor($)",
        ylab = "Rating(%)",
        col = rainbow(3))
legend("bottomleft", pch = c(15, 15, 15), col = rainbow(3), legend =quality)

#Histrograma
#Frequencia de dados
Temperature <- airquality$Temp
hist(Temperature, col = "grey", density = 20, freq = F)
densityTemp <- density(Temperature)
lines(densityTemp)
#Exercicio
tempm <- c(67,72,74,62,56,66,65,59,61,69,74,69,66,68,58,64,66,57,68,62,59,73,61,61,57,58, 57, 67,81,79,76)
temps <- c(91,92,93,93,87,84,80,78,75,73,81,76,77,71,71,78,67,76,68,82,64,71,81,69,63,70,77,75,76,68)
hist(tempm, main = "Temperatura m??s maio", density = 30)
hist(temps, main = "Temperatura m??s junho", density = 30, col = "blue")
help("hist")
(tempm - 32)/1.8

#Grafico Pizza
#Representa Diferentes proporcoes entre diferentes classes
x <- c(32, 12, 30, 53)
labels <- c("Recife", "Durham",
             "Toronto", "Amsterdam")
pie(x, labels, main = "Gr??fico das Cidades", col = rainbow(4))
pct <- round(x/sum(x)*100)
lbls <- paste(labels, pct)
lbls <- paste(lbls, "%", sep="")
pie(x, labels = lbls, main = "Gr??fico das Cidades", col = rainbow(4))
legend("topright", legend = c("Recife", "Durham", "Toronto", "Amsterdam"), cex = 0.8, 
       fill = rainbow(length(x)))


#Diagramas de caixa
boxplot(mpg ~ cyl, 
        data=mtcars, 
        xlab = "Numero de cilindros", 
        ylab = "Milhas por galao", 
        main = "Dados de milhagem",
        outline=F)
