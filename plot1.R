
# Loading Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';')

#Subsetting Data

data1 <- data[(strptime(data$Date,format = "%d/%m/%Y") >= strptime("1/2/2007",format = "%d/%m/%Y")
 & strptime(data$Date,format = "%d/%m/%Y") <= strptime("2/2/2007",format = "%d/%m/%Y")),]

# Start PNG device driver to save output
png(filename="C:/Users/araj/Desktop/Coursera/EDA/plot1.png", height=480, width=480, 
 bg="white")

#Create histogram

hist(suppressWarnings(as.numeric(levels(data1$Global_active_power)))[data1$Global_active_power],col = "red",
main="Global Active Power" ,
xlab="Global Active Power(kilowatts)",xlim=c(0,6),ylim=c(0, 1200),breaks=12)

#Close Device
dev.off()