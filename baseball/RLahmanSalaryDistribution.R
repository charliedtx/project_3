#installing the Lahman package for our data 
install.packages("Lahman")

#importing the libraries neccesary for data wrangling and plotting
library(Lahman)
library(ggplot2)

#choosing the Salary data
data(Salaries)

#creating a box and whisker chart with salary data. I divided the salaries by 100,000 to make viewing easier
ggplot(Salaries, aes(x = factor(yearID), y = salary/1e5)) +
  #inserting the color in the boxplot, and including outlier size
  geom_boxplot(fill = "darkgoldenrod1", outlier.size = 1) +
  #creating labels for the chart
  labs(title = "Salary Distribution in Major League Baseball", x = "Year", y = "Individual Salary x $100,000") +
  #altering the domain and range to be more readable
  scale_x_discrete(breaks = seq(1985, 2015, by = 5)) +
  scale_y_continuous(breaks = seq(50, 400, by = 50))


