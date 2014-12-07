# Methods to load a fixed date range from the household_power_consumption.txt source file.

# use par to reset mfrow to default value since it is a global setting (and might be changed by plot4.R if run before other files)
par(mfrow=c(1,1))

# file paths
cachePath <- './cache.csv'
dataPath  <- './household_power_consumption.txt'

# This function returns the power data for our data range, first checking if cached data can be returned, and calling building the data if not
loadPowerData <- function () {
    
    # if we have not yet cached the date range we care about, build the cache
    if (!file.exists(cachePath)) {
    
        buildCache()
    } 
    
    # return the cached data
    loadCache()
}

# This function loads the power data from a previously-created cache file. Adds a date-time column to the data
loadCache <- function () {
    
    #read from disk
    data <- read.csv(cachePath, sep=';')
    
    # create a date-time column by concatenting Date and Time and casting to POSIXlt
    data$date_time<-strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
    
    data
}

# This function reads the large household_power_consumption data source line by line and copies observations in our date range to a cache file for quicker loading
buildCache <- function () {
    
    # open the source file for reading
    source <- file(dataPath, open='r')
    
    # create the cache file; removing it first if it already exists
    if (file.exists(cachePath)) {
        file.remove(cachePath)
    }
    
    # create and open the cache file for writing
    file.create(cachePath)
    cache <- file(cachePath, open='w')
    
    # read the first line of the source; our headers
    headers <- readLines(source, n = 1, warn = FALSE)
    
    # write headers to cache
    write(headers, file=cache, append=TRUE)
    
    # the date range we will analyze
    minDate <- as.Date('2007-02-01')
    maxDate <- as.Date('2007-02-02')
    
    # read the rest of the source file one line at a time
    #  This technique avoids loading the entire file into memory.
    while (length(line <- readLines(source, n = 1, warn = FALSE)) > 0) {
        
        # Extract the date from the line of text
        # split the line and cast the first element of the vector as date
        theDate = as.Date(strsplit(line, ";")[[1]][1], format='%d/%m/%Y')
        
        # since we know this data set is sorted.....
        
        # ..... we can ignore earlier dates
        if (theDate < minDate) {
            next # skip to next iteration of the while loop
        }
        
        # ..... and we can break once we're past the dates we want
        if (theDate > maxDate) {
            break # break out of the loop
        }
        
        # ... otherwise, this is an observation within our date range
        # write the line to the cache file
        write(line, file=cache, append=TRUE)        
    } 
    
    # close both files and return
    close(source)
    close(cache)
    
    TRUE
}
