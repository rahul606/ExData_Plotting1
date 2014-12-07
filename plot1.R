fullData <- read.csv("/Users/Iva/Documents/Coursera/Exploratory-Data-Analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259)
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y")

data <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullData)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()