## reads household_power_consumption.txt and 
## creates a histogram of Global Active Power in the
## file "plot1.png"
plot1 <- function () {
     # reads household_power_consumption.txt
     pow_data <- fread("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
     #keeps only date from Feb 1-Feb 2, 2007
     pow_data <- subset(pow_data,Date=="1/2/2007" | Date=="2/2/2007")
     #creates and saves plot 
     png("plot1.png")
     with(pow_data,hist(Global_active_power,col="red",breaks=12,main="Global Active power",xlab="Global active power (kilowatts)"))
     dev.off()
}