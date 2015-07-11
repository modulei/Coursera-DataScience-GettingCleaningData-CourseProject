# Coursera - Getting and Cleaning Data - Course Project
# run_analysis.R
#
# BEGIN INSTRUCTIONS:
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. 
# You will be graded by your peers on a series of yes/no questions related to the project. 
# You will be required to submit: 
#   DONE 1) a tidy data set as described below, 
#   2) a link to a Github repository with your script for performing the analysis, and 
#   3) a code book that describes the variables, the data, and any transformations or work 
#       that you performed to clean up the data called CodeBook.md. You should also include
#       a README.md in the repo with your scripts. This repo explains how all of the scripts 
#       work and how they are connected.  
#
# One of the most exciting areas in all of data science right now is wearable computing. 
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained: 
#
#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
# Here are the data for the project: 
#  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# You should create one R script called run_analysis.R that does the following. 
#  1) Merges the training and the test sets to create one data set.
#  2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3) Uses descriptive activity names to name the activities in the data set
#  4) Appropriately labels the data set with descriptive variable names. 
#  5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# Good luck!
# END INSTRUCTIONS
#
# BEGIN RESPONSE
#
library(plyr)
#  1) Merges the training and the test sets to create one data set.
#######################################################################
temp1 <- read.table("./train/X_train.txt")
temp2 <- read.table("./test/X_test.txt")
x <- rbind(temp1, temp2)

temp1 <- read.table("./train/subject_train.txt")
temp2 <- read.table("./test/subject_test.txt")
s <- rbind(temp1, temp2)

temp1 <- read.table("./train/y_train.txt")
temp2 <-read.table("./test/y_test.txt")
y <- rbind(temp1, temp2)



# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
#######################################################################

features <- read.table("./features.txt")

# Find interesting variables (mean and st devs)
features__mean_and_std <- grep("-mean\\(\\)|-std\\(\\)", features[,2])

# Subset
x <- x[,features__mean_and_std]

# Clean column names
names(x) <- features[features__mean_and_std, 2]



# 3) Uses descriptive activity names to name the activities in the data set
#######################################################################

activities <- read.table("./activity_labels.txt")

# assign correct activity names
y[,1] <- activities[y[,1], 2]

# apply the activity label to y
names(y) <- "activity"



# 4) Appropriately labels the data set with descriptive variable names
#######################################################################

# apply the subject label to s
names(s) <- "subject"

# Merge tables s, x, and y to single data set
cleaned <- cbind(x,y,s)Cr
write.table(cleaned, "merged_cleaned_data.txt")


# 5) Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
#######################################################################
averages <- ddply(cleaned, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages, "data_set_with_averages.txt", row.name=FALSE)


