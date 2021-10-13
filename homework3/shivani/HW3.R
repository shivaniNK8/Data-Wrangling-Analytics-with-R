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


