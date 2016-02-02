# Assignment 1 - Plot 1

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

# Plot 1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(as.numeric(data1$Global_active_power), 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()