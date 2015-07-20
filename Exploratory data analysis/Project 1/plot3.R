#
require("dplyr")

# The UCI file was downloaded to the local directory
setwd("/Users/edwardlau/Documents/Courses and Webinar/Coursea/Exploratory data analysis/Project 1/")

# Read the dataset
dataset <- read.table("household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE)

glimpse(dataset)

subset <- filter(dataset, Date == "1/2/2007" | Date == "2/2/2007")

subset$DateTime <- paste(subset$Date, subset$Time)
subset$DateTime <- strptime(subset$DateTime, format="%d/%m/%Y %H:%M:%S")

#png(filename="plot1.png")
#hist(as.numeric(subset$Global_active_power), 
#     col="red", main="Global Active Power",
#     xlab="Global Active Power (kilowatts)")
#dev.off()

#png(filename="plot2.png")
#plot(subset$DateTime, subset$Global_active_power, type="l", 
#     xlab= "",ylab = 'Global Active Power (kilowatts)')
#dev.off()


png(filename="plot3.png")
plot(subset$DateTime, subset$Sub_metering_1, type="l", 
     xlab= "",ylab = 'Energy sub metering')
lines(subset$DateTime,subset$Sub_metering_2, col="red")
lines(subset$DateTime,subset$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

