df <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
df$Date2<-as.Date(df$Date, "%d/%m/%Y")
df2<-df[df$Date2>="2007-02-01" & df$Date2<="2007-02-02",]

# Plot4
df2$datetime<-paste(df2$Date,df2$Time)
df2$datetime<-strptime(df2$datetime,format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))
with(df2, {
     plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
     plot(datetime, Voltage, type="l")
     plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
     lines(datetime, Sub_metering_2, col="red")
     lines(datetime, Sub_metering_3, col="blue")
     legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.7)
     plot(datetime, Global_reactive_power, type="l")
})

dev.copy(png, file = "plot4.png")
dev.off()