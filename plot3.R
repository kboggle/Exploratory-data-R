## Course project 1 - plot 3

columns <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

power_consumption <- read.table("~/GitHub/datasciencecoursera/household_power_consumption.txt", header=T, sep=';', na.strings="?")
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

data_used <- subset(power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_consumption)
datetime <- paste(as.Date(data_used$Date), data_used$Time)
data_used$Datetime <- as.POSIXct(datetime)

### Plotting Sub metering
plot(data_used$Sub_metering_1~data_used$Datetime, ylab="Energy Sub metering",xlab=" ", height=480, width=480,filename = "plot3.png", type="l")
lines(data_used$Sub_metering_2~data_used$Datetime,col='Red')
lines(data_used$Sub_metering_3~data_used$Datetime,col='Blue')
legend("topright",lty=1, lwd=2, cex=0.75, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
