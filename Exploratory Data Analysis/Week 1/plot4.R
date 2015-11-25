source('retrieve_data.R');
#The function draws the necessary global active/reactive power, voltage and energy submetering across different days
draw_Plot4 <- function(){

data <- retrieve_data();

png(filename="plot4.png", width=480, height=480)

# Setting the canvas for 4 plots
par(mfcol=c(2,2))

# First plot
plot(data$timeStamp, data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Second plot
plot(data$timeStamp, data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data$timeStamp, data$Sub_metering_2, col="red")
lines(data$timeStamp, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1,lwd=1, bty="n")

# Third Plot
plot(data$timeStamp, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(data$timeStamp, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
}

draw_Plot4();