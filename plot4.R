# Read in date-specific subset of data with relevante parameters for separator, NAs, header, column classes
x <- subset(
        read.table("household_power_consumption.txt", 
                   sep=";", 
                   header=TRUE, 
                   na.strings="?",
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")),
        (Date == "1/2/2007" | Date == "2/2/2007"))
# Create Date/Time formatted variables from Date and Time variables
datetime <- paste(x$Date, x$Time)
x$Datetime = strptime(datetime, format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfcol=c(2,2))
with(x, plot(x$Datetime, x$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))

with(x, plot(x$Datetime, x$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(x$Datetime, x$Sub_metering_2, col="red")
lines(x$Datetime, x$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

with(x, plot(x$Datetime, x$Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(x, plot(x$Datetime, x$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()