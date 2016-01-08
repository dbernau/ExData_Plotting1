plot1 <- function(){
# Pre-Processing
# Read Dataset and convert the measurings to class numeric
energy <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", dec=".", na.strings="?", colClasses=c(NA,NA,"numeric"))
# Convert Date Char Sequence to proper Date format to enhance subset building performance
energy[[1]] <- as.Date(energy[[1]], "%d/%m/%Y")
# Filter Data for February 1st and 2nd 2007
energy_feb <- subset(energy, Date == "2007-02-01" | Date == "2007-02-02")

# Plotting
# Plot Histogram for Global Active Power to file
png("plot1.png", width = 480, height = 480, units = "px")
hist(energy_feb$Global_active_power, col="red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")
#Close File
dev.off()
}