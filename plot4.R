plot4 <- function() {
     ##Reads household_power_consumption.txt and
     ###Creates four plots in plot4.png:
     ###1 Plots Global_active_Power vs. time on a line plot
     ###2 plots Voltage vs. time on a line plot
     ###3 plots Sub_metering 1 through 3 vs. time on a line plot
     ###4 plots Global reactive power vs. date time
     #read data
     filename="household_power_consumption.txt"
     pow_data <- fread(filename,header=TRUE,sep=";",na.strings="?")
     #subset data to required dates
     pow_data <- subset(pow_data,Date=="1/2/2007" | Date=="2/2/2007")
     #format dates and times
     dt_form="%d/%m/%Y %H:%M:%S"
     pow_dt <- as.POSIXct(strptime(paste(pow_data$Date,pow_data$Time),dt_form))
     pow_data <- cbind(pow_dt,pow_data[,3:9])
     #create plot
     png("plot4.png")
     par(mfrow=c(2,2)) # set up plot devices with 4 plots
     #1 create plot of global active power vs. time
     with(pow_data,
          plot(pow_dt,Global_active_power,col="black",type="l",
               xlab="",ylab="Global Active Power"))
     #2 plots Voltage vs. time on a line plot
     with(pow_data,
          plot(pow_dt,Voltage,col="black",type="l",
               xlab="datetime"))
     #3 plots Sub_metering 1 through 3 vs. time on a line plot
     ylim=c(0,max(pow_data[,6:8]))   #set y axis range
     with(pow_data,
          plot(pow_dt,Sub_metering_1,
               type="l",ylim=ylim, xlab="",ylab="Energy Sub Metering")) #Plot sub metering 1
     with(pow_data,lines(pow_dt,Sub_metering_2,col="red"))#Plot sub metering 2
     with(pow_data,lines(pow_dt,Sub_metering_3,col="blue"))#Plot sub metering 3
     legend("topright",
            legend=names(pow_data[,6:8]),
            lty=c(1,1),col=c("black","red","blue"))#create legend
     #4 plots Global reactive power vs. date time
     with(pow_data,
          plot(pow_dt,Global_reactive_power,col="black",type="l",
               xlab="datetime"))
     dev.off()
}
