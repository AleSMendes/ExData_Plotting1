# Load data
source('load-data.R')

# Make plot
plot(power_consumption$datetime, power_consumption$Global_active_power,  ylab='Global Active Power (kilowatts)', xlab='', type='l')


#Save plot
dev.copy(png,"plot2.png")

# Turn off device
dev.off()