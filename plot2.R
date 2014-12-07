# Loads source data and builds plot 2

# Your code file should include code for reading the data so that the plot can be fully reproduced.
# put data loading into a common file that can be reused by all four plot files
source('./loadPowerData.R')
data <- loadPowerData()

# line plot, Global_active_power by date_time
plot(data[,c(10,3)], type='l', xlab='', ylab='Global Active Power (kilowatts)')