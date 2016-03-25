filename <- ".../household_power_consumption.txt"
rawData <- read.table(filename, sep = ";" , header = TRUE,colClasses = c("character", "character", rep("numeric",7)),na = "?")

#dim(rawData)
#[1] 2075259       9

attach(rawData)
subset <- Date == "1/2/2007" | Date == "2/2/2007"
filterData <- rawData[subset, ]

#dim(filterData)
#[1] 2880    9

attach(filterData)
filterData$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
x <- paste(Date, Time)
filterData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(filterData) <- 1:nrow(filterData)

#dim(filterData)
#[1] 2880   10

attach(filterData)