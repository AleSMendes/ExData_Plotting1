library(lubridate)

# If the raw data has not been saved, download, unzip, and load it.
if (!file.exists('power_consumption.txt')) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                 method='curl', destfile='exdata_data_household_power_consumption.zip')
  
  unzip('exdata_data_household_power_consumption.zip')
  
  # Read data into a table with appropriate classes
  power_consumption <- read.table('household_power_consumption.txt', header=TRUE,
                         sep=';', na.strings='?',
                         colClasses=c(rep('character', 2), 
                                      rep('numeric', 7)))
  
  # Convert dates and times
  power_consumption$Date <- dmy(power_consumption$Date)
  power_consumption$Time <- hms(power_consumption$Time)
  
  # Reduce data frame to what we need
  start <- ymd('2007-02-01')
  end <- ymd('2007-02-02')
  power_consumption <- subset(power_consumption, year(Date) == 2007 & 
                       month(Date) == 2 &
                       (day(Date) == 1 | day(Date) == 2))
  
  # join date and time
  power_consumption$datetime <- power_consumption$Date + power_consumption$Time
  
  # Save file
  write.csv(power_consumption, "power_consumption.txt")
} else {
  power_consumption <- read.csv("power_consumption.txt")
}