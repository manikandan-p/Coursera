#the function draws the plot depicting the energy submetering across different days

draw_Plot3 <- function(){
  
  data <- retrieve_data()
  
  png(filename="plot3.png", width=480, height=480)
  
  plot(data$timeStamp, data$Sub_metering_1, type="l", xlab="",
       ylab="Energy sub metering")
  
  lines(data$timeStamp, data$Sub_metering_2, col="red")
  
  lines(data$timeStamp, data$Sub_metering_3, col="blue")
  
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lwd=1,lty=1)
  
  dev.off()
}

draw_Plot3();