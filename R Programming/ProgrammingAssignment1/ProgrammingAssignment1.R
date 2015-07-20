### Warmup

setwd("~/Documents/Courses and Webinar/Coursea/R Programming")
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

weightmedian <- function(directory, day)  {
  files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
  dat <- data.frame()                             #creates an empty data frame
  for (i in 1:5) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
  #while stripping out the NAs
}


###### PART 1 (calculate mean of a column from some selected files)

pollutantmean <- function(directory, pollutant, id = 1:332){
  data <- data.frame()
  files_list <- list.files(directory, full.names=TRUE)
  for (i in id){
    data <-rbind(data,read.csv(files_list[i]))
  }
  mean(data[, pollutant], na.rm=TRUE)
}



##### PART 2 (count the number of complete observations)
complete <- function(directory, id=1:332){
  data <- data.frame()
  files_list <- list.files(directory, full.names=TRUE)
  for (i in id){
    data2 <- data.frame()
    tmp <- read.csv(files_list[i])
    u <- complete.cases(tmp)
    data2 <- cbind(i,nrow(tmp[u,]))
    data <- rbind(data,data2)
  }
  names(data) <- c("id","nobs")
  data
  
}


##### PART 3 (calculate correlation of complete cases)

corr <- function(directory, threshold=0){
  data <- data.frame()
  files_list <- list.files(directory, full.names=TRUE)
  for (i in length(files_list)){
    u <- complete.cases(read.csv(files_list[i]))
    if nrow(read.csv(files_list[i])[u,]) > threshold {
      
      cor XXX...
    }
    data <- rbind(data,data2)
  }
  names(data) <- c("id","nobs")
  data
  
}
### Submit
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
submit()