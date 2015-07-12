df <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
df$Date2<-as.Date(df$Date, "%d/%m/%Y")
df2<-df[df$Date2>="2007-02-01" & df$Date2<="2007-02-02",]

# Plot1
hist(df2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()







