power_data <- data.table::fread(input = "household_power_consumption.txt"
                                , na.strings="?")


# Making a POSIXct date capable of being filtered and graphed by time of day
power_data[, date_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
power_data <- power_data[(date_Time >= "2007-02-01") & (date_Time < "2007-02-03")]
png("plot3.png",width = 480, height = 480)
plot(x=power_data[, date_Time],y=power_data[, Sub_metering_1], xlab =
       "", ylab = "Energy Sub Metering",type ="l")
     lines(power_data[, date_Time],y=power_data[, Sub_metering_2], type ="l",col="red")
     lines(power_data[, date_Time],y=power_data[, Sub_metering_3],type ="l", col ="blue")
     
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     
     
     
dev.off()





