## Course project 1 - plot 1

columns <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

power_consumption <- read.table("~/GitHub/datasciencecoursera/household_power_consumption.txt", header=T, sep=';', na.strings="?")
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

data_used <- subset(power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data_used$Date), data_used$Time)
data_used$Datetime <- as.POSIXct(datetime)

### Plotting Global Active Power
hist(data_used$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", height=480, width=480,filename = "plot1.png")

