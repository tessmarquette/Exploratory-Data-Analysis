library(data.table) ## Loads data.table package
setwd("~/Desktop/Exploratory Data Analysis Project 1") ## sets working directory

## reads in the data file
powerconsumption <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

## initializing a new png graphics object 480 wide and 480 high
png("plot2.png", width=480, height=480)

## converting the data in Date column and Time column into one variable
powerconsumption[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
]

## truncating powerconsumption datatable to just February 1-2, 2007.
powerconsumption <-powerconsumption [(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

## create a plot showing of Global Active Power (in kW) usage Thursday - Saturday
plot(x = powerconsumption[, DateTime], y = powerconsumption[, Global_active_power], type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")


## closes the png graphics device
dev.off()
