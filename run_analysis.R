## Cleaning Data Week 4 Assignment 

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##clear env and load libraries
rm(list=ls())
library(dplyr)
library(data.table)

##set dir to downloaded files
setwd("C:/Users/aliza.shoop/Projects/DataScientistsToolbox/UCI HAR Dataset")

#read and load all files
features <- read.table('./features.txt',header=FALSE); 
activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
subject_train <- read.table('./train/subject_train.txt',header=FALSE); 
x_train <- read.table('./train/x_train.txt',header=FALSE); 
y_train <- read.table('./train/y_train.txt',header=FALSE);
subject_test <- read.table('./test/subject_test.txt',header=FALSE);
x_test <- read.table('./test/x_test.txt',header=FALSE);
y_test <- read.table('./test/y_test.txt',header=FALSE);


#rename columns
names(activity_labels) <- c('activityid','activity');
names(subject_train) <- "subject";
names(x_train) <- features[,2]; 
names(y_train) <- "activityid";
names(subject_test) <- "subject";
names(x_test) <- features[,2];
names(y_test) <- "activityid";


#get std and mean columns
stdormean <- grepl("std|mean", features[,2])
x_test <- x_test[,stdormean]
x_train <- x_train[,stdormean]

#link the labels to the ids in y tables
y_test1 <- merge(y_test, activity_labels, by = "activityid")
y_train1 <- merge(y_train, activity_labels, by = "activityid")

#merge data from the 3 files
testing <- cbind(as.data.table(subject_test),y_test1,x_test)
training <- cbind(as.data.table(subject_train),y_train1,x_train);


#merge training data and test data
merged <- rbind(training,testing);

##clean up column names

names(merged) <- sub("BodyBody","Body",names(merged))
names(merged)  <- sub("()","",names(merged))
names(merged)  <- gsub("-","",names(merged))
names(merged)  <- gsub("\\(","",names(merged))
names(merged)  <- gsub("\\)","",names(merged))

##calculate mean for each subject/activity group
run_analysis<- (merged%>%
                        group_by(subject,activity) %>%
                        summarise_each(funs(mean)))

##rename full tidy data set
tidy_data <- merged
##rename summary tidy data set
mean_tidy_data <- run_analysis

#print dataset
write.table(tidy_data,file="tidy_data.txt")
write.table(run_analysis,file="mean_tidy_data.txt")