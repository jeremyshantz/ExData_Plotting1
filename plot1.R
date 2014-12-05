loadData <- function () {

    source <- file('./household_power_consumption.txt')
    open(source)
    
    i <- 0
    headers <- readLines(source, n = 1, warn = FALSE)
    minDate <- as.Date('2007-02-01')
    maxDate <- as.Date('2007-02-02')
    print(date())
    
    while (length(line <- readLines(source, n = 1, warn = FALSE)) > 0) {
        
        # split the line and cast the first element of the vector as date
        line <- strsplit(line, ";")
        theDate = as.Date(line[[1]][1], format='%d/%m/%Y')
        
        # ignore earlier dates
        if (theDate < minDate) {
            next
        }
        
        # since we know this data set is sorted, we can break once we're past the dates we want
        if (theDate > maxDate) {
            break
        }
        
        #data <- c(data, line[[1]])
        
        i <- i + 1
        
    } 

    close(source)
    print(i)
    print(date())
    data
}

d <- loadData()
