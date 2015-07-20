

data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
rankhospital <- function(state, outcome, num = "best") {
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
  
  # First subset by the selected state
  
  data3 <- data[which(data$State == state),]
  
  # One If loop for each outcome; subset to data4 by removing all NAs
  
  if (outcome == "heart attack"){
    index <- 11}
  if (outcome == "heart failure"){
    index <-17}
  if (outcome == "pneumonia"){
    index <- 23}
  
  data4 <- data3[which(data3[,index] != "Not Available"),]
  data5 <- data4[order(as.numeric(data4[,index]),data4[,2]),]
  if (num == "best"){
    y <- data5[1,2]
    return(y)
  }
  if (num == "worst"){
    y <- data5[length(data5[,11]),2]
    return(y)
  }
  else{
    y <- data5[num,2]
    return(y)
  }
  
}