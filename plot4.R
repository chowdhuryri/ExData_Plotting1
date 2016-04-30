library(data.table)

setwd("D:\\CoursERA\\Course4\\Assignment1")


powerData <-
fread("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors
      =FALSE, dec=".",na.strings="?")[Date %in% c("1/2/2007","2/2/2007") ,]

attach(powerData)

datetime <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power",cex.lab=.7)
plot(datetime, Voltage, type="l")
plot(datetime,  Sub_metering_1, type="l", ylab="Energy sub metering", xlab="",cex.lab=.7)
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex=.80, bty="n")
plot(datetime, Global_reactive_power, type="l", cex.lab=.75)
dev.off()

detach(powerData)
