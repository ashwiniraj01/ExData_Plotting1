#Loading data

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';')

#Subsetting data

data1 <- data[(strptime(data$Date,format = "%d/%m/%Y") >= strptime("1/2/2007",format = "%d/%m/%Y")
 & strptime(data$Date,format = "%d/%m/%Y") <= strptime("2/2/2007",format = "%d/%m/%Y")),]

#Total no: of rows

max_x <- nrow(data1)

# Start PNG device driver to save output
png(filename="C:/Users/araj/Desktop/Coursera/EDA/plot2.png", height=480, width=480, 
 bg="white")

#Plot line graph
plot(suppressWarnings(as.numeric(levels(data1$Global_active_power)))[data1$Global_active_power],
  type="l",xlab = "",xaxt='n',ylab= "Global Active Power(kilowatts)")

# Make x axis using thu-sat labels
axis(1, at=seq(0,max_x,by=max_x/2), labels=c("Thu", "Fri", "Sat"))

#Close device

dev.off()