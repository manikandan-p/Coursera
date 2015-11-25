source('retrieve_data.R');

#The function draws the necessary plot depicting power consumption across different days
draw_Plot2 <- function(){
  #retrieves the necessary data
  data <- retrieve_data();
  png(filename="plot2.png", width=480, height=480)
  plot(data$timeStamp, data$Global_active_power, type="l", xlab="",
       ylab="Global Active Power (kilowatts)")
  dev.off()
}

draw_Plot2();