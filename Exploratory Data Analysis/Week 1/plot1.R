source('retrieve_data.R');

#The function enables the histogram of size 480 x 480 to be drawn into a png image

draw_Plot1 <- function(){
  #function retrieves the necessary data
  data <- retrieve_data();
  
  png(filename="plot1.png",width=480,height=480,units="px")
  
  hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  
  dev.off();
}

draw_Plot1();