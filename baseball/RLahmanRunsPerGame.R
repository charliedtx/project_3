#lahman package stores all of the historical baseball data
install.packages("Lahman")

#importing the libraries neccesary for data wrangling and plotting
library(Lahman)
library(ggplot2)
library(dplyr)
library(grid)

#using the 'teams' data from the database
data(Teams)

RunsPerGame <- Teams %>%
  #filtering the data, only using data post 1900, removing data from the 'FL' (federal league) as to only use MLB data
  filter(yearID > 1900, lgID != "FL") %>%
  group_by(yearID) %>%
  #summarizing total runs scored and games played
  summarise(R=sum(R), G=sum(G)) %>%
  #creating a new variable to give the sum of the runs per game scored by both teams
  mutate(RPG=(R/G)*2)

#creating the plot with ggplot2
RunsPerGamePlot <- ggplot(RunsPerGame, aes(x=yearID, y=RPG)) +
  #creates scatterplot
  geom_point() +
  #creates two different smoothed conditional means with different spans, colors, and thicknesses
  geom_smooth(span = 0.4, se = FALSE, col="red", size=1) +
  geom_smooth(span = 0.15, se = FALSE, col="darkgreen", size=.2) +
  #setting the domain and range of the chart
  scale_x_continuous(breaks = seq(1900, 2015, by = 10)) +
  scale_y_continuous(limits = c(6, 12), breaks = seq(6, 12, by = 1))

#using grobs to create an on-chart legend
grob <- grobTree(textGrob("Span = 0.40", x=0.87,  y=0.09, hjust=0,
                          gp=gpar(col="red", fontsize=10, fontface="italic")))
grob2 <- grobTree(textGrob("Span = 0.15", x=0.87,  y=0.06, hjust=0,
                          gp=gpar(col="darkgreen", fontsize=10, fontface="italic")))

#Finishing off the plot with cleaner x and y axis labels, a title, and a legend
RunsPerGamePlot + annotation_custom(grob) +
  annotation_custom(grob2) +
  ggtitle("Runs Per Game in Major League Baseball") +
  theme(plot.title = element_text(size=15)) +
  xlab("Year") +
  ylab("Total Runs per Game")
  