# Read the Data from the file 
power_cdata <- read.table("C:\\R\\CourseraR\\Exploratory_data_analysis\\household_power_consumption.txt", header=T, sep=';')

# Format the input date to a DAte format 
power_cdata$Date <- as.Date(power_cdata$Date, "%d/%m/%Y")

# Set the Filter Date to a Date Format 
filter_date <- as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d")

# Filter out the data to be plotted.  

final_data <- subset(power_cdata, Date %in% filter_date)

# Change Date to Posix Notation 

dt=as.POSIXct(paste(final_data$Date, final_data$Time))


## Write the output to a Plot3.png file

png("C:\\R\\CourseraR\\Exploratory_data_analysis\\Plot3.png", width=480, height=480)

plot(dt,final_data$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(dt,final_data$Sub_metering_2, type="l", col="red")
lines(dt,final_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub Meter 1", "Sub Meter 2", "Sub Meter 3"), lty=1, lwd=1 , col=c("black", "red","blue"))

dev.off()
