library(lattice)
#problem 1
x <- c(3.79, 2.99, 2.45, 2.14, 3.36, 2.05, 3.14, 3.54,
      2.77, 2.91, 3.10, 1.84, 2.52, 3.22, 2.67, 2.52,
      2.71, 2.75, 3.57, 3.85, 2.89, 2.83, 3.13, 2.44,
      2.10, 3.71, 2.37, 2.68, 3.51, 3.37)
#a
a <- mean(x)
b <- sd(x)
print(paste0("The mean is: ",a,"standrad deviation is: ",b))

#b
histogram(x)

#c
stem(x)

#d
boxplot(x)

#problem 2
factorial(9)

#problem 3
factorial(365)/(factorial(305)*factorial(60))

#problem 4
#P(A∪B) =P(A) +P(B)−P(A∩B)
#(a)in either tax-free bonds or mutual fun
0.6+0.3-0.15
#(b)in neither tax-free bonds or mutual fun
1-(0.6+0.3-0.15)

#problem 5
#P(A∩B) =P(A)P(B|A)
#3 aces
draws <- factorial(52)/(factorial(5)*factorial(52-5))
aces <- factorial(4)/factorial(3)
other2 <- factorial(48)/(factorial(2)*factorial(46))
P_a <- (aces*other2)/draws
#4 hearts and 1 club
hearts <- factorial(13)/(factorial(4)*factorial(9))
club <- factorial(13)/(factorial(1)*factorial(12))
P_b <- (hearts*club)/draws

#problem6
#a
p1 <- 0.09/0.28
#b
p2 <- 0.09/0.12
#c
p3 <- 1-0.09

#problem7
#P(B|A) =P(A∩B)/P(A)
pl <- 0.75
ps <- 1-0.75
prl <- 0.6
prs <- 0.3
plr <- (0.6*0.75)/(0.6*0.75+0.3*0.25)









