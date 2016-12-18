file.name = "household_power_consumption.txt"
col.class = c("character", "character", "numeric", "numeric", 
              "numeric", "numeric")
power.data = read.table(file.name, sep = ";", header = T, 
                        na.strings = "?", colClasses = col.class)
power.data$date.time = strptime(paste(power.data$Date, 
                                      power.data$Time),
                                "%d/%m/%Y %H:%M:%S")
power.data = subset(power.data, as.Date(date.time) 
                    >= as.Date("2007-02-01") & 
                        as.Date(date.time) <= 
                        as.Date("2007-02-02"))
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))
plot(power.data$date.time, power.data$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type = "l")
plot(power.data$date.time, power.data$Voltage, ylab="Voltage", xlab="datetime",
     type = "l")
plot(power.data$date.time, power.data$Sub_metering_1, xlab="", type = "l",
     ylab="Energy sub metering")
lines(power.data$date.time, power.data$Sub_metering_2, col='red')
lines(power.data$date.time, power.data$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')
with(power.data, plot(date.time, Global_reactive_power, xlab='datetime', 
                      type = "l"))

# Close PNG file
dev.off()