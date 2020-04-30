
setwd("C:/Users/user/Documents/R/Coursera/Data_Exploration_Week_4")
library(dplyr)
library(bindrcpp)
library(ggplot2)


baltdata <- NEI_data[NEI_data$fips=="24510", ]
baltYrEmm <- aggregate(Emissions ~ year, baltdata, sum)



baltYrTypEmm <- aggregate(Emissions ~ year+ type, baltdata, sum)
chart <- ggplot(baltYrTypEmm, aes(year, Emissions, color = type))
chart <- chart + geom_line() +
  xlab("year") +
  ylab(expression('Total Emissions')) +
  ggtitle('Total Baltimore Emissions [2.5]* From 1999 to 2008')
print(chart)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()