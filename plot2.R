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
# Create file and plot and write plot to file
png(file="plot2.png")
with(x, plot(x$Datetime, x$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))
dev.off()
