# unzippiing downloaded file
unzip("exdata_data_household_power_consumption (1).zip")
# reading the downloaded data as data table
power_data<-data.table::fread("household_power_consumption.txt",na.strings = "?",header = TRUE)

#converting date from character to date 
#checking the class 
class(power_data$Date)
#converting from character to date
date<-power_data$Date
abias<-strptime(date,format="%d/%m/%Y")
power_data$Date<-as.Date(abias,format="%d/%m/%Y")

#subsetting the data according to the dates given 
power_data <-subset(power_data, power_data$Date>="2007-02-01" & power_data$Date<="2007-02-02")
#2nd method : selectByDate(power_data, start = "2007-02-01", end = "2007-02-02")

#plotting the data
png("plot1.png",width = 480, height = 480)
hist(power_data$Global_active_power,xlab = "Energy sub metering",main = "Global Active Power",col = "red")
dev.off()