household_power_consumption <- 
  read.csv(
  "household_power_consumption.txt", 
           sep=";", stringsAsFactors=FALSE,na.strings = "?")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$Global_active_power=as.numeric(household_power_consumption$Global_active_power)

df=household_power_consumption

########
t1=as.Date("01/02/2007","%d/%m/%Y")
t2=as.Date("02/02/2007","%d/%m/%Y")
df2=df[df$Date %in% t1:t2, ]

png("plot1.png", width=480, height=480, units="px")
# Plot the distribution of global active power
hist(df2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
