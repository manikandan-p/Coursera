corr <- function(directory,threshold = 0){
  file_list <- list.files(directory,pattern="*.csv", full.names=TRUE)
  corr_data_list <- complete(directory)
  corr_vec <- vector(mode="numeric",length=0)
  
  for(count in 1:nrow(corr_data_list)){
    if(corr_data_list[count,"nobs"] > threshold){
      temp_data_frame <- na.omit(read.csv(file_list[count],header=TRUE))
      corr_vec<- c(corr_vec,signif(cor(temp_data_frame$sulfate,temp_data_frame$nitrate),4))
    }

  }
  return(corr_vec)
}
cr <- corr("specdata")
head(cr)
summary(cr)
