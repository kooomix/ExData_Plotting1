
LoadData <- function() {
        hpd_ds <- read.table(file="household_power_consumption.txt", sep=";", header=T, colClasses = c("character","character", rep("numeric",7)), na="?")  
        hpd_ds$Time <- strptime(paste(hpd_ds$Date, hpd_ds$Time), "%d/%m/%Y %H:%M:%S")
        hpd_ds$Date <- as.Date(hpd_ds$Date, "%d/%m/%Y")
        
        hpd_ds <- subset(hpd_ds, hpd_ds$Date == (as.Date("2007-2-1","%Y-%m-%d")) | hpd_ds$Date == (as.Date("2007-2-2","%Y-%m-%d")))
        
        hpd_ds
        
}



plot3 <- function(x){
        png(filename="plot3.png", width=480, height=480)
        plot(ds$Time, ds$Sub_metering_1, type="l", ylab="Energy eub metering", xlab="")
        lines(ds$Time, ds$Sub_metering_2, col="red")
        lines(ds$Time, ds$Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
        dev.off()
}

plot3(LoadData())
