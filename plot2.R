plot2 <- function(){
# Pre-Processing
# Read Dataset and convert the measurings to class numeric
energy <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", dec=".", na.strings="?", colClasses=c(NA,NA,"numeric"))
# Convert Date Char Sequence to proper Date format to enhance subset building performance
energy[[1]] <- as.Date(energy[[1]], "%d/%m/%Y")
# Filter Data for February 1st and 2nd 2007
energy_feb <- subset(energy, Date == "2007-02-01" | Date == "2007-02-02")

# Plotting
# Plot Time Series for Global Active Power (type: lines)
png("plot2.png", width = 480, height = 480, units = "px")
# prepare timestamp through strptime() on Date and Time
plot(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")
#Close File
dev.off()
}