#
require("dplyr")

# The UCI file was downloaded to the local directory
setwd("/Users/edwardlau/Documents/Courses and Webinar/Coursea/Exploratory data analysis/Project 1/")

# Read the dataset
dataset <- read.table("household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE)

glimpse(dataset)

subset <- filter(dataset, Date == "1/2/2007" | Date == "2/2/2007")

hist(subset$Global_active_power)

png(filename="plot1.png")
hist(as.numeric(subset$Global_active_power), 
     col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()


