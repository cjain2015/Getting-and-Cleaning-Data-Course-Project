# Getting-and-Cleaning-Data-Course-Project
Final course project for Getting and Cleaning Data Cleaning Course

# Overview
This repository lists the R code and documentation files for final course project for Getting and Cleaning Data 

A full description of the data used in this project can be found at The UCI Machine Learning Repository
The dataset being used is: Human Activity Recognition Using Smartphones found at - 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project goal is to collect data from internet and cleaning it to produce a tidy data set so that it can be used for subsequent analysis. 

# Files in the repo:
1. run_analysis.R:  The source code of the script for achieving all 5 steps of the project. This script was developed and run on a Windows machine. As per the instructions of the project, script / program assumes that data for this project is already avaialble in the working directory and is unzipped. So it starts looking for "UCI HAR Dataset" directory in the working directory. Let's say your working directory is C:/coursera then it assumes that data is in "C:/coursera/UCI HAR Dataset" directory. It further assumes that all the data is present in the same folder, un-zipped and with original file names.
Also script uses dplyr package for grouping and calculating averages in the 5th step. For this in the beginning it checks if dplyr package is installed or not. If not installed then it goes and installs it. 
This script generates an output file name tidy_data.txt in the working directory. Also it reads it back and opens it for easy viewing using View()

2. CodeBook.md: A code book that specifies the steps of the program, all the variables used, explains logic of various steps, and 
and any other relevant information like any transformations or work performed to clean up the data.

3. tidy_data.txt: When run_analysis is run, it generates output with filename tidy_data in your working directory. (C:/coursera as per example above)  This file (tidy_data.txt) is also uploaded through coursera's course project submission page.

4. README.md - This file itself and it provides overview of the files in the repo. 

# Project instructions and script logic:
Create R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set: Files having the same number of columns and referring to the same entities are merged using the rbind() function.

2. Extracts only the measurements on the mean and standard deviation for each measurement: Using grep function from features file, extracted those numbers that has mean and std in the feature names. Then extracted only those columns with the mean and standard deviation measures from the whole dataset for all tables.

3. Uses descriptive activity names to name the activities in the data set:As activity data is addressed with values 1:6, the activity names and IDs from activity_labels.txt were taken and they are substituted in the dataset.

4. Appropriately labels the data set with descriptive variable names:Data columns with mean and std measures were given user readable names. User readable names were taken from features.txt subject column name was changed. So now no columns with vague column names are left uncorrected.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject: Using chaining, group_by and summarise_each function from dplyr package, a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows) was generated. This tidy data was written to tidy_data.txt in the working directory. And also uploaded to course submit repo. For convenience, the same file is read and displayed using View()



