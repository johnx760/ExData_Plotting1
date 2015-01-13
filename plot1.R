require(data.table)
dat <- fread("household_power_consumption.txt", header = TRUE)
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

dat$datetime <- as.POSIXct(paste(dat$Date, dat$Time),
                           format="%d/%m/%Y %H:%M:%S")
dat$Date <- dat$Time <- NULL

dat$Global_active_power <- as.numeric(dat$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480, bg='transparent')
hist(dat$Global_active_power, col="red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()