best <- function(state,outcome)
{source
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
  
  subset_data <- subset_data[subset_data$state==state & subset_data[outcome]!="Not Available",]
  mortality_vals <- subset_data[,outcome]
  min_row <- which.min(mortality_vals)
  subset_data[min_row,]$name
}

best("MD","pneumonia")