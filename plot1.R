#read the first row for column names
data_header <- names(read.csv(file='household_power_consumption.txt', sep=';', colClasses='character', nrows=1, header=TRUE))
#read only lines that correspond to 01/02/2007 & 02/02/2007
data <- read.csv(file='household_power_consumption.txt', sep=';', colClasses='character', skip=66636, nrows=2880)
colnames(data) <- data_header
png(file="plot1.png")

data <- transform(data, Global_active_power = as.numeric(Global_active_power))
hist(data$Global_active_power, col="red", main='Global Active Power', xlab='Global Active Power (kilowatts)')

dev.off()