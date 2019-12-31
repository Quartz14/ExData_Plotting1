#plo histogram

data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors = FALSE,na.strings = "?")
data$Time <- format(data$Time,format="%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
febdata <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
febdata$DateTime <- paste(febdata$Date, febdata$Time)
febdata$DateTime <- strptime(febdata$DateTime,format="%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png",width=480,height=480)
hist(as.numeric(febdata$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()







