library(data.table)

setwd("D:\\CoursERA\\Course4\\Assignment1")


powerData <-
fread("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors
      =FALSE, dec=".",na.strings="?")[Date %in% c("1/2/2007","2/2/2007") ,]

attach(powerData)

datetime <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

detach(powerData)
