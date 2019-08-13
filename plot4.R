power_data<-data.table::fread("household_power_consumption.txt",na.strings = "?",header = TRUE)
ower_data$Date= as.character(power_data$Date)
power_data[ ,date_time:= as.POSIXct( paste(Date,Time), format = "%d/%m/%Y %H:%M:%S")] # works only if character dates are given 
power_data <- power_data[(date_time >= "2007-02-01") & (date_time < "2007-02-03")]

png("plot4.png",height = 480, width = 480)
par(mfrow = c(2,2))    
plot(x = power_data[, date_time]
     , y = power_data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(power_data$Voltage~power_data$date_time, type="l", 
     ylab="Voltage (volt)", xlab="")
plot(x=power_data[, date_time],y=power_data[, Sub_metering_1], xlab =
       "", ylab = "Energy sub metering",type ="l")
lines(power_data[, date_time],y=power_data[, Sub_metering_2], type ="l",col="red")
lines(power_data[, date_time],y=power_data[, Sub_metering_3],type ="l", col ="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     
plot(x = power_data[, date_time]
     , y = power_data[, Global_reactive_power]
     , type="l", xlab="", ylab="Global Reactive Power (kilowatts)")

dev.off()