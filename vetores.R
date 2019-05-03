#Vetores
#1
espadas <-c(1, 4, 5)
rep(espadas, 10)

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
