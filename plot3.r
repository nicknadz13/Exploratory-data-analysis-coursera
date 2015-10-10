#Using same initial code for reading data from PLOT 1

#Importing Main dataset

data_total <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_total$Date <- as.Date(data_total$Date, format="%d/%m/%Y")

#Subsetting the data
subset_data <- subset(data_total, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_total)

#Converting dates
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

#Plot 3
with(subset_data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Saving to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()