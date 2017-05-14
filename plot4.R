## Plot 4 Code

household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_date <- subset(household, Date %in% c("1/2/2007","2/2/2007"))
as_date <- as.Date(data_date$Date, format = "%d/%m/%y")
datetime <- strptime(paste(data_date$Date, data_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(data_date$Global_active_power)
sub1 <- as.numeric(data_date$Sub_metering_1)
sub2 <- as.numeric(data_date$Sub_metering_2)
sub3 <- as.numeric(data_date$Sub_metering_3)
Voltage <- as.numeric(data_date$Voltage)
GlobalReactivePower <- as.numeric(data_date$Global_reactive_power)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(datetime, GlobalActivePower, type="l", xlab = " ", ylab="Global Active power (kilowatts)")

plot(datetime, Voltage, type = "l", xlab = "datetime", ylab= "Voltage")

plot(datetime, sub1, type="l", xlab = " ", ylab="Energy sub metering")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)

plot(datetime, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_rective_power")
dev.off()
