complete <- function(directory,id = 1:332){
  
  file_list <- list.files(directory,pattern="*.csv", full.names=TRUE)
  input_size<- length(id)
  id_row <- NULL
  missing_row <-NULL
  master_data_frame <- data.frame(ids=integer(input_size), 
                            nobs=integer(input_size),stringsAsFactors = FALSE)
  for(count in id)
  {
    temp_data_frame <- read.csv(file_list[count],header=TRUE)
    missing <- sum(complete.cases(temp_data_frame))
    id_row <- c(id_row,count)
    missing_row <- c(missing_row, missing)
  }
  master_data_frame <- data.frame(ids=id_row, nobs=missing_row,stringsAsFactors = FALSE)
  return(master_data_frame)
}

complete("specdata")