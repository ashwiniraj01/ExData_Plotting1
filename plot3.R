#Loading data

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';')

#Subsetting Data

data1 <- data[(strptime(data$Date,format = "%d/%m/%Y") >= strptime("1/2/2007",format = "%d/%m/%Y")
 & strptime(data$Date,format = "%d/%m/%Y") <= strptime("2/2/2007",format = "%d/%m/%Y")),]

#Total no: of rows in subset

max_x <- nrow(data1)

plot_colors <- c("black","red","blue")

# Start PNG device driver to save output
png(filename="C:/Users/araj/Desktop/Coursera/EDA/plot3.png", height=480, width=480, 
 bg="white")

#Plot sub_metering_1

plot(suppressWarnings(as.numeric(levels(data1$Sub_metering_1)))[data1$Sub_metering_1],  type="l"
,xlab = "",xaxt='n',ylab= "Energy Sub Metering",yaxt='n')

# Make x axis using Thu-Sat labels
axis(1, at=seq(0,max_x,by=max_x/2), labels=c("Thu", "Fri", "Sat"))

#Plot sub_metering_2

par(new=TRUE)
plot(suppressWarnings(as.numeric(levels(data1$Sub_metering_2)))[data1$Sub_metering_2],
  type="l", col=plot_colors[2],ylim=c(0,30),xlab = "",xaxt='n',ylab= "")

#Plot sub_metering_3

lines(data1$Sub_metering_3, col=plot_colors[3])

#Create legend

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=plot_colors, lty=1);

#Close device

dev.off()