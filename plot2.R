plot2 <- function () {
     ## Plot2 reads household_power_consumption.txt and
     ## Plots Global_active_Power vs. time on a line plot
     #read  file
     filename="household_power_consumption.txt"
     pow_data <- fread(filename,header=TRUE,sep=";",na.strings="?")
     #subset data to required dates
     pow_data <- subset(pow_data,Date=="1/2/2007" | Date=="2/2/2007")
     #format data and time
     dt_form="%d/%m/%Y %H:%M:%S"
     pow_dt <- as.POSIXct(strptime(paste(pow_data$Date,pow_data$Time),dt_form))
     pow_data <- cbind(pow_dt,pow_data[,3:9])
     #create plot
     png("plot2.png")
     with(pow_data,
          plot(pow_dt,Global_active_power,col="black",type="l",
               xlab="",ylab="Global Active Power"))
     dev.off()
     #end create plot
}