#Created by Katherine Tan

#Read data file
data <- read.csv("household_power_consumption.txt",header=T,sep=";")

#get only from 1/2/2007 and 2/2/2007
dataview <-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#convert the time into date time format 
datetime <- strptime(paste(dataview$Date, dataview$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#elimintae the ? and turn them to NA via numeric
dataview$Global_active_power <- as.character(dataview$Global_active_power)
dataview$Global_active_power <- as.numeric(dataview$Global_active_power)

#print to png 
png("plot2.png",width = 480, height = 480)

#plot the values
plot(datetime,dataview$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab=" ")

#removes the png device
dev.off()