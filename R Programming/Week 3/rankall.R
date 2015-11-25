rankall <- function(outcome,num="best"){
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(outcome %in% valid_outcomes == FALSE){
    stop("invalid outcome")
  }
  
  if(num!="best" && num!="worst" && num%%1!=0){
    stop("invalid rank")
  }
  
  hosp_data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  
  subset_data <- hosp_data[c(2,7,11,17,23)]
  names(subset_data)[1]<- "name"
  names(subset_data)[2]<- "state"
  names(subset_data)[3]<- "heart attack"
  names(subset_data)[4]<- "heart failure"
  names(subset_data)[5]<- "pneumonia"
  
  subset_data[,3] <- na.omit(subset_data[3])
  subset_data[,4] <- na.omit(subset_data[4])
  subset_data[,5] <- na.omit(subset_data[5])
  
  subset_data <- subset_data[subset_data[outcome]!='Not Available',]
  
  subset_data[outcome] <- as.data.frame(sapply(subset_data[outcome],as.numeric))
  subset_data <- subset_data[order(subset_data$name,decreasing=FALSE),]
  subset_data <- subset_data[order(subset_data[outcome],decreasing=FALSE),]
  
  valid_states <- unique(subset_data[,2])
  best_hosp_data <- data.frame("hospital" =character(),"state"=character())
  
  per_state_ranking <- function(data,s,n){
    data<-data[data$state==s,]
    mortality_vals <- data[,outcome]
    
    search_index <- if(num == "best"){
      which.min(mortality_vals)    
    }
    else if(num == "worst"){
      which.max(mortality_vals)
    }
    else{
      num
    }
    data[search_index,]$name
  }
  
  states <- subset_data[,2]
  states<-unique(states)
  for(st in states){
    hosp_name <- per_state_ranking(subset_data,st,num)
    best_hosp_data <- rbind(best_hosp_data,data.frame(hospital=hosp_name,state=st))
  }
  best_hosp_data <- best_hosp_data[order(best_hosp_data['state'],decreasing=FALSE),]
  best_hosp_data
}  