if (!require("dplyr")) {
  install.packages(dplyr)
}
library(dplyr)

# set you appropriate working directory that has "UCI HAR Dataset" directory
#setwd("C:\\Coursera\\GettingAndCleaningData\\Project\\test")


# Step 0: download data from internet and unzip it. 
# notice mode = "wb" otherwise unzip will give an error
# This is a required step but not required for the assignment submission. 

#filename<- "Project_dataset"
#if (!file.exists(filename)){
#	fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
#  download.file(fileURL, filename, mode= "wb")
# }  
#unzip(filename)

# Read data from local files
X_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

X_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table("UCI HAR Dataset\\test/subject_test.txt")

features <- read.table("UCI HAR Dataset\\features.txt")


# Step 1: Merge the training and test data sets to a single data set
# __________________________________________________________________

# combine X_test and X_train data sets
X_combined <- rbind(X_train, X_test)
# combine y_test and y_train sets
y_combined <- rbind(y_train, y_test)
# combine subject_test and subject_train data sets
subject_data <- rbind(subject_train, subject_test)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# _________________________________________________________________________

# Get column numbers (features table row numbers) that contains 
# word "mean" or "std" in the column name using features table
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns from X_data
X_combined <- X_combined[, mean_and_std_features]


# Step 3: Use descriptive names to name the activities in the data set
# ____________________________________________________________________

activities <- read.table("UCI HAR Dataset\\activity_labels.txt")

# update values with correct activity names
y_combined[, 1] <- activities[y_combined[, 1], 2]

# Give name "activity" to the column in y_data
names(y_combined) <- "activity"

# Step 4: Appropriately label the data set with descriptive variable names
# ________________________________________________________________________
#
# Give easy to read column names using features names 
names(X_combined) <- features[mean_and_std_features, 2]

# Change column name to "subject" for the only column in subject_data
names(subject_data) <- "subject"

# bind all the data in a single data set
combined_data <- cbind(X_combined, y_combined, subject_data)

# Step 5: Create a second, independent tidy data set with the average of each # variable 
# for each activity and each subject
# ___________________________________________________________________________

# Average columns from 1:66 group_by two columns: subject and activity. 
# Grouping variables are always excluded by function summarise_each 
tidy_data <- combined_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))

# write tidy data to the working directory
write.table(tidy_data, "tidy_data.txt", row.names=FALSE )

# this is for convinience. Just read back newly created file and display it
# in case it gives any error in your computer, then please look at the tidy_data.txt file 
# in your working directory
tidy_tbl <- read.table("tidy_data.txt", header = TRUE)
View(tidy_tbl)



