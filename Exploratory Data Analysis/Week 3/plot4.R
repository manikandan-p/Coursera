draw_Plot4 <- function(){
  # check for coal and combustion patterns
  combustion_data <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
  coal_data <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
  
  #Condition for checking coal combustion
  combustion_coal <- (combustion_data & coal_data)
  
  #Getting the necessary SCC ids from the SCC set satisfying the condition
  combustion_SCC <- SCC[combustion_coal,]$SCC
  
  #Subset the necessary data with matching ids
  combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]
  
  #create the necessary plot for submission
  png("plot4.png",width=480,height=480,units="px",bg="transparent")
  
  #import the necessary package
  library(ggplot2)
  
  #Create the necessary ggplot with emissions in 10^5 tons for easier readability
  plot4 <- ggplot(combustion_NEI,aes(factor(year),Emissions/10^5)) +
    geom_bar(stat="identity",fill="black",width=0.5) +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (in 10^5 Tons)")) + 
    labs(title=expression("PM"[2.5]*" Coal Combustion Emissions in US across the years"))
  
  #printing the necessary ggplot
  print(plot4)
  
  dev.off()
}