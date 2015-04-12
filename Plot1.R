##Setting Directory
setwd("C:/Users/satininus/Desktop")

##Establishing Data Set
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, 
        sep=";", stringsAsFactors=FALSE, dec=".")

##Subsetting the Data
subSetData <- data[
    data$Date %in% 
        c("1/2/2007", "2/2/2007") ,
        ]

##Converting dates and setting as Numeric
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
Global_Active_Power <- as.numeric(subSetData$Global_active_power)

## Plot 1
hist(Global_Active_Power, main="Global Active Power",
    xlab="Global Active Power (kWh)",
    ylab="Frequency",
    col="Red")

##Copy/Saving Plot 1 file then closing dev
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
