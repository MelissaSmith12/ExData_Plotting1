#This program reads the file Electric Power Consumption file from the Coursera
#Exploratory Graphics course from the working directory and processes it to produce
#the indicated graphics.

library("dplyr")

#Read the file
file="household_power_consumption.txt"
power <- read.csv(file, header=TRUE, sep=";", stringsAsFactors=FALSE)

#Transform the Date column from characters into dates
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Subset to select only the dates needed
subpower <- filter(power, Date=="2007-02-01" | Date=="2007-02-02")

#Transform variables for graphing purposes
subpower$Date_time <- paste(subpower$Date, subpower$Time)
subpower$Date_time <- strptime(subpower$Date_time, format="%Y-%m-%d %H:%M:%S")
subpower$Global_active_power <- as.numeric(subpower$Global_active_power)

#Set 1st PNG export
png(filename = "plot1.png", width = 480, height = 480)

#Create 1st plot
hist(subpower$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()