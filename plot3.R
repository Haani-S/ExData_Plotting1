library(data.table)
data<-data.table::fread("household_power_consumption.txt",na.strings="?")
data=as.data.frame(data)
data= data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(data)
data$Date<-dmy(data$Date)
datetime<-paste(data$Date,data$Time)
data$Datetime<-as.POSIXct(datetime)

#plot3
png("plot3.png")
plot(data$Datetime,data$Sub_metering_1,xlab ="",ylab ="Global Active Power (kilowatts)",type="l")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3 ,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2)
dev.off()