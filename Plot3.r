# Code to generate Plot 3 of Week 1 assignment for Exploratory Data Analysis Coursera course
# Read in the data file -> assumes that the  file is in your working directory and is called 
# household_power_consumption.txt:
# As of 1/1/17, data file can be found at
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
householdElecUse=read.csv('household_power_consumption.txt', header = TRUE, sep = ";", quote = "\"", 
                          dec = ".", fill = TRUE, na.strings = c("?"))

# Subset the data to only use the 2 days that we are interested in (2007-01-02 and 2007-02-02)
twoDayPeriod= householdElecUse[which(householdElecUse$Date == '1/2/2007'| householdElecUse$Date == 
                                         '2/2/2007'),]

# Generate plot 3
# Line graph of timestamp of collection with 3 measurements, one for each submetering category
# Generate the x axis (the timestamps for the 2 day period) by pasting the Date and Time together and then converting 
# to a timestamp with the correct format
timepoints=strptime(paste(droplevels(twoDayPeriod$Date), twoDayPeriod$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "Plot3.png",
    width = 480, height = 480, units = "px")
# Plot sub metering 1
plot(timepoints, twoDayPeriod$Sub_metering_1, type = "l", 
     ylab = 'Energy sub metering', xlab='')
# Plot sub metering 2
points(timepoints, twoDayPeriod$Sub_metering_2, type = "l", 
       ylab = 'Energy sub metering', xlab='', col="red")
# Plot sub metering 3
points(timepoints, twoDayPeriod$Sub_metering_3, type = "l", 
       ylab = 'Energy sub metering', xlab='', col="blue")
# Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1), col = c("black", "red", "blue"))
dev.off()
