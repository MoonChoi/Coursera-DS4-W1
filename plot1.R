pData <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
wDataInit <- pData[pData$Date %in% c("1/2/2007","2/2/2007"),]
wData <- transform(wDataInit, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

gap  <- wData$Global_active_power

hist(gap,col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")

dev.copy(png,file = "plot1.png", width = 480, height = 480)
  
dev.off()