plot(x, y, type="o", pch = 3,
     cex=2, col = "black", xlab = "Eixo X", ylab = "Eixco Y", 
     cex.lab=1.5, cex.axis=0.8, cex.main = 1,
     xlim=c(0, 20), ylim = c(0, 300), bty="n", axes = F)
lines(t, type = "o", col = "red")
legend("topleft", pch = "", col = "", legend = "")

axis(side=1, at=seq(1,15,1), labels=seq(1,15,1), cex.axis=0.7)
par(mfrow=c(1,2))

plot(iris$Sepal.Length,  iris$Petal.Length,cex=2)

Values<-matrix(nrow= 3, ncol= 5, byrow= TRUE)
barplot(Values, main= "", 
        names.arg= months, xlab= "", 
        ylab="", col= 
        horiz = )

hist(Temperature, density = 10,probability= T, freq = F)
densityTemp<-density(Temperature)
lines(densityTemp)

pie(x,labels=lbls)

boxplot(x ~ y, data = )
dev.off()

t.test(x,y,alternative,mu,conf.level)
t.test(formula = tattoos ~ age,data = pirates,subset= "")
shapiro.test()
var.test()

cor.test(formula, data, subset, na.action)
lm(x ~ youtube, data=)

previsao <- data.frame(youtube=c(110, 1000, 5000))
predict(model, previsao)