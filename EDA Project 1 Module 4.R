#### Exploratory Data Analysis (EDA) - Module 4 ###
#### Data Science Program - John Hopkins University & Cousera ###


#### Electric power consumption exercise ###




### Uploading the data ----

### setting the working directory ###

setwd("~/Coursera/2025/Modulo 4/week 1 - module 1/Project 1 module 4")
dev.new(noRStudioGD = TRUE)

### hpc: house power consumption 

hpc <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=';',nrows=2075259, na.strings="?", 
                       check.names=F, stringsAsFactors=FALSE, comment.char="", quote='\"')

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")


#### Subsetting the data -----

shpc <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")


#### Changing date formats in the subset data ----


datetime <- paste(as.Date(shpc$Date), shpc$Time)
shpc$Datetime <- as.POSIXct(datetime)


### Generating plot 1 : Global active power ----


hist(shpc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


### Generating plot 2 : Global Active Power (kilowatts) ----

plot(shpc$Global_active_power~shpc$Datetime,type="l", ylab="Global Active Power (kilowatts)", xlab="")



### Generating plot 3 : Energy sub metering ----


with(shpc, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



### Generating plot 4 : combined graph ----


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(shpc, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})











