#set working directory
setwd("/Users/wanwoeichyi/Desktop/WIE2003 ITDS/Assignment 8")

library(data.table)

#getting full dataset
DT <- fread("./household_power_consumption.txt", na.strings = "?")

DT$Date <- as.Date(DT$Date, format = "%d / %m / %Y")

#subsetting the data
DT.filter <- subset(DT, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT)

#converting dates
datetime <- paste (as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$DateTime <- as.POSIXct(datetime)

#output histogram to png
plot(DT.filter$Global_active_power~DT.filter$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()