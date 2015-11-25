draw_Plot1 <-function(){
  #Subsetting the necessary data
  total_emissions <- aggregate(NEI$Emissions,by=list(NEI$year), sum, na.rm=TRUE);
  
  #Renaming the necessary columns in data subset
  colnames(total_emissions) <- c("year","Emissions");
  
  #Creating the necessary png file for submission
  png("plot1.png",height=480,width=480,units="px",bg="transparent");
  
  #Dividing the emissions by 10^6 for easier representation and readability
  barplot((total_emissions$Emissions/10^6),names.arg=total_emissions$year,xlab="years", ylab = 
            "PM2.5 emissions in 10^6 tons", main="Total PM2.5 emissions from all US sources across years");
  
  dev.off();
} 

