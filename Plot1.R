setwd('/Users/littletrees/Documents/coursera_r/')
#Reading data into R
hhPowerConsumption <- read.csv('hhpowerconsumption.txt', sep=";") 

#Coverting Data of Dates
hhPowerConsumption$Date <- as.Date(as.character(hhPowerConsumption$Date), format = "%d/%m/%Y")

#Subsetting data
hhPowerConsumption2Day <- with(hhPowerConsumption, hhPowerConsumption[(Date == "2007-02-01" | Date == "2007-02-02"),])

#Plot 1
hist(as.numeric(as.character(hhPowerConsumption2Day$Global_active_power)),main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#Exporting plot 1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
