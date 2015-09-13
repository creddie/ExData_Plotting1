makePlot3 <- function(){
	#Load Data
	baseData <- read.csv("household_power_consumption.txt", sep = ";")
	
	#Convert Column to Date
	baseData$Date <- as.Date(baseData$Date , "%d/%m/%Y")
	baseData$DateTime  <- as.POSIXlt(paste( baseData$Date, baseData$Time))
	
	#plot the chart
	plot(y= baseData$Sub_metering_1, x = baseData$DateTime, type = "l", ylab = "Energy sub metering", xlab = "", col = "Black")
	lines(y= baseData$Sub_metering_2, x = baseData$DateTime, col="red", type = "l", lty = 1, pch=22)
	lines(y= baseData$Sub_metering_3, x = baseData$DateTime, col="blue", type = "l", lty = 1, pch=22)
	
	legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	#export the PNG
	dev.copy(png, file = "plot3.png")
	dev.off()
}
