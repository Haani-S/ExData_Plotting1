library(data.table)
data<-data.table::fread("household_power_consumption.txt",na.strings="?")
data=as.data.frame(data)
data= data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date<-dmy(data$Date)

#plot 1
png("plot1.png",480,480)
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()
