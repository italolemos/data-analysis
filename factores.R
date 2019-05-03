#Fatores
#1
#a
amostra = sample(LETTERS, 100, replace=TRUE)
#b
letras <- factor(amostra, levels=LETTERS, ordered=TRUE)

#Listas
#1
#a
myList <- list(string=c("a", "b", "c", "d", "e", "f"),
               numbers=c(1:5), matriz=matrix(c("a", "b", "c", "d", "e", "f"), 2, 3)
               )
#b
A <-c(1,2,3,4) 
B <-c("João", "Maria", "José", "Pedro")
C <-c(3.0, 5.0, 2.5, 1.0)
dt <-data.frame("ID" = A, "Nome" = B, "Peso" = C, stringsAsFactors = FALSE)

myList$frame = dt

#c
myList[-2]

#d
new_list <- list(1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 1:5, 5:10)
new_list

#e
list_size <- length(new_list)
list_vectors_size <- lengths(new_list)

#f
lapply(new_list, summary)
sapply(new_list, summary)
#lapply retorna uma lista de cada elemento da lista origiral
#sapply retorna o valor como um vetor, o que torna seu acesso mais facil e simplificado


#Matrizes
load("chuvas.RData")
View(chuvas)

A<-matrix(1:12,3,4);A
A[1,3]
max(A[1,])

#1
#a
mean(chuvas)
#b
chuvas[max(chuvas),]
#c
chuvas[,min]
#d
sum(chuvas[81,1:10])
#e
primeiro_quinzena = sum(chuvas[,1:15])
segunda_quinzena = sum(chuvas[,16:30])
if (primeiro_quinzena > segunda_quinzena){
  print("Volume maior nos primeiros 15 dias ")
} else{
  print("Volume de chuva menor nos 15 primeiros dias")
}
#f
coluna31 <- rowSums(chuvas)
chuvas <- cbind(chuvas, coluna31)
colnames(chuvas)[31] <- "soma"
#g
chuva_15dias <- matrix(chuvas[1:15,1:15],15, 15)
View(chuva_15dias)

#Estruturas de Controle e Repetição
#1
numbers <- c(4, 2, 8)
#a
positive <- FALSE
negative <- FALSE
for (num in numbers) {
  if (num %% 2 ==0){
    positive = TRUE
  } else {
    negative = TRUE
  }
}
if (positive == TRUE & negative == FALSE){
  print("Todos pares")
} else {
  if (negative == TRUE & positive == FALSE){
    print("Todos impares")
  } else {
    print("Numero mistos")
  }
}


#b
#2

#Funcoes
#1
