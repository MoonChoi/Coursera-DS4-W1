pData <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
wDataInit <- pData[pData$Date %in% c("1/2/2007","2/2/2007"),]
wData <- transform(wDataInit, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

par(mfrow = c(2, 2))

with(wData , plot(Time, Global_active_power, type = "n", xlab = "", ylab="Global Active Power"), pch =0)
lines(wData$Time, wData $Global_active_power, col ="black")

with(wData , plot(Time, Voltage, type = "n", xlab = "datetime", ylab="Voltage"), pch =0)
lines(wData$Time, wData $Voltage, col ="black")

with(wData , plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"), pch = 0)
lines(wData$Time, wData$Sub_metering_1, col ="black")
lines(wData$Time, wData$Sub_metering_2, col ="red")
lines(wData$Time, wData$Sub_metering_3, col ="blue")

legend("topright", lty = 1, box.lty=0, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

with(wData , plot(Time, Global_reactive_power , type = "n", xlab = "datetime", ylab="Global_reactive_power"), pch =0)
lines(wData$Time, wData $Global_reactive_power , col ="black")

dev.copy(png,file = "plot4.png", width = 480, height = 480)
  
dev.off()