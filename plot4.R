# Plot subgraphs

data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors = FALSE,na.strings = "?")
data$Time <- format(data$Time,format="%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
febdata <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
febdata$DateTime <- paste(febdata$Date, febdata$Time)
febdata$DateTime <- strptime(febdata$DateTime,format="%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(febdata$DateTime,febdata$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(febdata$DateTime,febdata$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(febdata$DateTime,febdata$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab = "")
lines(febdata$DateTime,febdata$Sub_metering_2,col="red")
lines(febdata$DateTime,febdata$Sub_metering_3,col="blue")
legend(x="topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n",y.intersp = 0.8)

plot(febdata$DateTime,febdata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()