plot3 <- function(){
# Pre-Processing
# Read Dataset and convert the measurings to class numeric
energy <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", dec=".", na.strings="?", colClasses=c(NA,NA,"numeric"))
# Convert Date Char Sequence to proper Date format to enhance subset building performance
energy[[1]] <- as.Date(energy[[1]], "%d/%m/%Y")
# Filter Data for February 1st and 2nd 2007
energy_feb <- subset(energy, Date == "2007-02-01" | Date == "2007-02-02")

# Plotting
# Plot Time Series for Sub Metering (type: lines)
png("plot3.png", width = 480, height = 480, units = "px")
# Plot first time series
plot(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Sub_metering_1, type ="l", ylab = "Energy Sub Metering", xlab ="")
# Add Sub 1 and Sub 2 via points command
points(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Sub_metering_2, type ="l", col = "red")
points(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Sub_metering_3, type ="l", col = "blue")
#Add Legend, lty ensures the lines before the actual description text
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
#Close File
dev.off()
}