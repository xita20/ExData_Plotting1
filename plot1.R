
## Create one R script called plot.R that creates plot1.png

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

## Histogram of Global Active Power
## Output to PNG file

png('C:/Users/njiang/Documents/GitHub/ExData_Plotting1/plot1.png',width = 480, height = 480,bg = "white")
hist(power$Global_active_power,main ='Global Active Power',xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()
