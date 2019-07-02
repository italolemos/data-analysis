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
