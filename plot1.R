## Plot1 Code

getwd()
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data_date <- subset(household, Date %in% c("1/2/2007","2/2/2007"))
as_date <- as.Date(data_date$Date, format = "%d/%m/%y")
GlobalActivePower <- as.numeric(data_date$Global_active_power)

png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency") 
dev.off()
