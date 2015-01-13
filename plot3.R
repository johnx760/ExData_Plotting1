require(data.table)
dat <- fread("household_power_consumption.txt", header = TRUE)
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

dat$datetime <- as.POSIXct(paste(dat$Date, dat$Time),
                           format="%d/%m/%Y %H:%M:%S")
dat$Date <- dat$Time <- NULL

with(dat, {
    Sub_metering_1 <- as.numeric(Sub_metering_1)
    Sub_metering_2 <- as.numeric(Sub_metering_2)
    Sub_metering_3 <- as.numeric(Sub_metering_3)
})

png(filename = "plot3.png", width = 480, height = 480, bg='transparent')

plot(dat$datetime, dat$Sub_metering_1, type='n', xlab=NA,
     ylab='Energy sub metering')

lines(dat$datetime, dat$Sub_metering_1)
lines(dat$datetime, dat$Sub_metering_2, col='red')
lines(dat$datetime, dat$Sub_metering_3, col='blue')

legend("topright", lty=c(1,1), col=c('black', 'red', 'blue'),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()