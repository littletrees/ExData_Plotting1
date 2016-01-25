setwd('/Users/littletrees/Documents/coursera_r/')
#Reading data into R
hhPowerConsumption <- read.csv('hhpowerconsumption.txt', sep=";") 

#Coverting Data of Dates
hhPowerConsumption$Date <- as.Date(as.character(hhPowerConsumption$Date), format = "%d/%m/%Y")

#Subsetting data
hhPowerConsumption2Day <- with(hhPowerConsumption, hhPowerConsumption[(Date == "2007-02-01" | Date == "2007-02-02"),])

#binding Date and Time
dateTime <- paste(hhPowerConsumption2Day$Date, hhPowerConsumption2Day$Time)
dateTime_date <- strptime(dateTime, format="%Y-%m-%d %X")

#Adding the new varialbe to the data
z <- data.frame(hhPowerConsumption2Day, dateTime_date)

#Plot 3
plot(z$dateTime_date, as.numeric(as.character(z$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")  
lines(z$dateTime_date, as.numeric(as.character(z$Sub_metering_2)), col = "red")
lines(z$dateTime_date, as.numeric(as.character(z$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Exporting Plot 3
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
