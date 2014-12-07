# Loads source data and builds plot 1

# Your code file should include code for reading the data so that the plot can be fully reproduced.
# put data loading into a common file that can be reused by all four plot files
source('./loadPowerData.R')
data <- loadPowerData()

# red histogram of Global_active_power; with custom main and x labels
hist(data[, 3], main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')