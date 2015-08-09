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

#creating a png file and exporting plot 1 to it
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(fdata$Global_active_power, main = "Global Active Power", 
     xlab = "Globar Active Power (kilowatts)", col = "red")

dev.off()