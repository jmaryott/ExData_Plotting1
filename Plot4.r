# Code to generate Plot 4 of Week 1 assignment for Exploratory Data Analysis Coursera course
# Read in the data file -> assumes that the  file is in your working directory and is called 
# household_power_consumption.txt:
# As of 1/1/17, data file can be found at
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
householdElecUse=read.csv('household_power_consumption.txt', header = TRUE, sep = ";", quote = "\"", 
                          dec = ".", fill = TRUE, na.strings = c("?"))

# Subset the data to only use the 2 days that we are interested in (2007-01-02 and 2007-02-02)
twoDayPeriod= householdElecUse[which(householdElecUse$Date == '1/2/2007'| householdElecUse$Date == 
                                         '2/2/2007'),]

# Generate plot 4
# 4 graphs, from top to bottom and left to right, for the 2 day period:
# Plot2, Plot 3, voltage across timestamps, and global reactive power across timestamps.
# Generate the x axis (the timestamps) by pasting the Date and Time together and then converting 
# to a timestamp with the correct format
timepoints=strptime(paste(droplevels(twoDayPeriod$Date), twoDayPeriod$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "Plot4.png",
    width = 480, height = 480, units = "px")
par(mfcol=c(2,2))
# Top left is same as plot 2 (Line graph of timestamp of collection and Global Active Power)
plot(timepoints, twoDayPeriod$Global_active_power, type = "l", 
     ylab = 'Global Active Power', xlab='')
# Bottom left is same as Plot 3 (Line graph of timestamp of collection with 3 measurements, 
# one for each submetering category)
plot(timepoints, twoDayPeriod$Sub_metering_1, type = "l", 
     ylab = 'Energy sub metering', xlab='')
points(timepoints, twoDayPeriod$Sub_metering_2, type = "l", 
       ylab = 'Energy sub metering', xlab='', col="red")
points(timepoints, twoDayPeriod$Sub_metering_3, type = "l", 
       ylab = 'Energy sub metering', xlab='', col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1), bty='n', col = c("black", "red", "blue"))
# Top right voltage for all timestamps in the 2 day period
plot(timepoints, twoDayPeriod$Voltage, type = "l", 
     xlab='datetime', ylab='Voltage')
# Bottom right global reactive power for all timestamps in the 2 day period
plot(timepoints, twoDayPeriod$Global_reactive_power, type = "l", 
     xlab='datetime', ylab='Global_reactive_power')
dev.off()