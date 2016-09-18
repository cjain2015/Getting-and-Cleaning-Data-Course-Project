# Getting-and-Cleaning-Data-Course-Project
Final course project for Getting and Cleaning Data Cleaning Course

# Overview
This repository lists the R code and documentation files for final course project for Getting and Cleaning Data 

A full description of the data used in this project can be found at The UCI Machine Learning Repository
The dataset being used is: Human Activity Recognition Using Smartphones found at - 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project goal is to collect data from internet and cleaning it to produce a tidy data set so that it can be used for subsequent analysis. 

# Project instructions:

Create R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
   each variable for each activity and each subject.

# Files in the repo:

1. run_analysis.R:  The source code of the script for achieving all 5 steps of the project. This script was developed and run on a Windows machine. As per the instructions of the project, script / program assumes that data for this project is already avaialble in the working directory and is unzipped. So it starts looking for "UCI HAR Dataset" directory in the working directory.

Let's say your working directory is C:/coursera then it assumes that data is in C:/coursera/UCI HAR Dataset directory.
it further assumes that all the data is present in the same folder, un-compressed and without names altered.

2. CodeBook.md: A code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, 
and any other relevant information like any transformations or work performed to clean up the data.

3. tidy_data.txt: When run_analysis is run, it generates output with filename tidy_data in your working directory. (C:/coursera as per example above)  This file (tidy_data.txt) is also uploaded through coursera's course project submission page.



