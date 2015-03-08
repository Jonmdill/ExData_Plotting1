
data <- read.table("household_power_consumption.txt", 
                   header = FALSE, sep = ";", skip = 66637, 
                   nrows = 2880, na.strings = "?")
header <- read.table ("household_power_consumption.txt", 
                      header = TRUE, sep = ";", nrows = 1)
colnames(data) <- names(header)
data$DateTime <- strptime(paste(data$Date,data$Time), 
                          "%d/%m/%Y %H:%M:%S")

png("plot4.png", bg = "transparent")

par(mfcol = c(2,2))

plot(data$DateTime, data$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

plot(data$DateTime, data$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col = c("black", "red", "blue"), bty = "n")
plot(data$DateTime, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
plot(data$DateTime, data$Global_reactive_power, ylab = "Global_reactive_power", 
     xlab = "datetime", type = "l")
dev.off()


