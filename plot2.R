## Plot 2 Code

household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_date <- subset(household, Date %in% c("1/2/2007","2/2/2007"))
as_date <- as.Date(data_date$Date, format = "%d/%m/%y")
GlobalActivePower <- as.numeric(data_date$Global_active_power)
datetime <- strptime(paste(data_date$Date, data_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)
plot(datetime, GlobalActivePower, type="l", xlab = " ", ylab="Global Active power (kilowatts)")
dev.off
