#### Exploratory Data Analysis (EDA) - Module 4 ###
#### Data Science Program - John Hopkins University & Cousera ###


#### Electric power consumption exercise ###


### Uploading the data ----

### setting the working directory ###

setwd("~/Coursera/2025/Modulo 4/week 1 - module 1/Project 1 module 4")
install.packages("ggplot2")
library(ggplot2)
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


plot1 <-hist(shpc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png(filename="~/Coursera/2025/Modulo 4/week 1 - module 1/Project 1 module 4/plot1.png")

plot(plot1)
dev.off()

