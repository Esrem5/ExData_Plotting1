df <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
df$Date2<-as.Date(df$Date, "%d/%m/%Y")
df2<-df[df$Date2>="2007-02-01" & df$Date2<="2007-02-02",]

# Plot3
df2$DateTime<-paste(df2$Date,df2$Time)
df2$DateTime<-strptime(df2$DateTime,format="%d/%m/%Y %H:%M:%S")

with(df2, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(df2, lines(DateTime, Sub_metering_2, col="red"))
with(df2, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()