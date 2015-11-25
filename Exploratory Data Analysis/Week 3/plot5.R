draw_Plot5 <- function(){
  # check for motor vehicle patterns
  vehicle_data <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
   
  #Getting the necessary SCC ids from the SCC set matching the vehicle pattern
  vehicle_SCC <- SCC[vehicle_data,]$SCC
  
  #Subset the necessary rows in NEI with matching ids in SCC
  vehicle_NEI <- NEI[NEI$SCC %in% vehicle_SCC,]
  
  #Subset the necessary vehicle emission data for baltimore city
  vehicle_NEI <- vehicle_NEI[vehicle_NEI$fips=="24510",]
  
  #create the necessary plot for submission
  png("plot5.png",width=480,height=480,units="px",bg="transparent")
  
  #import the necessary package
  library(ggplot2)
  
  #Create the necessary ggplot with emissions in 10^5 tons for easier readability
  plot5 <- ggplot(vehicle_NEI,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="black",width=0.5) +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emissions (in tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore across the years"))
  
  #printing the necessary ggplot
  print(plot5)
  
  dev.off()
}