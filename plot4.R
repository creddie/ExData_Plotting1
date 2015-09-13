makePlot4 <- function(){
	#Load Data
	baseData <- read.csv("household_power_consumption.txt", sep = ";")
	
	#Convert Column to Date
	baseData$Date <- as.Date(baseData$Date , "%d/%m/%Y")
	baseData$DateTime  <- as.POSIXlt(paste( baseData$Date, baseData$Time))
	
	#plot the chart
	par(mfrow = c(2, 2))
	
	
	#1
	plot(y= baseData$Global_active_power, x = baseData$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
	
	#2
	plot(y= baseData$Voltage, x = baseData$DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
	
	
	#3
	plot(y= baseData$Sub_metering_1, x = baseData$DateTime, type = "l", ylab = "Energy sub metering", xlab = "", col = "Black")
	lines(y= baseData$Sub_metering_2, x = baseData$DateTime, col="red", type = "l", lty = 1, pch=22)
	lines(y= baseData$Sub_metering_3, x = baseData$DateTime, col="blue", type = "l", lty = 1, pch=22)
	
	legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	#4
	plot(y= baseData$Global_reactive_power, x = baseData$DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

	#export the PNG
	dev.copy(png, file = "plot4.png")
	dev.off()
}
