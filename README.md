# Coursera-Getting-and-Cleaning-Data-Course-Project

The respository here hosts the documentation for the Coursera class "Getting and Cleaning Data" course project. This contains a data processing script "run_analysis.R" to produce the tidy data set "meanmaster.txt"

The original data is pulled from the website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# About the Files

"getdata_dataset.zip" contains the raw zip files

"CodeBook.md" details data collection process as well as the variable types, data, and definitions

"run_analysis.R" contains the script that does the following:

-Merges the training and the test sets to create one data set

-Extracts only the measurements on the mean and standard deviation for each measurement

-Uses descriptive activity names to name the activities in the data set

-Appropriately labels the data set with descriptive variable names

-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

"tidymaster.txt" is the resulting, tidy dataset with the average of each variable for each activity and each subject
