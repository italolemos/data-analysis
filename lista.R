#Familiaridade

#2
setwd("/Users/italolemos/Documents/Meu RCurso")

# 3
#a
log(5 + (7^0.3))
#b
a = sqrt(3)
atan(a)
#c
sin(tan(pi/2))
#d
factorial(23)
#4
demo(image()) # Exibe algums demonstracoes de scripts do R
#5
a.c<-1
b.c<-2
c.c<-3
d.c<-4

rm(list = ls(pattern = ".c")) 
#6
?q
#7
q()

#Vetores
#1
lote <-c("CI", "ES", "ES", "ES", "ES", "CT", "CT", "CT", "CT", "CT")
espadas <- rep(lote, 10)
espadas

#2
repetir <- rep(c(1:5), 10)
length(repetir)

#3
rep(c(1:5), each=10)
length(rep(c(1:5), each=10))

#4
load("vetor.RData")
#a
vetor01 <- sort(vetor01, decreasing=TRUE, na.last=TRUE)
#b
mean(vetor01, na.rm=TRUE)
median(vetor01, na.rm=TRUE)
#c
sd(vetor01, na.rm=TRUE)
#d
#e
length(which(vetor01 > 7.00 & vetor01 < 8.00))
#f
vetor02 <- vetor01[1:500]
#g
vetor01 <- sort(vetor01, na.last=NA)

#5
movie <- c("Whatever Works", "It Follows", 
           "Love and Mercy", "The Goonies", "Jiro Dreams of Sushi", 
           "There Will be Blood", "Moon", 
           "Spice World", "Serenity", "Finding Vivian Maier")
year <- c(2009, 2015, 2015, 1985, 2012, 2007, 2009, 1988, 2005, 2014)
boxoffice <- c(3.0, 15.0, 15.0, 62.0, 3.0, 10.0, 321.0, 79.0, 39.0, 1.5)
genre <- c("Comedy", "Horror", "Drama", "Adventure", "Documentary", 
           "Drama", "Science Fiction", "Comedy", "Science Fiction", "Documentary")
time <- c(92, 97, 120, 90, 81, 158, 94, -84, 119, 84)
rating <- c("PG-13", "R", "R", "PG", "G", "R", "R", "PG-13", "PG-13", NA)

#a
movie[10]
#b
genre[1:4]
#c
movie[8] = "The Naked Gun"
#d
movie[year<1990]
#e
quantidade_drama <- sum(genre=="Drama")
mean(quantidade_drama/length(movie))
#f
time[8] = NA
mean(time, na.rm=TRUE)
#g
movie[which(genre=="Comedy")]
sum(boxoffice[which(genre=="Comedy")])
#h
movie[which(genre=="Comedy" & boxoffice > 10.0)]
#i
mean(boxoffice[which(rating == "G" | rating == "PG")])
#j
mean(which(rating == "R" | genre == "Comedy"))


#Fatores
#1
#a
amostra = sample(LETTERS, 100, replace=TRUE)
amostra
#b
letras <- factor(amostra, levels=LETTERS, ordered=TRUE)
letras
#c
as.ordered(amostra)


#Listas
#1
#a
myList <- list(string=c("a", "b", "c", "d", "e", "f"),
               numbers=c(1:5), matriz=matrix(c("a", "b", "c", "d", "e", "f"), 2, 3)
)
#b
A <-c(1,2,3,4) 
B <-c("Jo??o", "Maria", "Jos??", "Pedro")
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

#DataFrames
#1
mouse.color <- c("purple", "red", "yellow", "brow")
mouse.weight <- c(23, 21, 18, 26)
mouse.info <- data.frame("colour"=mouse.color, "weight"=mouse.weight, stringsAsFactors = FALSE)
#a
mouse.info
#b
mouse.info[3,]
#c
mouse.info[,1]
#d
mouse.info[4, 1]

#2
small_file = read.delim('https://www.dropbox.com/s/ezzfix0bxpjh05z/small_file.txt?dl=1', sep='\t')
View(small_file)
#a
oj <- subset(small_file, subset = Length > 65)
nrow(oj)
#b
od <- subset(small_file, subset = Category == "B")
nrow(od)

#3
child_variants = read.csv('https://www.dropbox.com/s/mlr00tg2n4lf2w6/Child_Variants.csv?dl=1')
View(child_variants)
#a
mean(child_variants$MutantReadPercent)
#b
new_data <- subset(child_variants, subset = MutantReadPercent >= 70)
new_dataframe <- data.frame(new_data)
#c
most_new_data <- subset(new_dataframe, subset = REF == "C")
most_new_dataframe <- data.frame(most_new_data)
View(most_new_data)
#d
mutacao_para_t <- subset(most_new_data, subset = ALT=="T")
nrow(mutacao_para_t)

mutacao_para_g <- subset(most_new_data, subset = ALT=="G")
nrow(mutacao_para_g)

mutacao_para_a <- subset(most_new_data, subset = ALT=="A")
nrow(mutacao_para_a)

mutacoes <- factor(most_new_data$ALT, levels = c("G", "A", "T"))
mutation.count <- table(mutacoes)
View(mutation.count)

# H?? preferencia para a mutancao de C para T

#Estruturas de Controle e Repeticao
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
adicionar_dt <- function(dt, column_name, vetor){
  dt$column_name <- vetor
  
  return (dt)
}

#teste
survey <- data.frame("index" =
                       c(1, 2, 3, 4, 5),"age"=
                       c(24, 25, 42, 56, 22)
)
sex <- c("m", "m", "f", "f",
         "m")
adicionar_dt(survey, "sex", sex)

#2
numeros <- c(0, 2, 1, 4, 8)


verifica_numeros <- function(x){
  numbers <- c(0:9)
  
  return (setdiff(numbers, x))
  
}
verifica_numeros(numeros)
#3

word <- "abc"

posicao <- function(word){
  brake_letters <- unlist(strsplit(word, ""))
  
  return (match(brake_letters, letters))
}

posicao(word)

#4

