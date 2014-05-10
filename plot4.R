if(!exists('household_power_consumption.txt')){
  unzip('exdata-data-household_power_consumption.zip')
}
d <- read.csv2('household_power_consumption.txt', stringsAsFactor=FALSE)
d <- subset(d, as.Date(d$Date, "%d/%m/%Y") == as.Date("2007-02-01") |
              as.Date(d$Date, "%d/%m/%Y") == as.Date("2007-02-02")
)

t <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
png(filename = 'plot4.png', width = 480, height = 480, unit = 'px')
par(mfrow=c(2,2))

# 1
plot(t , as.numeric(d$Global_active_power), 
     type = 'l', xlab = "", ylab = "Global Active Power")

# 2
plot(t, d$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")

# 3 

plot(t, d$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "", col = 'black')
points(t, d$Sub_metering_2, type = 'l', col = "red")
points(t, d$Sub_metering_3, type='l', col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1, bg = "n", bty = "n")

# 4
plot(t, d$Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
