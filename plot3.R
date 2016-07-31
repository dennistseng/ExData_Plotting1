# Plot 3
# Dennis Tseng : Exploratory Data Analysis

# Read Table

powertable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is=T)

# Get subset

subsetdata <- subset(powertable, (powertable$Date == "1/2/2007" | powertable$Date == "2/2/2007"))

# Create plot

png("plot3.png")
with(subsetdata,
     {
       plot(subsetdata$Sub_metering_1, type="l", xaxt="n", xlab="", ylab = "Energy sub metering")
       lines(subsetdata$Sub_metering_2, col="red")
       lines(subsetdata$Sub_metering_3, col="blue")
     }
     )
axis(1, at=c(1, as.integer(nrow(subsetdata)/2), nrow(subsetdata)), labels=c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1), lwd=c(1,1))
dev.off()