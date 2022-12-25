library(data.table) ## Loads data.table package
setwd("~/Desktop/Exploratory Data Analysis Project 1") ## sets working directory

## reads in the data file
powerconsumption <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

## initializing a new png graphics object 480 wide and 480 high
png("plot3.png", width=480, height=480)

## converting the data in Date column and Time column into one variable
powerconsumption[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
]

## truncating powerconsumption datatable to just February 1-2, 2007.
powerconsumption <-powerconsumption [(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

## create a plot showing Energy consumption by sub metering for sub-meters 1, 2, & 3
plot(powerconsumption[, DateTime], powerconsumption[,Sub_metering_1], type ="l", xlab = "", ylab = "Energy sub metering") 
lines(powerconsumption[, DateTime], powerconsumption[, Sub_metering_2], col = "Red") 
lines(powerconsumption[, DateTime], powerconsumption[, Sub_metering_3], col = "Blue")

## creates a legend for the plot
legend("topright", col = c("Black", "Red", "Blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1))

## closes the png graphics device
dev.off()
