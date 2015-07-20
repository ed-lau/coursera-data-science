data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
best <- function(state, outcome) {
  ## Read outcome data
  
  ## Check that state and outcome are valid
  if (outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia"){
  }
  else{
    stop("invalid outcome")
  }
  
  data2 <- data[which(data$State == state),7]
  if (length(data2) == 0){
    stop("invalid state")
  }
  
  
  ## Return hospital name in that state with lowest 30-day death
  
  data3 <- data[which(data$State == state),]
  
  
  if (outcome == "heart attack"){
    data4 <- data3[which(data3[,11] != "Not Available"),]
    bestnumber <- min(as.numeric(data4[,11]))
    y <- data4[data4[,11]==bestnumber,2]
    return(y)
  }
  
  
  if (outcome == "heart failure"){
    data4 <- data3[which(data3[,17] != "Not Available"),]
    bestnumber <- min(as.numeric(data4[,17]))
    y <- data4[data4[,17]==bestnumber,2]
    return(y)
  }
  
  if (outcome == "pneumonia"){
    data4 <- data3[which(data3[,23] != "Not Available"),]
    bestnumber <- min(as.numeric(data4[,23]))
    y <- data4[data4[,23]==bestnumber,2]
    return(y)
  }
}

