#Second Plot

##Importing and Subsetting Dataset

data <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

SubData <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

##Transforming Dates

SubData$Date3 <- as.character(SubData$Date)

SubData$Time3<- as.character(SubData$Time)

SubData$datetime <- strptime(paste(SubData$Date3, SubData$Time3), "%d/%m/%Y %H:%M:%S")

##Creating Plot

png(file = "Plot2.png", width = 480, height = 480, units = "px")

plot (x= SubData$datetime, y = SubData$Global_active_power,
      ylab = 'Global Active power (kilowatts)',
      xlab ='  ',
      type = "l")
