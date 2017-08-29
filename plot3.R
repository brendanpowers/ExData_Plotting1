plot3 <- function () {
     #Reads household_power_consumption.txt and 
     #plots Sub_metering 1 through 3 vs. time to plot3.png
     #read data
     filename="household_power_consumption.txt"
     pow_data <- fread(filename,header=TRUE,sep=";",na.strings="?")
     #subset data to required dates
     pow_data <- subset(pow_data,Date=="1/2/2007" | Date=="2/2/2007")
     #format dates and times
     dt_form="%d/%m/%Y %H:%M:%S"
     pow_dt <- as.POSIXct(strptime(paste(pow_data$Date,pow_data$Time),dt_form))
     pow_data <- cbind(pow_dt,pow_data[,3:9])
     #start plotting
     #xlim=c(min(pow_dt),max(pow_dt)) #set axis range
     ylim=c(0,max(pow_data[,6:8]))   #set axis range
     png("plot3.png")
     with(pow_data,
          plot(pow_dt,Sub_metering_1,
               type="l",ylim=ylim, xlab="",ylab="Energy Sub Metering")) #Plot sub metering 1
     #plot(NULL,type="n",xlim=xlim,ylim=ylim, xlab="",ylab="Energy Sub Metering") #Create empty plot
     #with(pow_data,lines(pow_dt,Sub_metering_1,col="black"))#Plot sub metering 1
     with(pow_data,lines(pow_dt,Sub_metering_2,col="red"))#Plot sub metering 2
     with(pow_data,lines(pow_dt,Sub_metering_3,col="blue"))#Plot sub metering 3
     legend("topright",
            legend=names(pow_data[,6:8]),
            lty=c(1,1),col=c("black","red","blue"))#create legend
     dev.off()
}