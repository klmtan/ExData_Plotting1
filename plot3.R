#Created by Katherine Tan

#Read data file
data <- read.csv("household_power_consumption.txt",header=T,sep=";")

#get only from 1/2/2007 and 2/2/2007
dataview <-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#convert the time into date time format 
datetime <- strptime(paste(dataview$Date, dataview$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#converting the sub metering 1, 2 and 3 to character and numeric
dataview$Sub_metering_1 <- as.character(dataview$Sub_metering_1)
dataview$Sub_metering_1 <- as.numeric(dataview$Sub_metering_1)

dataview$Sub_metering_2 <- as.character(dataview$Sub_metering_2)
dataview$Sub_metering_2 <- as.numeric(dataview$Sub_metering_2)

dataview$Sub_metering_3 <- as.character(dataview$Sub_metering_3)
dataview$Sub_metering_3 <- as.numeric(dataview$Sub_metering_3)

#print to png 
png("plot3.png",width = 480, height = 480)


#plotting the submeter 1 and then adding lines for sub meter 2 and 3
plot(datetime,dataview$Sub_metering_1,type='l',ylab="Energy sub metering",xlab=" ")
lines(datetime,dataview$Sub_metering_2,type='l',col="red")
lines(datetime,dataview$Sub_metering_3,type='l',col="blue")

#putting legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

#removes the png device
dev.off()