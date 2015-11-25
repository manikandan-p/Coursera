#This function enables retrieval, subsetting and formatting of data from text file

retrieve_data <- function(){
  elec_data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"));
  
  elec_data <- elec_data[(elec_data$Date == "1/2/2007") | (elec_data$Date == "2/2/2007"),]
  
  elec_data$timeStamp <- strptime(paste(elec_data$Date, elec_data$Time), "%d/%m/%Y %H:%M:%S")
  
  return(elec_data);
}
