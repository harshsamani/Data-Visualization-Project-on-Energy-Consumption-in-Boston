library("shiny")
library("plyr")
library("ggplot2")


setwd("/Users/harshsamani/Desktop/Masters/Communication & Visualization/")
my_data <- read.csv("House_Price_data.csv") # load the dataframe
my_data <- subset(my_data, select = -c(1))


View(my_data)
names(my_data)

library(ggplot2)
ggplot(my_data, aes(x = Neighborhood , y = SalePrice, fill = Neighborhood)) +
  geom_histogram(stat = "identity") + theme(legend.position="right") + labs(title = "Histogram for Saleprice VS Neighborhood")


ggplot(my_data, aes(x = SaleCondition, y = SalePrice, colour = my_data$SaleCondition)) + geom_point()


ggplot(my_data, aes(x = YrSold, y = SalePrice)) + geom_bar(stat = "identity")

ggplot(my_data, aes(x = TotalBsmtSF, y = SalePrice)) + geom_point()

ggplot(my_data, aes(x = MSZoning, y = LotArea)) + geom_histogram(stat = "identity")

ggplot(my_data, aes(x= B))

 


