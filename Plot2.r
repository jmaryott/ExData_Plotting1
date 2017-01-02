# Code to generate Plot 2 of Week 1 assignment for Exploratory Data Analysis Coursera course
# Read in the data file -> assumes that the  file is in your working directory and is called 
# household_power_consumption.txt:
# As of 1/1/17, data file can be found at
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
householdElecUse=read.csv('household_power_consumption.txt', header = TRUE, sep = ";", quote = "\"", 
                          dec = ".", fill = TRUE, na.strings = c("?"))

# Subset the data to only use the 2 days that we are interested in (2007-01-02 and 2007-02-02)
twoDayPeriod= householdElecUse[which(householdElecUse$Date == '1/2/2007'| householdElecUse$Date == 
                                         '2/2/2007'),]

# Generate plot 2
# Line graph of timestamp of collection and Global Active Power
# Generate the x axis (the timestamps for the 2 day period) by pasting the Date and Time together and then converting 
# to a timestamp with the correct format
timepoints=strptime(paste(droplevels(twoDayPeriod$Date), twoDayPeriod$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "Plot2.png",
    width = 480, height = 480, units = "px")
plot(timepoints, twoDayPeriod$Global_active_power, type = "l", 
     ylab = 'Global Active Power (kilowatts)', xlab='')
dev.off()