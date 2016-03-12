if(!file.exists("household_power_consumption.txt")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
household_power_consumption <- 
  read.csv("C:/Users/Lucas/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", 
           sep=";", stringsAsFactors=FALSE,na.strings = "?")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$Global_active_power=as.numeric(household_power_consumption$Global_active_power)

df=household_power_consumption

########
t1=as.Date("01/02/2007","%d/%m/%Y")
t2=as.Date("02/02/2007","%d/%m/%Y")
df2=df[df$Date %in% t1:t2, ]

df2$timestamp=as.POSIXct(paste(df2$Date,df2$Time))
attach(df2)

png("plot4.png", width=480, height=480, units="px")
# Plot Energy sub metering
par(mfrow=c(2,2))
plot(timestamp, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power")

plot(timestamp, as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")

plot(timestamp, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(timestamp, as.numeric(as.character(Sub_metering_2)), col="red")
lines(timestamp, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

plot(timestamp, as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
