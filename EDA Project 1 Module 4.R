#### Exploratory Data Analysis (EDA) - Module 4 ###
#### Data Science Program - John Hopkins University & Cousera ###


#### Electric power consumption exercise ###




### Uploading the data ###

### setting the working directory ###

setwd("~/Coursera/2025/Modulo 4/week 1 - module 1/Project 1 module 4")

### hpc: house power consumption 

hpc <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=';',nrows=2075259, na.strings="?", 
                       check.names=F, stringsAsFactors=FALSE, comment.char="", quote='\"')


