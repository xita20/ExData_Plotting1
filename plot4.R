
## Create one R script called plot4.R that creates plot4.png

##Checking and Loading packages

if (!require("data.table")) { 
   install.packages("data.table") 
 } 
require("data.table") 

## Input dataset and subset to two days, code missing values to '?'
var.class <- c(rep('character',2),rep('numeric',7))
data <- read.table("C:/Users/njiang/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt",sep=";",header=T,
                   colClasses=var.class,na.strings= '?')
power <- data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

## Convert the Date and Time variables to Date/Time classes 

power$DateTime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$DATE<-weekdays(power$DateTime)

## Output to PNG file

png('C:/Users/njiang/Documents/GitHub/ExData_Plotting1/plot4.png',width = 480, height = 480,bg = "white")
##Arrange a 2x2 canvas
par(mfrow=c(2,2))
##plot(1,1)
plot(power$DateTime,power$Global_active_power,ylab='Global Active Power',xlab='',type='l')
##plot(1,2)
plot(power$DateTime,power$Voltage,xlab='datetime',ylab='Voltage',type='l')
##plot(2,1)
plot(power$DateTime ,power$Sub_metering_1,xlab='',ylab = 'Energy sub metering',frame.plot=TRUE,type="n")
lines(power$DateTime ,power$Sub_metering_1,type="l",col='black')
lines(power$DateTime ,power$Sub_metering_2,type="l",col='red')
lines(power$DateTime ,power$Sub_metering_3,type="l",col='blue')
legend("topright",col=c("black","red","blue"),lty=1,bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##plot(2,2)
plot(power$DateTime,power$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')
dev.off()

