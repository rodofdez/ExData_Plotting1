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


#plot4
jpeg("plot4.jpg")
par(mfrow=c(2,2))
##the one from plot 2
plot(1:2880, subset.power[,3], type = "l", xaxt = "n", xlab="", ylab = "Global Active Power (kilowatts)", cex.axis = 0.7)
axis(1, at= c(1, 1440, 2880), labels= c("Thu", "Fri", "Sat"), pos=0, cex.axis = 1) 
##second plot in the grid
plot(1:2880, subset.power[,5], type = "l", xaxt = "n", xlab="datetime", ylab = "Voltage", cex.axis = 0.7)
axis(1, at= c(1, 1440, 2880), labels= c("Thu", "Fri", "Sat"), pos=232.5, cex.axis = 1) 


##the one from plot 3
plot(1:2880, subset.power[,7], type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering", cex.axis = 0.7)
axis(1, at= c(1, 1440, 2880), labels= c("Thu", "Fri", "Sat"), pos=0, cex.axis = 1) 
lines(1:2880, subset.power[,8], type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering", cex.axis = 0.7, col = "red")
lines(1:2880, subset.power[,9], type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering", cex.axis = 0.7, col = "blue")
legend(1400,50, legend = names(subset.power)[7:9], col = c("black", "red", "blue"), cex = 1, lty = 1, bty = "n", y.intersp = 0.2)

##fourth plot in the grid
plot(1:2880, subset.power[,4], type = "l", xaxt = "n", xlab="datetime", ylab = "Global_reactive_power" ,cex.axis = 0.7)
axis(1, at= c(1, 1440, 2880), labels= c("Thu", "Fri", "Sat"), pos=0, cex.axis = 1) 
dev.off()
