
LoadData <- function() {
        hpd_ds <- read.table(file="household_power_consumption.txt", sep=";", header=T, colClasses = c("character","character", rep("numeric",7)), na="?")  
        hpd_ds$Time <- strptime(paste(hpd_ds$Date, hpd_ds$Time), "%d/%m/%Y %H:%M:%S")
        hpd_ds$Date <- as.Date(hpd_ds$Date, "%d/%m/%Y")
        
        hpd_ds <- subset(hpd_ds, hpd_ds$Date == (as.Date("2007-2-1","%Y-%m-%d")) | hpd_ds$Date == (as.Date("2007-2-2","%Y-%m-%d")))
        
        hpd_ds
        
}


plot1 <- function(x){
        png(filename="plot1.png", width=480, height=480)
        hist(x$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
        dev.off()
}

plot1(LoadData())