#data <- read.csv(file='household_power_consumption_filtered.txt', sep=';', colClasses='character')

data_header <- names(read.csv(file='household_power_consumption.txt', sep=';', colClasses='character', nrows=1, header=TRUE))
#read only lines that correspond to 01/02/2007 & 02/02/2007
data <- read.csv(file='household_power_consumption.txt', sep=';', colClasses='character', skip=66636, nrows=2880)
colnames(data) <- data_header

png(file="plot2.png")
format_str = "%d/%m/%Y %H:%M:%S"
data <- transform(data, Time = strptime(paste(Date, Time), format=format_str))
with(data, plot(Time, Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab=''))
dev.off()