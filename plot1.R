# Load data
source('load-data.R')

# Make plot
hist(power_consumption$Global_active_power, main='Global Active Power',  xlab='Global Active Power (kilowatts)', col='red')

#Save plot
dev.copy(png,"plot1.png")

# Turn off device
dev.off()