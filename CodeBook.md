# Introduction
This file contains additional information about the variables, data and transformations used in cleaning the source Data

# Row data source
A full description of the data used in this project can be found at The UCI Machine Learning Repository
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Transformation done
The script run_analysis.R performs the following transformations: 
Data was downloaded and unzipped to local files.
First, all the local files were read using read.table(). 
* Merges the training and the test sets to create one data set:
Files having the same number of columns and referring to the same entities are merged using the rbind() function.
* Extracts only the measurements on the mean and standard deviation for each measurement:
Using grep function from features file, extracted those numbers that has mean and std in the feature names. 
Then extracted only those columns with the mean and standard deviation measures from the whole dataset for all tables.
* Uses descriptive activity names to name the activities in the data set:
As activity data is addressed with values 1:6, the activity names and IDs from activity_labels.txt were taken and 
they are substituted in the dataset. 
* Appropriately labels the data set with descriptive variable names:
Data columns with mean and std measures were given user readable names. User readable names were taken from features.txt
subject column name was changed. So now no columns with vague column names are left uncorrected.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:
Using chaining, group_by and summarise_each function from dplyr package, a new dataset with all the average measures for each subject 
and activity type (30 subjects * 6 activities = 180 rows) was generated. 
This tidy data was written to tidy_data.txt in the working directory. And also uploaded to course submit repo.
For convenience, the same file is read and displayed using View()

## Program Variables
X_train, y_train, subject_train, X_test, y_test, subject_test and features contain the data from the respective downloaded unzipped files.
X_combined, y_combined and subject_data merge the previous datasets to further analysis.
i.e. X_combined contains merged data from X_train and X_test
mean_and_std_features is a numeric vector used to extract the desired columns of data with mean and std from X_combined.
Since features contains the correct names it is used for correcting the column names to the X_combined data
A similar approach is taken with activity names through the activities variable for y_combined data.
combined_data is the final single dataset that is result of all merged data from X_combined, y_combined and subject_data 
Finally, tidy_data contains the relevant averages for all the data columns except subject and activity columns.
tidy_data.txt is the file that is created in the working direcotry for final tidy data storage and is a .txt file. 

# Tidy Data Variables
* "subject"  - Number given to the person participating in the study. Values Range from 1-30
* "activity" - There are 6 physical activities that all subject undertook during the reading measurements.
             1. Laying   2. Sitting   3. Standing   4. Walking  5. Walking downstairs  6. Walking Upstairs

* "tBodyAcc-mean()-X" : Mean time domain accelerometer reading for body acceleration in the x-direction
* "tBodyAcc-mean()-Y" : Mean time domain accelerometer reading for body acceleration in the y-direction
* "tBodyAcc-mean()-Z" : Mean time domain accelerometer reading for body acceleration in the z-direction
* "tBodyAcc-std()-X"  : Mean standard deviation of time domain accelerometer reading for body acceleration in the x-direction
* "tBodyAcc-std()-Y"  : Mean standard deviation of time domain accelerometer reading for body acceleration in the y-direction
* "tBodyAcc-std()-Z"  : Mean standard deviation of time domain accelerometer reading for body acceleration in the z-direction

* "tGravityAcc-mean()-X" : Mean time domain accelerometer reading for gravitational acceleration in the x-direction
* "tGravityAcc-mean()-Y" : Mean time domain accelerometer reading for gravitational acceleration in the y-direction
* "tGravityAcc-mean()-Z" : Mean time domain accelerometer reading for gravitational acceleration in the z-direction
* "tGravityAcc-std()-X"  : Mean standard deviation of time domain accelerometer reading for gravitational acceleration in the z-direction
* "tGravityAcc-std()-Y"  : Mean standard deviation of time domain accelerometer reading for gravitational acceleration in the z-direction
* "tGravityAcc-std()-Z"  : Mean standard deviation of time domain accelerometer reading for gravitational acceleration in the z-direction

* "tBodyAccJerk-mean()-X": Mean time domain accelerometer reading for body acceleration jerk in the x-direction
* "tBodyAccJerk-mean()-Y": Mean time domain accelerometer reading for body acceleration jerk in the y-direction 
* "tBodyAccJerk-mean()-Z": Mean time domain accelerometer reading for body acceleration jerk in the z-direction
* "tBodyAccJerk-std()-X" : Mean standard deviation of time domain accelerometer reading for body acceleration jerk in the x-direction
* "tBodyAccJerk-std()-Y" : Mean standard deviation of time domain accelerometer reading for body acceleration jerk in the y-direction 
* "tBodyAccJerk-std()-Z" : Mean standard deviation of time domain accelerometer reading for body acceleration jerk in the z-direction 

* "tBodyGyro-mean()-X"   : Mean time domain gyroscope reading for body rotational acceleration in the x-direction   
* "tBodyGyro-mean()-Y"   : Mean time domain gyroscope reading for body rotational acceleration in the y-direction
* "tBodyGyro-mean()-Z"   : Mean time domain gyroscope reading for body rotational acceleration in the z-direction 
* "tBodyGyro-std()-X"    : Mean standard deviation of time domain gyroscope reading for body rotational acceleration in the x-direction
* "tBodyGyro-std()-Y"    : Mean standard deviation of time domain gyroscope reading for body rotational acceleration in the y-direction
* "tBodyGyro-std()-Z"    : Mean standard deviation of time domain gyroscope reading for body rotational acceleration in the z-direction

