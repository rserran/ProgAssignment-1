## polluttant function calculates the mean of the poluutant selected from
## specdata directory monitors selected (id)

## the function assumes directory argument is located in the R working directory

pollutantmean <- function(directory, pollutant, id = 1:332) {
     path <- paste(getwd(), directory, sep = "/")
     files <- c(paste("00", 1:9,".csv", sep = ""),
                paste("0", 10:99,".csv", sep = ""),
                paste(100:332,".csv", sep = "")
                )
     
## create first file path to read.csv     
     file1 <- files[id[1]]
     data <- read.csv(paste(path, file1, sep = "/"))
     
     if(length(id) != 1) {
          for (i in 2:length(id)) {
          data <- rbind(data, read.csv(paste(path, files[id[i]], sep = "/")))
          }
     }
     mean(data[[pollutant]], na.rm = TRUE)
}