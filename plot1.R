#Created by Katherine Tan

#Read data file
data <- read.csv("household_power_consumption.txt",header=T,sep=";")
#convert the date column into date
data$Date <- as.Date(data$Date,'%d/%m/%Y')

#get only from 1/2/2007 and 2/2/2007
dataview <-subset(data,data$Date==as.Date('2007-02-01') | data$Date==as.Date('2007-02-02'))

#elimintae the ? and turn them to NA via numeric
dataview$Global_active_power <- as.character(dataview$Global_active_power)
dataview$Global_active_power <- as.numeric(dataview$Global_active_power)

png("plot1.png",width = 480, height = 480)
#make histogram
hist(dataview$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#removes the png device
dev.off()



