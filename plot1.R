library(data.table)

setwd("D:\\CoursERA\\Course4\\Assignment1")


powerData <-
fread("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors
      =FALSE, dec=".",na.strings="?")[Date %in% c("1/2/2007","2/2/2007") ,]

attach(powerData)

png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

detach(powerData)
