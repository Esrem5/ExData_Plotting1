df <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
df$Date2<-as.Date(df$Date, "%d/%m/%Y")
df2<-df[df$Date2>="2007-02-01" & df$Date2<="2007-02-02",]

# Plot2
df2$DateTime<-paste(df2$Date,df2$Time)
df2$DateTime<-strptime(df2$DateTime,format="%d/%m/%Y %H:%M:%S")

with(df2, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file = "plot2.png")
dev.off()
