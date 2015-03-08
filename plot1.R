
data <- read.table("household_power_consumption.txt", 
                   header = FALSE, sep = ";", skip = 66637, 
                   nrows = 2880, na.strings = "?")
header <- read.table ("household_power_consumption.txt", 
                      header = TRUE, sep = ";", nrows = 1)
colnames(data) <- names(header)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")

png("plot1.png", bg = "transparent")
hist(data$Global_active_power, col = "Red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()