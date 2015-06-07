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

#Set PNG export
png(filename = "plot3.png", width = 480, height = 480)

#Create empty plot
plot(subpower$Date_time, subpower$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
#Add points
points(subpower$Date_time, subpower$Sub_metering_1, type="l", col="black")
points(subpower$Date_time, subpower$Sub_metering_2, type="l", col="red")
points(subpower$Date_time, subpower$Sub_metering_3, type="l", col="blue")

legend("topright", pch=c("__", "___", "___"), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
