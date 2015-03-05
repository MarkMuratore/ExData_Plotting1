 setwd("~/Desktop/Coursera/Exploratory Data Analysis/Course Project 1")

### Read data 
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, na.strings = "?", sep = ";")

### Extract only the required days from the data set
data_sub <- subset(data, Date=="1/2/2007" | Date =="2/2/2007")

### Combine and format the date and time and add 
### to the original data set
datetime <- paste(data_sub$Date, data_sub$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
data_sub <- cbind(data_sub, datetime)
data_sub$Date <- as.Date(data_sub$Date, "%d/%m/%Y") 

### Create plot and copy to working directory
png("plot4.png")
par(mfrow = c(2, 2))
plot(data_sub$datetime, data_sub$Global_active_power, 
     type = "l", xlab="", ylab="Global Active Power")      
plot(data_sub$datetime, data_sub$Voltage, type = "l", 
xlab="datetime", ylab="Voltage")
plot(data_sub$datetime, data_sub$Sub_metering_1, type = "l",
      xlab="", ylab="Energy sub metering")
lines(data_sub$datetime, data_sub$Sub_metering_2, type = "l",
       col = "red")
lines(data_sub$datetime, data_sub$Sub_metering_3, type = "l",
       col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=1.5, col = c("black", "red", "blue"),
       bty = "n") 
plot(data_sub$datetime, data_sub$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()