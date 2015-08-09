# Read in data with relevante parameters for separator, NAs, header, column classes
all <- read.table("household_power_consumption.txt", 
                  sep=";", 
                  header=TRUE, 
                  na.strings="?",
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# Take subset of data to plot for assigned dates
x <- subset(all, (Date == "1/2/2007" | Date == "2/2/2007"))

# write histogram to a PNG file
png(file="plot1.png")
with(x, hist(x$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
