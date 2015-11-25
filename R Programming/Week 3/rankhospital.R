rankhospital<-function(state,outcome,num="best"){
  
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(outcome %in% valid_outcomes == FALSE){
    stop("invalid outcome")
  }
  
  hosp_data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  
  valid_states <- unique(hosp_data[,7])
  
  if(state %in% valid_states == FALSE){
    stop("invalid state")  
  }
  
  subset_data <- hosp_data[c(2,7,11,17,23)]
  names(subset_data)[1]<- "name"
  names(subset_data)[2]<- "state"
  names(subset_data)[3]<- "heart attack"
  names(subset_data)[4]<- "heart failure"
  names(subset_data)[5]<- "pneumonia"
  
  subset_data[,3] <- na.omit(subset_data[3])
  subset_data[,4] <- na.omit(subset_data[4])
  subset_data[,5] <- na.omit(subset_data[5])
  
  if(num!="best" && num!="worst" && num%%1!=0){
    stop("invalid rank")
  }
  
  state_data <- subset_data[subset_data$state==state & subset_data[outcome]!='Not Available',]
  
  state_data[outcome] <- as.data.frame(sapply(state_data[outcome],as.numeric))
  state_data <- state_data[order(state_data$name,decreasing=FALSE),]
  state_data <- state_data[order(state_data[outcome],decreasing=FALSE),]
  
  mortality_vals <- state_data[,outcome]
  
  search_index <- if(num == "best"){
                which.min(mortality_vals)    
  }
  else if(num == "worst"){
    which.max(mortality_vals)
  }
  else{
    num
  }
  state_data[search_index,]$name
  
}
