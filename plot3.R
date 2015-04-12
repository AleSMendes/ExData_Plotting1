# Load data
source('load-data.R')

# Make plot
plot(power_consumption$datetime, power_consumption$Sub_metering_1, type='l',   xlab='', ylab='Energy sub metering')
lines(power_consumption$datetime, power_consumption$Sub_metering_2, col='red')
lines(power_consumption$datetime, power_consumption$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid')


#Save plot
dev.copy(png,"plot3.png")
# Turn off device
dev.off()
