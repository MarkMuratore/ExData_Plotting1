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

### Create plot and save image to working directory 
png("plot2.png")
plot(data_sub$datetime, data_sub$Global_active_power, 
     type = "l", xlab="", ylab="Global Active Power (kilowatts)")    
dev.off()