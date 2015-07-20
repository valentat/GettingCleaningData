## JHU Getting and Cleaning Data course project

# The script downloads and uzips the data it needs, processes it
# and save the results into UCI_HAR_tidy.txt and UCI_HAR_means.txt.

# Here are the data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# You should create one R script called run_analysis.R that does
# the following.
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.


library(reshape2)

# First, download and extract the data if not done yet.
URL = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipname = "UCI_HAR_Dataset.zip"
if (!file.exists(zipname)) {
    download.file(URL, zipname)
}
if (!file.exists("UCI HAR Dataset")) {
    unzip(zipname)
}

# Get feature index/name mapping
features <- read.table("UCI HAR Dataset/features.txt",
                       col.names = c("ID", "Name"))
# Get rid of parentheses
features$Name <- sub("\\(\\)", "", features$Name)
# Desired features
desiredfeats <- grep("-(mean|std)-", features$Name)

# Read train and test data, skip columns (features) we do not want
colClasses = rep("NULL", nrow(features))
colClasses[desiredfeats] = "numeric"
x_train = read.table("UCI HAR Dataset/train/X_train.txt",
                     colClasses = colClasses,
                     col.names = features$Name)
x_test = read.table("UCI HAR Dataset/test/X_test.txt",
                    colClasses = colClasses,
                    col.names = features$Name)

# Read train and test subjects
subj_train = read.table("UCI HAR Dataset/train/subject_train.txt",
                        col.names = "Subject")
subj_test = read.table("UCI HAR Dataset/test/subject_test.txt",
                       col.names = "Subject")

# Activity ID/name mapping
activities = read.table("UCI HAR Dataset/activity_labels.txt",
                        col.names = c("ID", "Name"))

# Read train and test activities
act_train = read.table("UCI HAR Dataset/train/y_train.txt",
                       col.names = "Activity")
act_test = read.table("UCI HAR Dataset/test/y_test.txt",
                      col.names = "Activity")

# Construct final table
# - Cols: Subject, Activity, Features...
# - Rows: Train, Test
data <- rbind(cbind(subj_train, act_train, x_train),
              cbind(subj_test, act_test, x_test))
# Remap activity ID to a factor of names
data$Activity = factor(data$Activity,
                       levels = activities$ID,
                       labels = activities$Name)

# Write out the tidy data
write.table(data, "UCI_HAR_tidy.txt", row.names = FALSE)

# Calculate mean of each feature by Subject and Activity
melted = melt(data, id = c("Subject", "Activity"))
data_means = dcast(melted, Subject + Activity ~ variable, mean)

# Write means to a file
write.table(data_means, "UCI_HAR_means.txt", row.names = FALSE)
