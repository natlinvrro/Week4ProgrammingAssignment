#----------------------------------------#
#:      GETTING AND CLEANING DATA       :#
#:     WEEK 4 - Project Assignment      :#
#:                                      :#
#:                                      :#
#:                                      :#
#----------------------------------------#

#Initializing required library: 'dplyr'
library(dplyr)

#Creating a directory, downloading & unzipping file
if(!file.exists("./data")){dir.create("./data")}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataurl, destfile="./data/HumanActivity.zip", method="curl")
unzip("./data/HumanActivity.zip")

#Reading data: 'features' & adding variable names for subject and y data
features <- read.table("./UCI HAR Dataset/features.txt", sep=" ")
datavariables <- c(as.character(features$V2), "test_id", "subject_id")

#Reading and combining training data: 'x_train', 'y_train' and 'subject_train'
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_data <- mutate(x_train, test_id = y_train$V1, subject_id = subject_train$V1)

#Reading and combining testing data: 'x_test', 'y_test' and 'subject_test'
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_data <- mutate(x_test, test_id = y_test$V1, subject_id = subject_test$V1)

#Combining data frames: 'train_data' & 'test_data'
totaldata <- rbind(train_data, test_data)
colnames(totaldata) <- datavariables
 
#Reading data: 'activity_labels'
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("test_id", "activity")

#Finding and reordering the indices of the required data: "mean()", "std()", "test_id" and "subject_id" 
varindex <- c(grep("subject_id", colnames(totaldata)), grep("test_id", colnames(totaldata)), 
              sort(c(grep("mean()", colnames(totaldata)), grep("std()", colnames(totaldata)))))
totaldata <- totaldata[,varindex]

#Merging data: 'totaldata' and 'activity_labels'
finaldata <- merge(totaldata, activity_labels, by="test_id", all=FALSE)

#Rearranging the final dataset
finalindices <- c(which(colnames(finaldata)=="subject_id"), which(colnames(finaldata)=="activity"),
                which(colnames(finaldata)!="subject_id"&colnames(finaldata)!="activity"))
finaldata <- finaldata[,finalindeces]

#Creating and writing summarized 'finaldata'
finaldatasummarized <- aggregate(finaldata[, 4:82], list(subject_id = finaldata$subject_id,
                                                        activity = finaldata$activity,
                                                        test_id=finaldata$test_id), mean)
finaldatasummarized <- arrange(finaldatasummarized, subject_id, test_id)
write.table(finaldatasummarized, file = "finaldatasummarized.txt", row.name=FALSE)