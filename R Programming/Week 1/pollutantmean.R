pollutantmean <- function(directory, pollutant, id=1:332)
{
  pollutant_file <- list.files(directory,pattern="*.csv", full.names=TRUE)
  master_data_frame <- NULL
  for(count in id)
  {
    master_data_frame <- rbind(master_data_frame,
                               read.csv(pollutant_file[count],header=TRUE))
  }
  print(length(id))
  round(colMeans(master_data_frame[pollutant],na.rm=TRUE),3)
}

pollutantmean("specdata","sulfate",1:10)

