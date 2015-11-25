draw_Plot3 <-function(){
  data_subset <- NEI[NEI$fips=="24510",]
  
  #Subsetting the necessary data by year and type
  total_emissions <- aggregate(data_subset$Emissions,by=list(data_subset$year,data_subset$type), sum, na.rm=TRUE);
  
  #Renaming the necessary columns in data subset
  colnames(total_emissions) <- c("year","type","Emissions");
  
  #Importing the ggplot2 library
  library(ggplot2)
  
  #Creating the necessary png file for submission
  png("plot3.png",height=600,width=600,units="px",bg="transparent");
  
  #Initializing a new plot
  plot.new()  
  
  #Creating the necessary ggplot of PM 2.5 emissions across years and type
  plot3 <- ggplot(total_emissions,aes(x = total_emissions$year,y = total_emissions$Emissions,color = total_emissions$type)) + 
    geom_line() + labs(x = "years") + labs(y = expression("Total PM"[2.5]*" Emissions (Tons)")) + 
    labs(title = expression("Total PM"[2.5]*" Emissions (Tons) in Baltimore across years and types"))
  
  print(plot3)
  
  dev.off();
} 
