#Group 7
#We have used R as a calculator for Problems 2-7. 
#Detailed solutions with formulas are in th doc file submission

#Problem 1
library(ggplot2)

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
hist(staff_salaries, breaks = 9)

#(c) Stem and leaf display, using scale 0.5 to place line at the decimal point. 
#The decimal places will be rounded off after 1st digit to the right of decimal point
stem(staff_salaries, scale = 0.5)

#(d) Box plot
#Using ggplot2
ggplot(df, aes(x = "", y=staff_salaries))+geom_boxplot()
#Using base R
boxplot(staff_salaries, data = df)

#Problem 2
print(factorial(9))

#Problem 3
#Total number of ways no 2 students will have birthdays on the same day = 365P60
#Detail solution in doc file, 365P60 is a huge number to calculate for R

#Problem 4
# (a) Probability that customer will invest in either tax-free bonds or mutual funds 
0.6 + 0.3 - 0.15

# (b) Probability that customer will invest in neither tax-free bonds nor mutual funds
1 - 0.75

#Problem 5
#(a) Probability of holding 3 aces
total <- choose(52, 5)
ans <- choose(4, 3) * choose(48, 2) / total
print(ans)

#(b) Probability of 4 hearts and 1 club
ans <- choose(13, 4) * choose(13, 1) / total
print(ans)

#Problem 6
#(a) Probability that a camper entering the Luray Caverns has Canadian license plate
0.09 / 0.28

#(b) Probability that a vehicle with Canadian license plates entering the Luray Caverns is a camper
0.09/0.12

#(c) Probability that a vehicle entering the Luray Caverns does not have Canadian plates or is not a camper 
1 - 0.09

#Problem 7
(0.6 * 0.75) / (0.6*0.75 + 0.3*0.25)

#Problem 8
#In the doc file