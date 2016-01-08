plot4 <- function(){
# Pre-Processing
# Read Dataset and convert the measurings to class numeric
energy <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", dec=".", na.strings="?", colClasses=c(NA,NA,"numeric"))
# Convert Date Char Sequence to proper Date format to enhance subset building performance
energy[[1]] <- as.Date(energy[[1]], "%d/%m/%Y")
# Filter Data for February 1st and 2nd 2007
energy_feb <- subset(energy, Date == "2007-02-01" | Date == "2007-02-02")

# Plotting
# arrange individual plots within a cubic (2x2)
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
# Global Active Power Series(prev. plot2); Upper Left
plot(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")
# Voltage Time Series; Upper Right
plot(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Voltage, type ="l", ylab = "Voltage", xlab = "datetime")
# Sub Metering Time Series; Lower Left (prev. plot3)
plot(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Sub_metering_1, type ="l", ylab = "Energy Sub Metering", xlab ="")
points(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Sub_metering_2, type ="l", col = "red")
points(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Sub_metering_3, type ="l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
# Global Reactive Power; Lower Right
plot(strptime(paste(energy_feb$Date, energy_feb$Time), format="%Y-%m-%d %H:%M:%S"), energy_feb$Global_reactive_power, type ="l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
}
