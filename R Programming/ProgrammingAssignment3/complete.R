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