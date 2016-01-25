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

#Plot2
z$Global_active_power <-as.numeric(as.character(z$Global_active_power))
plot(z$dateTime_date, z$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")  

#Exporting Plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()