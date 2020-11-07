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

##Creating Plot

par(mfrow = c(1,1))

png(file = "Plot3.png", width = 480, height = 480, units = "px")

plot (x= SubData$datetime, y = SubData$Sub_metering_1,
      ylab = 'Energy sub metering',
      xlab ='  ',
      type = "l")

legend("topright" , lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

lines(x= SubData$datetime, y = SubData$Sub_metering_2, col = "red")

lines(x= SubData$datetime, y = SubData$Sub_metering_3, col = "blue")