* "tBodyGyroJerk-mean()-X": Mean time domain gyroscope reading for body rotational jerk in the x-direction 
* "tBodyGyroJerk-mean()-Y": Mean time domain gyroscope reading for body rotational jerk in the y-direction 
* "tBodyGyroJerk-mean()-Z": Mean time domain gyroscope reading for body rotational jerk in the z-direction 
* "tBodyGyroJerk-std()-X" : Mean standard deviation of time domain gyroscope reading for body rotational jerk in the x-direction
* "tBodyGyroJerk-std()-Y" : Mean standard deviation of time domain gyroscope reading for body rotational jerk in the y-direction
* "tBodyGyroJerk-std()-Z" : Mean standard deviation of time domain gyroscope reading for body rotational jerk in the z-direction

* "tBodyAccMag-mean()"     : Mean calculated time domain body acceleration magnitude   
* "tBodyAccMag-std()"      : Mean standard deviation of calculated time domain body acceleration magnitude 
* "tGravityAccMag-mean()"  : Mean calculated time domain gravitational acceleration magnitude 
* "tGravityAccMag-std()"   : Mean standard deviation of calculated time domain gravitional acceleration magnitude 
* "tBodyAccJerkMag-mean()" : Mean calculated time domain body acceleration jerk magnitude 
* "tBodyAccJerkMag-std()"  : Mean standard deviation of calculated time domain body acceleration jerk magnitude 

* "tBodyGyroMag-mean()"    : Mean calculated time domain gravitational rotational acceleration magnitude 
* "tBodyGyroMag-std()"     : Mean standard deviation of calculated time domain gravitational rotational acceleration magnitude 
* "tBodyGyroJerkMag-mean()": Mean calculated time domain gravitational rotational jerk magnitude 
* "tBodyGyroJerkMag-std()" : Mean standard deviation of calculated time domain gravitational rotational jerk magnitude 

* "fBodyAcc-mean()-X" : Mean frequency domain accelerometer reading for body acceleration in the x-direction
* "fBodyAcc-mean()-Y" : Mean frequency domain accelerometer reading for body acceleration in the y-direction
* "fBodyAcc-mean()-Z" : Mean frequency domain accelerometer reading for body acceleration in the z-direction
* "fBodyAcc-std()-X"  : Mean standard deviation of frequency domain accelerometer reading for body acceleration in the x-direction
* "fBodyAcc-std()-Y"  : Mean standard deviation of frequency domain accelerometer reading for body acceleration in the y-direction
* "fBodyAcc-std()-Z"  : Mean standard deviation of frequency domain accelerometer reading for body acceleration in the z-direction
 
* "fBodyAccJerk-mean()-X" : Mean frequency domain accelerometer reading for body acceleration jerk in the x-direction
* "fBodyAccJerk-mean()-Y" : Mean frequency domain accelerometer reading for body acceleration jerk in the y-direction
* "fBodyAccJerk-mean()-Z" : Mean frequency domain accelerometer reading for body acceleration jerk in the z-direction
* "fBodyAccJerk-std()-X"  : Mean standard deviation of frequency domain accelerometer reading for body acceleration jerk in the x-direction
* "fBodyAccJerk-std()-Y"  : Mean standard deviation of frequency domain accelerometer reading for body acceleration jerk in the y-direction
* "fBodyAccJerk-std()-Z"  :  Mean standard deviation of frequency domain accelerometer reading for body acceleration jerk in the z-direction

* "fBodyGyro-mean()-X" : Mean frequency domain gyroscope reading for body rotational acceleration in the x-direction
* "fBodyGyro-mean()-Y" : Mean frequency domain gyroscope reading for body rotational acceleration in the y-direction
* "fBodyGyro-mean()-Z" : Mean frequency domain gyroscope reading for body rotational acceleration in the z-direction
* "fBodyGyro-std()-X"  : Mean standard deviation of frequency domain gyroscope reading for body rotational acceleration in the x-direction
* "fBodyGyro-std()-Y"  : Mean standard deviation of frequency domain gyroscope reading for body rotational acceleration in the y-direction
* "fBodyGyro-std()-Z"  : Mean standard deviation of frequency domain gyroscope reading for body rotational acceleration in the z-direction

* "fBodyAccMag-mean()" : Mean frequency domain accelerometer reading for body acceleration magnitude
* "fBodyAccMag-std()"  : Mean standard deviation of frequency domain accelerometer reading for body acceleration magnitude
* "fBodyBodyAccJerkMag-mean()" : Mean frequency domain accelerometer reading for body acceleration jerk magnitude
* "fBodyBodyAccJerkMag-std()"  : Mean standard deviation frequency domain accelerometer reading for body acceleration jerk magnitude
* "fBodyBodyGyroMag-mean()"    : Mean frequency domain gyroscope reading for body rotational acceleration magnitude
* "fBodyBodyGyroMag-std()"     : Mean of standard deviation of frequency domain gyroscope reading for body rotational acceleration magnitude  
* "fBodyBodyGyroJerkMag-mean()": Mean frequency domain gyroscope reading for body rotational acceleration jerk magnitude  
* "fBodyBodyGyroJerkMag-std()" : Mean standard deviation of frequency domain gyroscope reading for body rotational acceleration jerk magnitude  
 
