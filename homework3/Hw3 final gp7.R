#Problem 1
library(ggplot2)
library(lattice)

staff_salaries <- c(3.79, 2.99, 2.45, 2.14, 3.36, 2.05, 3.14, 3.54, 2.77, 2.91,
                    3.10, 1.84, 2.52, 3.22, 2.67, 2.52, 2.71, 2.75, 3.57, 3.85, 
                    2.89, 2.83, 3.13, 2.44, 2.10, 3.71, 2.37, 2.68, 3.51, 3.37)
df = data.frame(staff_salaries)
#(a) Sample mean and sample standard deviation
mean_salary <- mean(staff_salaries)
std_salary <- sd(staff_salaries)
print(paste0("(a) Sample Mean of staff salaries: ", mean_salary))
print(paste0("(a) Sample Standard Deviation of staff salaries: ", std_salary))

#(b) Relative frequency histogram
#A relative frequency histogram will give the percentage on the y axis, whereas
#a frequency histogram will give the count on y-axis
histogram(staff_salaries, breaks = 9, type="percent", main = "Staff Salaries" )
# Frequency histogram
histogram(staff_salaries, breaks = 9, type="count", main = "Staff Salaries" )

#(c) Stem and leaf display, using scale 0.5 to place line at the decimal point. 
#The decimal places will be rounded off after 1st digit to the right of decimal point
stem(staff_salaries, scale = 0.5)

#(d) Box plot
#Using ggplot2
ggplot(df, aes(x = "", y=staff_salaries))+geom_boxplot()
#Using base R
boxplot(staff_salaries, data = df)

#for problem2-7 we are using R as calculator and all the formula and answers are also stored
#in the doc file. This R file is only use to show how we calculate by using R.
#for problem3 the answer is a big number which cannot show properly in R.

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
#(a)
#5 cards can be hold in the ways of : 52!/(5!*(52-5)!) = 2598960
#3 aces can be hold in ways of: 4!/(3!*1!) = 4
#number of ways holding the other 2 cards: 48!/(2!*46!)=1128
#The probability of holding 3 aces is 4/2598960  
draws <- factorial(52)/(factorial(5)*factorial(52-5))
aces <- factorial(4)/factorial(3)
other2 <- factorial(48)/(factorial(2)*factorial(46))
P_a <- (aces*other2)/draws
#(b)
#4 hearts can be hold in the ways of :13!/4!*9! =715
#1 club can be hold in the ways of : 13!/1!*12! = 13
#The probability of holding 4 hearts and 1 club is (13*715)/2598960
hearts <- factorial(13)/(factorial(4)*factorial(9))
club <- factorial(13)/(factorial(1)*factorial(12))
P_b <- (hearts*club)/draws

#problem 6
#A vehicle entering the Luray Caverns has Canadian license plates is P(A) = 0.12
#A vehicle entering the Luray Caverns is a Camper is P(B) = 0.28
#A camper with Canadian license plates is P(A and B) = 0.09
#(a)
# The probability of a camper entering the Luray Caverns has Canadian license plates is P(A|B) = P(A and B)/ P(B) = 0.09/0.28 = 0.32143 
P1 <- 0.09/0.28
#(b)
#The probability of a vehicle with Canadian license plates entering the Luray Caverns is a camper is P(B|A) = P(A and B)/P(A) = 0.09/0.12 = 0.75
P2 <- 0.09/0.12
#(c)
# The probability of a vehicle entering the Luray Caverns does not have Canadian plates or is not a camper is : P(A'OR B') = 1- P(A and B) = 1-0.09 =0.91
P3 <- 1-0.09

#problem7
pl <- 0.75
ps <- 1-0.75
prl <- 0.6
prs <- 0.3
plr <- (0.6*0.75)/(0.6*0.75+0.3*0.25)

#problem8
#answer and processes are in doc file
