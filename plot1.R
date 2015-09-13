makePlot1 <- function(){
  #Load Data
  baseData <- read.csv("household_power_consumption.txt", sep = ";")
  
  #Convert Column to Date
  baseData$Date <- as.Date(baseData$Date , "%m/%d/%Y")
  
  #create de chart
  hist(baseData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frecuency", col = "red" , main = "Global Active Power")

  #export the PNG
  dev.copy(png, file = "plot1.png")
  dev.off()
  
  }

