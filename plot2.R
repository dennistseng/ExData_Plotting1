# Plot 2
# Dennis Tseng : Exploratory Data Analysis

# Read Table
powertable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is=T)

# Get subset
subsetdata <- subset(powertable, (powertable$Date == "1/2/2007" | powertable$Date == "2/2/2007"))


# Create plot

png("plot2.png")
plot(subsetdata$Global_active_power, type="l", xaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(subsetdata)/2), nrow(subsetdata)), labels=c("Thu", "Fri", "Sat"))
dev.off()