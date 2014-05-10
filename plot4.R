data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, comment.char="", colClasses=classes, na.strings="?")
subdata <- subset(data, Date=="1/2/2007" | Date=="2/2/2007" )
subdata[,2] <- paste(subdata[,1],subdata[,2]);
subdata <- transform(subdata, Date=as.Date(Date, format='%d/%m/%Y'), Time=strptime(Time, "%d/%m/%Y %H:%M:%S"));
par(mfrow=c(2,2))
with(subdata, plot(Time, Global_active_power, type="s", xlab="", ylab="Global Active Power"))
with(subdata, plot(Time, Voltage, type="s", xlab="datetime", ylab="Voltage"))
with(subdata, plot(Time, Sub_metering_1, type="s", xlab="", ylab="Energy sub metering"))
with(subdata, lines(Time, Sub_metering_2, col="red", type="s"))
with(subdata, lines(Time, Sub_metering_3, col="blue", type="s"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), pt.cex = 1, cex=0.6, col=c("black","red", "blue"))
with(subdata, plot(Time, Global_reactive_power, type="s", xlab="datetime", ylab="Global_reactive_power"))
dev.copy(png, file = "plot4.png")
dev.off()