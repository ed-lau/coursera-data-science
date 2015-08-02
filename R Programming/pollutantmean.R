pollutantmean <- function(directory, pollutant, id = 1:332){
  data <- data.frame()
  files_list <- list.files(directory, full.names=TRUE)
  for (i in id){
    data <-rbind(data,read.csv(files_list[i]))
  }
  mean(data[, pollutant], na.rm=TRUE)
}