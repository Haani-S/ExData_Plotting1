library(data.table)
data<-data.table::fread("household_power_consumption.txt",na.strings="?")
data=as.data.frame(data)
data= data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(data)
data$Date<-dmy(data$Date)

datetime<-paste(data$Date,data$Time)
data$Datetime<-as.POSIXct(datetime)

#plot4
png("plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
plot(data$Datetime,data$Global_active_power,ylab="Global Active Power",xlab="",type="l")
plot(data$Datetime,data$Voltage,ylab="Voltage",xlab="datetime",type="l")
plot(data$Datetime,data$Sub_metering_1,xlab ="",ylab ="Energy sub metering",type="l")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3 ,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2)
plot(data$Datetime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
