library(plyr)
library(dplyr)
library(reshape2)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileURL, "getdata_dataset.zip", method="curl")
unzip("getdata_dataset.zip")

#Step 1
#Merge the training and test sets to create one data set 
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainx <- read.table("UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("UCI HAR Dataset/train/y_train.txt")

subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
testx <- read.table("UCI HAR Dataset/test/X_test.txt")
testy <- read.table("UCI HAR Dataset/test/y_test.txt")

#Merge Train and Test data sets
#Choosing to rbind each x and y dataset allows for an easy naming convention for columns
masterx <- rbind(trainx, testx)
mastery <- rbind(trainy, testy)

#Read in column names and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activitylabels) <- c("Index", "Activity")

#Name training and test columns
names(masterx) <- features[,2]

#Create Subject data set and name the column name
sub_data <- rbind(subtrain, subtest)
names(sub_data) <- "Subject"

#Step 2
#Extract only the measurements on the mean and standard deviation for each measurement

#Select only column names that contain mean or std using grepl
meanstd <- filter(features, grepl("mean|std", features$V2))
masterx <- masterx[, meanstd[,1]]

#Step 3
#Use descriptive activity names to name the activities in the data set
mastery[, 1] <- activitylabels[mastery[,1],2]
names(mastery) <- "Activity"

#Step 4
#Appropriately label the data set with descriptive variable names
master <- cbind(sub_data, mastery, masterx)

#Step 5
#Create a second, independent tidy data set with the average of each variable
meltedmaster <- melt(master, c("Subject", "Activity"))
meanmaster <- dcast(meltedmaster, Subject + Activity ~ variable, mean)
write.table(meanmaster, "tidymaster.txt", row.name=FALSE)

