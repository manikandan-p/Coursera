draw_Plot2 <-function(){
  data_subset <- NEI[NEI$fips=="24510",]
  
  #Subsetting the necessary data
  total_emissions <- aggregate(data_subset$Emissions,by=list(data_subset$year), sum, na.rm=TRUE);
  
  #Renaming the necessary columns in data subset
  colnames(total_emissions) <- c("year","Emissions");
  
  #Creating the necessary png file for submission
  png("plot2.png",height=480,width=480,units="px",bg="transparent");
  
  #Plotting bar plot for total emissions across years
  barplot((total_emissions$Emissions),names.arg=total_emissions$year,xlab="years", ylab = 
            "PM2.5 emissions(in tons)", main="Total PM2.5 emissions from Baltimore city sources across years");
  
  dev.off();
} 
