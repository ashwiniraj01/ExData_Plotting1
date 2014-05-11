# Loading Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';')

#Subsetting Data

data1 <- data[(strptime(data$Date,format = "%d/%m/%Y") >= strptime("1/2/2007",format = "%d/%m/%Y")
 & strptime(data$Date,format = "%d/%m/%Y") <= strptime("2/2/2007",format = "%d/%m/%Y")),]

# Start PNG device driver to save output
png(filename="C:/Users/araj/Desktop/Coursera/EDA/plot4.png", height=480, width=480, 
 bg="white")

attach(data1)
par(mfrow=c(2,2))
max_x <- nrow(data1)
plot_colors <- c("black","red","blue")

#Plot Global active power

plot(suppressWarnings(as.numeric(levels(data1$Global_active_power)))[data1$Global_active_power],
  type="l",xlab = "",xaxt='n',ylab= "Global Active Power")
axis(1, at=seq(0,max_x,by=max_x/2), labels=c("Thu", "Fri", "Sat"))

#Plot Voltage

plot(suppressWarnings(as.numeric(levels(data1$Voltage)))[data1$Voltage], type="l",
xlab = "datetime",xaxt='n',ylab= "Voltage")
axis(1, at=seq(0,max_x,by=max_x/2), labels=c("Thu", "Fri", "Sat"))

#Plot Energy Sub metering

plot(suppressWarnings(as.numeric(levels(data1$Sub_metering_1)))[data1$Sub_metering_1],  type="l"
,xlab = "",xaxt='n',ylab= "Energy Sub Metering",yaxt='n')
par(new=TRUE)
plot(suppressWarnings(as.numeric(levels(data1$Sub_metering_2)))[data1$Sub_metering_2],
  type="l", col=plot_colors[2],ylim=c(0,30),xlab = "",xaxt='n',ylab= "")
lines(data1$Sub_metering_3, col=plot_colors[3])
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=plot_colors, lty=1);
axis(1, at=seq(0,max_x,by=max_x/2), labels=c("Thu", "Fri", "Sat"))

#Plot Global reactive power

plot(suppressWarnings(as.numeric(levels(data1$Global_reactive_power)))[data1$Global_reactive_power],
 type="l",xlab = "datetime",xaxt='n',ylab= "Global_reactive_power")
axis(1, at=seq(0,max_x,by=max_x/2), labels=c("Thu", "Fri", "Sat"))

#Close device

dev.off()