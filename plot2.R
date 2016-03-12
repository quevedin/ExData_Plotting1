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

t1=as.Date("01/02/2007","%d/%m/%Y")
t2=as.Date("02/02/2007","%d/%m/%Y")
df2=df[df$Date %in% t1:t2, ]


#####

df2$timestamp=as.POSIXct(paste(df2$Date,df2$Time))
png("plot2.png", width=480, height=480, units="px")
plot(df2$timestamp,df2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
########
