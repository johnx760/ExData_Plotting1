require(data.table)
dat <- fread("household_power_consumption.txt", header = TRUE)
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

dat$datetime <- as.POSIXct(paste(dat$Date, dat$Time),
                           format="%d/%m/%Y %H:%M:%S")
dat$Date <- dat$Time <- NULL

dat$Global_active_power <- as.numeric(dat$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480, bg='transparent')
plot(dat$datetime, dat$Global_active_power, type='n',
     xlab=NA, ylab='Global Active Power (kilowatts)')
lines(dat$datetime, dat$Global_active_power)

dev.off()