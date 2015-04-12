# Load data
source('load-data.R')

## Config global graphics parameters
par(mfrow=c(2,2))

## Make plots
# Top 
with(power_consumption, plot(datetime,Global_active_power, ylab='Global Active Power', xlab='', type='l'))

with(power_consumption, plot(datetime,Voltage, xlab='datetime', ylab='Voltage', type='l'))


# Bottom 
with(power_consumption, plot(datetime,Sub_metering_1,type='l', xlab='', ylab='Energy sub metering'))

lines(power_consumption$datetime, power_consumption$Sub_metering_2, col='red')
lines(power_consumption$datetime, power_consumption$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid', bty='n')

with(power_consumption, plot(datetime,Global_reactive_power,  xlab='datetime', ylab='Global_reactive_power', type='l'))


#Save plot
dev.copy(png,"plot4.png")
# Turn off device
dev.off()