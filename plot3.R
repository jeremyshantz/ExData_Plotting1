# Loads source data and builds plot 3

# Your code file should include code for reading the data so that the plot can be fully reproduced.
# put data loading into a common file that can be reused by all four plot files
source('./loadPowerData.R')
data <- loadPowerData()

# line plot with custom y label.
# initialize with Sub_metering_1
plot(x=data[,10], y=data[,7], col='black', type='l', xlab='', ylab='Energy sub metering')

# add Sub_metering_2 in red
points(x=data[,10],y=data[,8], col='red', type='l')

# add Sub_metering_3 in blue
points(x=data[,10],y=data[,9], col='blue', type='l')

# add top-right legend, dash symbol, colors corresponding to the line colors; labels corresponding to variable names
legend('topright', pch=45, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
