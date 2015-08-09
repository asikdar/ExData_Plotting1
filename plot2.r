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

#creating a png file and exporting plot 2 to it
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(fdata$DateTime, fdata$Global_active_power, xlab = "",
     ylab = "Globar Active Power (kilowatts)", type = "l")

dev.off()