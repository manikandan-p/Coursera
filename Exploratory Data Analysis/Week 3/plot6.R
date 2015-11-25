draw_Plot6 <- function() {
# Subset vehicle data in NEI
vehicle_data <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle_SCC <- SCC[vehicle_data,]$SCC
vehicle_NEI <- NEI[NEI$SCC %in% vehicle_SCC,]

# Subset Baltimore and Los angeles data.
vehicle_balt_nei <- vehicle_NEI[vehicle_NEI$fips=="24510",]
vehicle_balt_nei$city <- "Baltimore City"

vehicle_la_nei <- vehicle_NEI[vehicle_NEI$fips=="06037",]
vehicle_la_nei$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
city_data <- rbind(vehicle_balt_nei,vehicle_la_nei)

png("plot6.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

plot6 <- ggplot(city_data, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="years", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions Baltimore vs LA"))

print(plot6)

dev.off()
}