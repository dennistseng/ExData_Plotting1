# Plot 4
# Dennis Tseng : Exploratory Data Analysis

# Read Table
powertable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is=T)

# Get subset
subsetdata <- subset(powertable, (powertable$Date == "1/2/2007" | powertable$Date == "2/2/2007"))

# Create plot
png("plot4.png")

# Set format of plot
par(mfrow=c(2,2))

#Plot Top-Left
plot(subsetdata$Global_active_power, type="l", xaxt="n", xlab="", ylab = "Global Active Power")
axis(1, at=c(1, as.integer(nrow(subsetdata)/2), nrow(subsetdata)), labels=c("Thu", "Fri", "Sat"))

#Plot Top-Right
plot(subsetdata$Voltage, type="l", xaxt="n", xlab="datetime", ylab = "Voltage")
axis(1, at=c(1, as.integer(nrow(subsetdata)/2), nrow(subsetdata)), labels=c("Thu", "Fri", "Sat"))

#Plot Bottom-Left
with(subsetdata,
     {
       plot(subsetdata$Sub_metering_1, type="l", xaxt="n", xlab="", ylab = "Energy sub metering")
       lines(subsetdata$Sub_metering_2, col="red")
       lines(subsetdata$Sub_metering_3, col="blue")
     }
)
axis(1, at=c(1, as.integer(nrow(subsetdata)/2), nrow(subsetdata)), labels=c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1), lwd=c(1,1))

#Plot Bottom-Right
plot(subsetdata$Global_reactive_power, type="l", xaxt="n", xlab="datetime", ylab = "Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(subsetdata)/2), nrow(subsetdata)), labels=c("Thu", "Fri", "Sat"))

dev.off()