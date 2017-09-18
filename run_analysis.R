# Getting and Cleaning Data course project

# Must clean up workspace before starting
rm(list=ls()) 

# Step 0 Download and unzip the data
# This will be in your working directory. This is the time to change it
# if you need to. 
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")


# Step 1 Merges the training and the test sets to create one data 
# set.

# Read in the files

# Feature table
features <- read.table('./data/UCI HAR Dataset/features.txt',header=FALSE)
# Activity table
activitytype <- read.table('./data/UCI HAR Dataset/activity_labels.txt',header=FALSE)
colnames(activitytype)  = c('activityId','activitytype')

# Training files
xtrain <- read.table('./data/UCI HAR Dataset/train/x_train.txt',header=FALSE)
ytrain <- read.table('./data/UCI HAR Dataset/train/y_train.txt',header=FALSE)
subjecttrain <- read.table('./data/UCI HAR Dataset/train/subject_train.txt',header=FALSE)
# Column names for training data
colnames(xtrain) <- features[,2] 
colnames(ytrain) <-"activityId"
colnames(subjecttrain) <- "subjectId"

# Testing files
xtest <- read.table('./data/UCI HAR Dataset/test/x_test.txt',header=FALSE)
ytest <- read.table('./data/UCI HAR Dataset/test/y_test.txt',header=FALSE)
subjecttest <- read.table('./data/UCI HAR Dataset/test/subject_test.txt',header=FALSE)
# Column names for testing data
colnames(xtest) <- features[,2] 
colnames(ytest) <- "activityId"
colnames(subjecttest) <- "subjectId"

# Merge columns for each training and testing data sets
train <- cbind(ytrain, subjecttrain, xtrain)
test <- cbind(ytest, subjecttest, xtest)

# Merge training and testing 
alldata <- rbind(train, test)

# Step 2 Extracts only the measurements on the mean and standard 
# deviation for each measurement.

colNames <- colnames(alldata)
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
mean_and_std_subset <- alldata[ , mean_and_std == TRUE]

# Step 3 Uses descriptive activity names to name the activities 
# in the data set

namedactivities <- merge(mean_and_std_subset, activitytype, by='activityId', 
                         all.x=TRUE)

# Step 4 Appropriately labels the data set with descriptive 
# variable names.

names(namedactivities)<-gsub("Acc", "Accelerometer", names(namedactivities))
names(namedactivities)<-gsub("Gyro", "Gyroscope", names(namedactivities))
names(namedactivities)<-gsub("BodyBody", "Body", names(namedactivities))
names(namedactivities)<-gsub("Mag", "Magnitude", names(namedactivities))
names(namedactivities)<-gsub("^t", "Time", names(namedactivities))
names(namedactivities)<-gsub("^f", "Frequency", names(namedactivities))
names(namedactivities)<-gsub("tBody", "TimeBody", names(namedactivities))
names(namedactivities)<-gsub("-mean()", "Mean", names(namedactivities), ignore.case = TRUE)
names(namedactivities)<-gsub("-std()", "STD", names(namedactivities), ignore.case = TRUE)
names(namedactivities)<-gsub("-freq()", "Frequency", names(namedactivities), ignore.case = TRUE)
names(namedactivities)<-gsub("angle", "Angle", names(namedactivities))
names(namedactivities)<-gsub("gravity", "Gravity", names(namedactivities))

# Step 5 From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.

secondtidyset <- aggregate(. ~subjectId + activityId, namedactivities, mean)
secondtidyset <- secondtidyset[order(secondtidyset$subjectId, secondtidyset$activityId),]

write.table(secondtidyset, "secondtidyset.txt", row.name=FALSE)
