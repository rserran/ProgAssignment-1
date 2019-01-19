## corr function calculates the correlation between sulfate and nitrate for
## monitor locations where the number of completely observed cases (on all 
## variables) is greater than the threshold)

## the function assumes directory argument is located in the R working directory

corr <- function(directory, threshold = 0) {
     path <- paste(getwd(), directory, sep = "/")
     files <- c(paste("00", 1:9,".csv", sep = ""),
                paste("0", 10:99,".csv", sep = ""),
                paste(100:332,".csv", sep = "")
     )

## vcorr - variable to store the correlation results
     vcorr <- vector()
     
     source("complete.R")
     allmonitorcomplete <- complete("specdata")
     fallmonitorcomplete <- subset(allmonitorcomplete, allmonitorcomplete$nobs > threshold)
     
     for (i in fallmonitorcomplete$id) {
          gdata <- read.csv(paste(path, files[i], sep = "/"))
          gdata <- subset(gdata, complete.cases(gdata))
          vcorr <- c(vcorr, cor(gdata$nitrate, gdata$sulfate,
                                     use = "complete.obs"))   
          }
     vcorr
}