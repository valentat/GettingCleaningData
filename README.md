# Getting and Cleaning Data course project

This is a course project for Coursera's Getting and Cleaning Data.


## Objectives

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called `run_analysis.R` that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Instructions

1. Run the script [`run_analysis.R`](run_analysis.R).
2. It should automatically download, extract and process the data specified above in your working directory.
3. After a successful run, two files are created in your working directory:
  * [`UCI_HAR_tidy.txt`](UCI_HAR_tidy.txt) -- A tidy dataset based on the original data. For details, see the [Codebook](Codebook.md).
  * [`UCI_HAR_means.txt`](UCI_HAR_means.txt) -- A dataset created from [`UCI_HAR_tidy.txt`](UCI_HAR_tidy.txt) with means of features by Subject and Activity.
