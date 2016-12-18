pData <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
wDataInit <- pData[pData$Date %in% c("1/2/2007","2/2/2007"),]
wData <- transform(wDataInit, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

with(wData , plot(Time, Sub_metering_1, type = "n", ylab = "Global Active Power (kilowatts)"), pch = 0)

lines(wData$Time, wData$Sub_metering_1, col ="black")
lines(wData$Time, wData$Sub_metering_2, col ="red")
lines(wData$Time, wData$Sub_metering_3, col ="blue")

legend("topright",lty = c(1,2), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
dev.copy(png,file = "plot3.png", width = 480, height = 480)
  
dev.off()