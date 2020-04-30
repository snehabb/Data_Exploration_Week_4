setwd("C:/Users/user/Documents/R/Coursera/Data_Exploration_Week_4")
library(dplyr)
library(bindrcpp)
library(ggplot2)
NEI_data <- readRDS("summarySCC_PM25.rds")

SCC_data <- readRDS("Source_Classification_Code.rds")

yearly_emmissions <- aggregate(Emissions ~ year, NEI_data, sum)
cols <- brewer.pal(4,"BuGn")
barplot(height=yearly_emmissions$Emissions/1000, names.arg=yearly_emmissions$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Aggregated PM'[2.5]*' Emmissions by Year'), col = cols)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()