if(!exists('household_power_consumption.txt')){
  unzip('exdata-data-household_power_consumption.zip')
}
d <- read.csv2('household_power_consumption.txt', stringsAsFactor=FALSE)
d <- subset(d, as.Date(d$Date, "%d/%m/%Y") == as.Date("2007-02-01") |
              as.Date(d$Date, "%d/%m/%Y") == as.Date("2007-02-02")
              )
png(filename = 'plot1.png', width = 480, height = 480, unit = 'px')
hist(suppressWarnings(as.numeric(d$Global_active_power)), main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
