data_header <- names(read.csv(file='household_power_consumption.txt', sep=';', colClasses='character', nrows=1, header=TRUE))
#read only lines that correspond to 01/02/2007 & 02/02/2007
data <- read.csv(file='household_power_consumption.txt', sep=';', colClasses='character', skip=66636, nrows=2880)
colnames(data) <- data_header

format_str = "%d/%m/%Y %H:%M:%S"
data <- transform(data, Time = strptime(paste(Date, Time), format=format_str))
png(file = "plot3.png")
with(data, plot(data$Time, data$Sub_metering_1, type='l', xlab='', ylab='Energy sub meeting'))
with(data, points(data$Time, data$Sub_metering_2, col = "red", type='l'))
with(data, points(data$Time, data$Sub_metering_3, col = "blue", type='l'))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()