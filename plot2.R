library(data.table)
data<-data.table::fread("household_power_consumption.txt",na.strings="?")
data=as.data.frame(data)
data= data[data$Date %in% c("1/2/2007","2/2/2007"),]
head(data)
data$Date<-dmy(data$Date)
#plot2

datetime<-paste(data$Date,data$Time)
data$Datetime<-as.POSIXct(datetime)
png("plot2.png",480,480)
plot(data$Datetime,data$Global_active_power,ylab="Global Active Power (kilowatt)",xlab="",type="l")
dev.off()