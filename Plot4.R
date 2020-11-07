##Importing and Subsetting Dataset

data <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

SubData <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

##Organizing Data
SubData$Date3 <- as.character(SubData$Date)

SubData$Time3<- as.character(SubData$Time)

SubData$datetime <- strptime(paste(SubData$Date3, SubData$Time3), "%d/%m/%Y %H:%M:%S")

SubData$Sub_metering_1 <- as.numeric(as.character(SubData$Sub_metering_1))

SubData$Sub_metering_2 <- as.numeric(as.character(SubData$Sub_metering_2))

##Setting Plot

png(file = "Plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

par(mar = c(4,4,2,1))

##Creating Plot

###Plot 1
hist(as.numeric(as.character(SubData$Global_active_power)),
     col="red",
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

###Plot 2
plot (x= SubData$datetime, y = SubData$Global_active_power,
      ylab = 'Global Active power (kilowatts)',
      xlab ='  ',
      type = "l")

###Plot 3
plot (x= SubData$datetime, y = SubData$Sub_metering_1,
      ylab = 'Energy sub metering',
      xlab ='  ',
      type = "l")

legend("topright" , lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

lines(x= SubData$datetime, y = SubData$Sub_metering_2, col = "red")

lines(x= SubData$datetime, y = SubData$Sub_metering_3, col = "blue")

###Plot 4
plot (x= SubData$datetime, y = SubData$Global_reactive_power,
      ylab = 'Global_reactive_power',
      xlab ='datetime',
      ylim = range(0,0.5),
      type = "l")
