# Read the Data from the file 
power_cdata <- read.table("C:\\R\\CourseraR\\Exploratory_data_analysis\\household_power_consumption.txt", header=T, sep=';')

# Format the input date to a DAte format 
power_cdata$Date <- as.Date(power_cdata$Date, "%d/%m/%Y")

# Set the Filter Date to a Date Format 
filter_date <- as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d")

# Filter out the data to be plotted.  

final_data <- subset(power_cdata, Date %in% filter_date)

dt= strptime(paste(final_data$Date, final_data$Time), "%d/%m/%Y %H:%M:%S")

# Filter out the data to be plotted.  
## Test out to see the graph comes fine: 
##plot(dt, as.numeric(final_data$Global_active_power)))

## Write the output to a Plot2.png file

png("C:\\R\\CourseraR\\Exploratory_data_analysis\\Plot2.png", width=480, height=480)
plot(dt, as.numeric(final_data$Global_active_power), type="1", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()