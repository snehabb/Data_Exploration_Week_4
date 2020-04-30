

setwd("C:/Users/user/Documents/R/Coursera/Data_Exploration_Week_4")
library(dplyr)
library(bindrcpp)
library(ggplot2)

NEI_data <- readRDS("summarySCC_PM25.rds")

SCC_data <- readRDS("Source_Classification_Code.rds")


baltdata <- NEI_data[NEI_data$fips=="24510", ]
baltYrEmm <- aggregate(Emissions ~ year, baltdata, sum)
baltYrTypEmm <- aggregate(Emissions ~ year+ type, baltdata, sum)

cols <- brewer.pal(4,"BuGn")


chart <- ggplot(baltYrTypEmm, aes(factor(year), Emissions,fill=year))
chart <- chart + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total Emissions')) + 
  ggtitle('Baltimore Motor Vehicle PM[2.5] Emissions From 1999 to 2008')
print(chart)
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()