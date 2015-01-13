require(data.table)
dat <- fread("household_power_consumption.txt", header = TRUE)
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

dat$datetime <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
dat$Date <- dat$Time <- NULL

with(dat, {
    Global_active_power <- as.numeric(Global_active_power)
    Voltage <- as.numeric(Voltage)
    Sub_metering_1 <- as.numeric(Sub_metering_1)
    Sub_metering_2 <- as.numeric(Sub_metering_2)
    Sub_metering_3 <- as.numeric(Sub_metering_3)
    Global_reactive_power <- as.numeric(Global_reactive_power)
})

png(filename = "plot4.png", width = 480, height = 480, bg='transparent')

par(mfrow = c(2, 2))
with(dat, {
    plot(datetime, Global_active_power, type='n', xlab=NA,
         ylab='Global Active Power')
    lines(datetime, Global_active_power)
    
    plot(datetime, Voltage, type='n')
    lines(datetime, Voltage)
    
    plot(datetime, Sub_metering_1, type='n', xlab=NA,
         ylab='Energy sub metering')    
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col='red')
    lines(datetime, Sub_metering_3, col='blue')
    legend('topright', bty='n', lty=c(1,1), col=c('black', 'red', 'blue'),
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    
    plot(datetime, Global_reactive_power, type='n')
    lines(datetime, Global_reactive_power)
})

dev.off()