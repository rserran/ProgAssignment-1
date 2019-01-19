## complete function reports the number of completely observed cases in each
## data file selected (id)

## the function assumes directory argument is located in the R working directory

complete <- function(directory, id = 1:332) {
     path <- paste(getwd(), directory, sep = "/")
     files <- c(paste("00", 1:9,".csv", sep = ""),
                paste("0", 10:99,".csv", sep = ""),
                paste(100:332,".csv", sep = "")
     )
     numberf=length(id)
     results <- matrix(ncol = 2, nrow = numberf)
     
##loop to sum complete cases for each .csv file
     for (i in 1:numberf) {
          results[i,] = c(id[i], sum(complete.cases(read.csv(paste(path, files[id[i]],
                                                            sep = "/")))))
          }
##print results in the format specified     
     results <- setNames(data.frame(results), c("id", "nobs"))
     results
}