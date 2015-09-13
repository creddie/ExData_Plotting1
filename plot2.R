makePlot2 <- function(){
  #Load Data
  baseData <- read.csv("household_power_consumption.txt", sep = ";")

  #Convert Column to Date
  baseData$Date <- as.Date(baseData$Date , "%d/%m/%Y")
  baseData$DateTime  <- as.POSIXlt(paste( baseData$Date, baseData$Time))

  #plot the chart
  plot(y= baseData$Global_active_power, x = baseData$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  #export the PNG
  dev.copy(png, file = "plot2.png")
  dev.off()
  }
