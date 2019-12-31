#Plot multiple data in same graph

data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors = FALSE,na.strings = "?")
data$Time <- format(data$Time,format="%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
febdata <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
febdata$DateTime <- paste(febdata$Date, febdata$Time)
febdata$DateTime <- strptime(febdata$DateTime,format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png",width=480,height=480)
plot(febdata$DateTime,febdata$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab = "")
lines(febdata$DateTime,febdata$Sub_metering_2,col="red")
lines(febdata$DateTime,febdata$Sub_metering_3,col="blue")
legend(x="topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()