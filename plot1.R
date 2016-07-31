# Plot 1
# Dennis Tseng : Exploratory Data Analysis

# Read Table
powertable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is=T)

# Get subset
subsetdata <- subset(powertable, (powertable$Date == "1/2/2007" | powertable$Date == "2/2/2007"))

# Create plot
png("plot1.png")
hist(subsetdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()