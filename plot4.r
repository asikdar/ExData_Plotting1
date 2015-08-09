#read the data in a csv file format
data <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";",
                 na.strings = "?", check.names = FALSE, stringsAsFactors=F,
                 comment.char="")

#change Date from Factors class to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset data based on the date range provided in assignment
fdata <- subset(data, Date >="2007-02-01" & Date <= "2007-02-02")

#change Time from Factors class to Time class for this subset
fdata$DateTime <- paste(fdata$Date, fdata$Time)
fdata$DateTime <- strptime(fdata$DateTime, format = "%Y-%m-%d %H:%M:%S")

#creating a png file and exporting plot 4 to it
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#setting space for 4 plots in 1 (order by row)
par(mfrow = c(2,2))

##1st plot
plot(fdata$DateTime, fdata$Global_active_power, xlab = "",
     ylab = "Globar Active Power", type = "l")

##2nd plot
with(fdata, plot(DateTime, Voltage, xlab = "datetime",
     ylab = "Voltage", type = "l"))

##3rd plot
plot(fdata$DateTime, fdata$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
lines(fdata$DateTime, fdata$Sub_metering_2, col = "red")
lines(fdata$DateTime, fdata$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = "solid", bty = "n")

##4th plot
with(fdata, plot(DateTime, Global_reactive_power, xlab = "datetime",
                 ylab = "Global_reactive_power", type = "l"))

dev.off()