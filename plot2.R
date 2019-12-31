#Plot line graph

data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors = FALSE,na.strings = "?")
data$Time <- format(data$Time,format="%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
febdata <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
febdata$DateTime <- paste(febdata$Date, febdata$Time)
febdata$DateTime <- strptime(febdata$DateTime,format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",width=480,height=480)
plot(febdata$DateTime,febdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()