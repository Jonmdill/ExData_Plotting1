
data <- read.table("household_power_consumption.txt", 
                   header = FALSE, sep = ";", skip = 66637, 
                   nrows = 2880, na.strings = "?")
header <- read.table ("household_power_consumption.txt", 
                      header = TRUE, sep = ";", nrows = 1)
colnames(data) <- names(header)
data$DateTime <- strptime(paste(data$Date,data$Time), 
                          "%d/%m/%Y %H:%M:%S")

png("plot2.png", bg = "transparent")
plot(data$DateTime, data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
