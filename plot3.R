
data <- read.table("household_power_consumption.txt", 
                   header = FALSE, sep = ";", skip = 66637, 
                   nrows = 2880, na.strings = "?")
header <- read.table ("household_power_consumption.txt", 
                      header = TRUE, sep = ";", nrows = 1)
colnames(data) <- names(header)
data$DateTime <- strptime(paste(data$Date,data$Time), 
                          "%d/%m/%Y %H:%M:%S")

png("plot3.png", bg = "transparent")

plot(data$DateTime, data$Sub_metering_1, type = "l", 
     ylab = "Energy sub Metering", xlab = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col = c("black", "red", "blue"))
dev.off()
