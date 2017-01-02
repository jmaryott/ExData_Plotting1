# Code to generate Plot 1 of Week 1 assignment for Exploratory Data Analysis Coursera course
# Read in the data file -> assumes that the  file is in your working directory and is called 
# household_power_consumption.txt:
# As of 1/1/17, data file can be found at
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
householdElecUse=read.csv('household_power_consumption.txt', header = TRUE, sep = ";", quote = "\"", 
                       dec = ".", fill = TRUE, na.strings = c("?"))

# Subset the data to only use the 2 days that we are interested in (2007-01-02 and 2007-02-02)
twoDayPeriod= householdElecUse[which(householdElecUse$Date == '1/2/2007'| householdElecUse$Date == 
                                         '2/2/2007'),]

# Generate Plot 1
# Histogram of Global Active power for the 2 days in question.
png(filename = "Plot1.png",
    width = 480, height = 480, units = "px")
hist(twoDayPeriod$Global_active_power, col='red', main = 
         'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()