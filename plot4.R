# Loads source data and builds plot 4

# Your code file should include code for reading the data so that the plot can be fully reproduced.
# put data loading into a common file that can be reused by all four plot files
source('./loadPowerData.R')
data <- loadPowerData()

# use par to define a group of plots 2 rows by 2 cols
par(mfrow=c(2,2))

##### plot 1 #######

    # line plot of Global_active_power across date_time with custom y label and blank x label; black
    plot(data[,c(10,3)], type='l', xlab='', ylab='Global Active Power')

##### plot 2 #######
    
    # line plot of Voltage across date_time with custom y label and custom x label; black
    plot(data[,c(10,5)], type='l', xlab='datetime', ylab='Voltage')

##### plot 3 #######
    
    # line plot with custom y label.
    # initialize with Sub_metering_1
    plot(x=data[,10], y=data[,7], col='black', type='l', xlab='', ylab='Energy sub metering')
    
    # add Sub_metering_2 in red
    points(x=data[,10],y=data[,8], col='red', type='l')
    
    # add Sub_metering_3 in blue
    points(x=data[,10],y=data[,9], col='blue', type='l')
    
    # add top-right legend, dash symbol, colors corresponding to the line colors; labels corresponding to variable names
    legend('topright', pch=45, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

##### plot 4 #######
    
    # line plot of Global_reactive_power across date_time with custom x label and default y label
    plot(data[,c(10,4)], type='l',  xlab='datetime')
