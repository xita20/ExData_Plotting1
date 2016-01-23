
## Create one R script called plot2.R that creates plot2.png

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

## Histogram of Global Active Power
## Output to PNG file

png('C:/Users/njiang/Documents/GitHub/ExData_Plotting1/plot2.png',width = 480, height = 480,bg = "white")
plot(power$DateTime ,power$Global_active_power,xlab='',ylab = 'Global Active Power (kilowatts)',frame.plot=TRUE,type="n")
lines(power$DateTime ,power$Global_active_power,type="l")
dev.off()