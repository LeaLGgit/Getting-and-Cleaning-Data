## Programming assigenmnt of Coursera Course "Getting and Cleaning Data"
# run_analysis.R

#load or maybe prior to that install.packages
library(tidyverse)


### STEP 1 ----

#import Data sets to your working directory:
wd_getcleandata <- getwd() ## check the destination where the Zip file will be downloaded to
filename <- c("ProgrammingAssignment.zip")

if (!file.exists(filename)){
  fileURL <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
  download.file(fileURL, filename)
  unzip(filename)
}

# set if import was successful and set new working directory 
if(!file.exists("UCI HAR Dataset")){
  print("UCI HAR Dataset not exists")
} else{
  wd_Dataset <- paste0(wd_getcleandata,c("/ProgrammingAssignment/UCI HAR Dataset" ))
}

# import txt files labels, features 
setwd(wd_Dataset)
activity_labels <- read.table("activity_labels.txt", col.names = c("act_code", "activity"))
features <- read.table("features.txt", col.names = c("id", "feature"))

# import txt files of the test subjects 
setwd(paste0(wd_Dataset, "/test"))
subject_test <- read.table("subject_test.txt", col.names = c("subject_id"))   # subject id
xtest <- read.table("X_test.txt", col.names = features$feature) #variables
ytest <- read.table("Y_test.txt", col.names = c("act_code"))    # activity code

# import txt files of the training subject
setwd(paste0(wd_Dataset, "/train"))
subject_train <- read.table("subject_train.txt", col.names = c("subject_id"))  # subject id
xtrain <- read.table("X_train.txt", col.names = features$feature) #variables
ytrain <- read.table("Y_train.txt", col.names = c("act_code"))  # activity code


# merge data 
test <- cbind(subject_test, ytest, xtest)  # merging data of the test subjects
train <- cbind(subject_train, ytrain, xtrain) # merging data of the train subjects
mergedata <- rbind(test,train)




### STEP 2 ----

# find measurements of only mean and standard deviation for each measurement
cols <- (grep("mean|std",names(mergedata)))    #mean and std are all lowercase, plus one needs to be added so colums indices can be used
tidydata_1 <- mergedata[, c(1:2, cols)]



### STEP 3 ----

# replacing activity code with names 
tidydata_2 <- merge(tidydata_1, activity_labels, by.x="act_code", by.y = "act_code") %>% 
  select(2, 82, 3:81 ) %>% 
  arrange(subject_id, activity)


### STEP4 ----

# renaming variable names

#adjusting prefixes
names(tidydata_2) <- sub("^t", "Time", names(tidydata_2))
names(tidydata_2) <- sub("^f", "Frequency", names(tidydata_2))
#writing out signal names
names(tidydata_2) <- sub("[Aa]cc", "Accelerometer", names(tidydata_2))
names(tidydata_2) <- sub("[Gg]yro", "Gyroscope", names(tidydata_2))
#writing out 3 axial signal vectors
names(tidydata_2) <- sub("[X]", "_Xaxis",names(tidydata_2))
names(tidydata_2) <- sub("[Y]", "_Yaxis",names(tidydata_2))
names(tidydata_2) <- sub("[Z]", "_Zaxis",names(tidydata_2))
#writing out mathmatical 
names(tidydata_2) <- sub("[Mm]ag", "Magnitude", names(tidydata_2))
# others 
names(tidydata_2) <- gsub("\\.", "", names(tidydata_2))
names(tidydata_2) <- gsub("BodyBody","Body",names(tidydata_2))
names(tidydata_2) <- gsub("tBody","TimeBody",names(tidydata_2))
names(tidydata_2) <- gsub("mean", "Mean", names(tidydata_2))
names(tidydata_2) <- gsub("std", "Std", names(tidydata_2))



str(tidydata_2)

## STEP 5 ----

# calculate mean of each variable for each subject and activity

finaldata <- tidydata_2  %>%
  group_by(subject_id, activity) %>% 
  summarise_if(is.numeric,mean)

# store locally
setwd(paste0(wd_getcleandata, "/ProgrammingAssignment"))
write.table(finaldata, "FinalDataset.csv" )







