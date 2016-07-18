setwd("./Data Science JHU/3_Exploratory Data Analysis/project1")
epc = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
da = epc[which(epc$Date == "2/2/2007" | epc$Date =="1/2/2007"), ]
da$Global_active_power = as.numeric(da$Global_active_power)

# plot1
par(mfrow = c(1,1), mar = c(4,4,2,2))
hist(da$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylim = c(0,1200), col = "red")

# plot2
da$DateTime <- strptime(paste(da$Date, da$Time), "%d/%m/%Y %H:%M:%S")
with(da, plot(DateTime, Global_active_power , type = 'l', ylab = "Global Active Power(kilowatt)", xlab = ''))


# plot3
with(da, plot(DateTime,Sub_metering_1, type = 'l', ylab = "Energy sub meltering", xlab = ''))
lines( da$DateTime, da$Sub_metering_2, col = "red")
lines( da$DateTime, da$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c('black', 'red', 'blue'), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot4
par(mfrow = c(2,2), mar = c(4,4,1,1))
with(da, {
      plot(DateTime, Global_active_power , type = 'l', ylab = "Global Active Power(kilowatt)", xlab = '')
      plot(DateTime, Voltage, type = 'l')
      plot(DateTime,Sub_metering_1, type = 'l', ylab = "Energy sub meltering", xlab = '')
      lines( da$DateTime, da$Sub_metering_2, col = "red")
      lines( da$DateTime, da$Sub_metering_3, col = "blue")
      legend("topright", lty = 1, col = c('black', 'red', 'blue'), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      plot(DateTime, Global_reactive_power, type = 'l' )
})



