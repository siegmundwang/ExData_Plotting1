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
png("plot2.png", height=480, width=480)
plot(power.data$date.time, power.data$Global_active_power, pch=NA, xlab="", 
     ylab="Global Active Power (kilowatts)", type = "l")
dev.off()