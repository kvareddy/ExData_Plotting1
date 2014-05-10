data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, comment.char="", colClasses=classes, na.strings="?")
subdata <- subset(data, Date=="1/2/2007" | Date=="2/2/2007" )
subdata[,2] <- paste(subdata[,1],subdata[,2]);
subdata <- transform(subdata, Date=as.Date(Date, format='%d/%m/%Y'), Time=strptime(Time, "%d/%m/%Y %H:%M:%S"));
with(subdata, plot(Time, Global_active_power, type="s", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()