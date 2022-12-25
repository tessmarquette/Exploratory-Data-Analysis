library(data.table) ## Loads data.table package
setwd("~/Desktop/Exploratory Data Analysis Project 1") ## sets working directory

## reads in the data file
powerconsumption <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

## initializing a new png graphics object 480 wide and 480 high
png("plot1.png", width=480, height=480)

## converting the data in Date column to type date
powerconsumption[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

## truncating powerconsumption datatable to just February 1-2, 2007.
powerconsumption <-powerconsumption [(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## create a histogram showing of Global Active Power (in kW)
hist(powerconsumption[, Global_active_power], main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")


## closes the png graphics device
dev.off()
