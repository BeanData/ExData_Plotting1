## Plot 3 Code

household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_date <- subset(household, Date %in% c("1/2/2007","2/2/2007"))
as_date <- as.Date(data_date$Date, format = "%d/%m/%y")
datetime <- strptime(paste(data_date$Date, data_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub1 <- as.numeric(data_date$Sub_metering_1)
sub2 <- as.numeric(data_date$Sub_metering_2)
sub3 <- as.numeric(data_date$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, sub1, type="l", xlab = " ", ylab="Energy sub metering")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)
dev.off()
