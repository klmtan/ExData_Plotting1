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

#converting the sub metering 1, 2 and 3 to character and numeric
dataview$Sub_metering_1 <- as.character(dataview$Sub_metering_1)
dataview$Sub_metering_1 <- as.numeric(dataview$Sub_metering_1)

dataview$Sub_metering_2 <- as.character(dataview$Sub_metering_2)
dataview$Sub_metering_2 <- as.numeric(dataview$Sub_metering_2)

dataview$Sub_metering_3 <- as.character(dataview$Sub_metering_3)
dataview$Sub_metering_3 <- as.numeric(dataview$Sub_metering_3)

#Voltage convertion
dataview$Voltage <- as.character(dataview$Voltage)
dataview$Voltage <- as.numeric(dataview$Voltage)

#Global Reactive Power
dataview$Global_reactive_power <- as.character(dataview$Global_reactive_power)
dataview$Global_reactive_power <- as.numeric(dataview$Global_reactive_power)


#print to png 
png("plot4.png",width = 480, height = 480)
par(mfcol=c(2,2))


plot(datetime,dataview$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab=" ")

plot(datetime,dataview$Sub_metering_1,type='l',ylab="Energy sub metering",xlab=" ")
lines(datetime,dataview$Sub_metering_2,type='l',col="red")
lines(datetime,dataview$Sub_metering_3,type='l',col="blue")
#putting legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

plot(datetime,dataview$Voltage,type='l',ylab="Voltage",xlab="datetime")
plot(datetime,dataview$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")


#removes the png device
dev.off()