# Assignment 1 - Plot 4

#Extracts data from zip file
if (!file.exists("data")) {
  dir.create("data")
}
if (!file.exists(paste("data//", list.files("data"), sep = ""))) {
  unzip("exdata-data-household_power_consumption.zip", exdir = "data")
}

# Read UCI data from zip file
UCIdata <- read.table(paste("data//", list.files("data"), sep = ""),
                      sep = ";",
                      header = TRUE,
                      stringsAsFactors = FALSE)

# Select date of study and subset
library(lubridate)
day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")
vect <- as.Date(dmy(UCIdata$Date)) == day1 | as.Date(dmy(UCIdata$Date)) == day2

data1 <- UCIdata[vect,]
rm(UCIdata)

# Plot 4
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))
plot(data1$Global_active_power, 
     type = "l", 
     xaxt = "n",
     ylab = "Global Active Power",
     xlab = "")
axis(1, at=seq(0,length(data1$Date), by=length(data1$Date)/2),
     labels=c("Thu","Fri","Sat"))
plot(data1$Voltage, 
     type = "l", 
     xaxt = "n",
     ylab = "Voltage",
     xlab = "datetime")
axis(1, at=seq(0,length(data1$Date), by=length(data1$Date)/2),
     labels=c("Thu","Fri","Sat"))
plot(data1$Sub_metering_1, 
     type = "l", 
     xaxt = "n",
     ylab = "Energy sub metering", 
     xlab = "")
axis(1, at=seq(0,length(data1$Date), by=length(data1$Date)/2),
     labels=c("Thu","Fri","Sat"))
lines(data1$Sub_metering_2, 
      type = "l", 
      xaxt = "n",
      col = "red")
lines(data1$Sub_metering_3, 
      type = "l", 
      xaxt = "n",
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
plot(data1$Global_reactive_power, 
     type = "l", 
     xaxt = "n",
     xlab = "datetime")
axis(1, at=seq(0,length(data1$Date), by=length(data1$Date)/2),
     labels=c("Thu","Fri","Sat"))

dev.off()