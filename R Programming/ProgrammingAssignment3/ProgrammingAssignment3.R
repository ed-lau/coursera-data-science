## Working directory
setwd("~/Documents/Courses and Webinar/Coursea/R Programming/ProgrammingAssignment3")


## Part 1 (30-day mortality)
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

## Part 2 (Best hospital in state)
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

# First subset by the selected state

data3 <- data[which(data$State == state),]

# One If loop for each outcome; subset to data4 by removing all NAs

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


## Part 3 (RANK HOSPITAL)


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
