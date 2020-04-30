setwd("C:/Users/user/Documents/R/Coursera/Data_Exploration_Week_4")
library(dplyr)
library(bindrcpp)
library(ggplot2)



baltdata <- NEI_data[NEI_data$fips=="24510", ]
baltYrEmm <- aggregate(Emissions ~ year, baltdata, sum)
cols1 <- brewer.pal(4,"BuGn")
barplot(height=baltYrEmm$Emissions/1000, names.arg=baltYrEmm$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Baltimore Aggregated PM'[2.5]*' Emmissions by Year'), col = cols1)
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()