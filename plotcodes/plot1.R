rm(list = ls())

setwd("/Users/rodolfofernandez/Desktop")

power_cosum <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
names(power_cosum)
dim(power_cosum)
head(power_cosum)

##data from the dates 2007-02-01 and 2007-02-02.
start_date <- which(power_cosum[,1] == "1/2/2007")
length(start_date)
end_date <- which(power_cosum[,1] == "2/2/2007")
length(start_date)

#subset of data to use
subset.power <- power_cosum[c(start_date, end_date),]
head(subset.power)
dim(subset.power)

#histogram of global active power
jpeg("plot1.jpg")
hist(subset.power[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
