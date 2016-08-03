---
title: "CodeBook"
author: "jmwagstaff"
date: "2 August 2016"
output: html_document
---

## Notes

First, if you have not done so already, you should download and unzip the following 
file to your working directory:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Now you should have the folder "UCI HAR Dataset", and all its subfolders in your 
working directory.

The information collected in this CodeBook is relevant to the new tidy dadaset "newtidydata.txt" that is writen from the run_analysis.R script. The information is a modified subset 
of the information found in the following files of the folder "UCI HAR Dataset":

* README.txt
* features_info.txt
* features.txt
* activity_labels.txt

Please see the above files for more information if required.

## Study Design

From the README.txt file in the folder "UCI HAR Dataset":

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## Variable Information
### Feature Selection

This section includes modified information from the features_info.txt file.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables, that we are considering for the new tidy dataset, that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

The complete list of variables of each feature vector is available in 'features.txt'


## Code Book
### Variables and units in the newtidydata dataset

The variable names in the newtidydata dataset are fully descriptive, see the 
previous section to understand the descriptions.

The first three variables are the ID variables

* 1 - subjectid - identifies the subject who performed the activity from 1-30
* 2 - activitynumber - activity numbered 1-6
* 3 - activityname - activity name:
                     (1. walking, 2. walkingupstairs, 
                     3. walkingdownstairs, 4. sitting, 5. standing, 6.laying)

All other variables are the features variables. The values returned is the mean 
calculated for all the features variables for all possible combinations of 
subject and activity. The acceleration signal from the smartphone accelerometer 
are in standard gravity units 'g'. The angular velocity vector measured by the 
gyroscope are in units of radians/second. Features are normalized and bounded 
within [-1,1]. The format is:

column number - variable name - old variable name

* 4 - tbodyaccmeanx - tBodyAcc-mean()-X
* 5 - tbodyaccmeany - tBodyAcc-mean()-Y
* 6 - tbodyaccmeanz - tBodyAcc-mean()-Z
* 7 - tbodyaccstdx - tBodyAcc-std()-X
* 8 - tbodyaccstdy - tBodyAcc-std()-Y
* 9 - tbodyaccstdz - tBodyAcc-std()-Z
* 10 - tgravityaccmeanx - tGravityAcc-mean()-X
* 11 - tgravityaccmeany - tGravityAcc-mean()-Y
* 12 - tgravityaccmeanz - tGravityAcc-mean()-Z
* 13 - tgravityaccstdx - tGravityAcc-std()-X
* 14 - tgravityaccstdy - tGravityAcc-std()-Y
* 15 - tgravityaccstdz - tGravityAcc-std()-Z
* 16 - tbodyaccjerkmeanx - tBodyAccJerk-mean()-X
* 17 - tbodyaccjerkmeany - tBodyAccJerk-mean()-Y
* 18 - tbodyaccjerkmeanz - tBodyAccJerk-mean()-Z
* 19 - tbodyaccjerkstdx - tBodyAccJerk-std()-X
* 20 - tbodyaccjerkstdy - tBodyAccJerk-std()-Y
* 21 - tbodyaccjerkstdz - tBodyAccJerk-std()-Z
* 22 - tbodygyromeanx - tBodyGyro-mean()-X
* 23 - tbodygyromeany - tBodyGyro-mean()-Y
* 24 - tbodygyromeanz - tBodyGyro-mean()-Z
* 25 - tbodygyrostdx - tBodyGyro-std()-X
* 26 - tbodygyrostdy - tBodyGyro-std()-Y
* 27 - tbodygyrostdz - tBodyGyro-std()-Z
* 28 - tbodygyrojerkmeanx - tBodyGyroJerk-mean()-X
* 29 - tbodygyrojerkmeany - tBodyGyroJerk-mean()-Y
* 30 - tbodygyrojerkmeanz - tBodyGyroJerk-mean()-Z
* 31 - tbodygyrojerkstdx - tBodyGyroJerk-std()-X
* 32 - tbodygyrojerkstdy - tBodyGyroJerk-std()-Y
* 33 - tbodygyrojerkstdz - tBodyGyroJerk-std()-Z
* 34 - tbodyaccmagmean - tBodyAccMag-mean()
* 35 - tbodyaccmagstd - tBodyAccMag-std()
* 36 - tgravityaccmagmean - tGravityAccMag-mean()
* 37 - tgravityaccmagstd - tGravityAccMag-std()
* 38 - tbodyaccjerkmagmean - tBodyAccJerkMag-mean()
* 39 - tbodyaccjerkmagstd - tBodyAccJerkMag-std()
* 40 - tbodygyromagmean - tBodyGyroMag-mean()
* 41 - tbodygyromagstd - tBodyGyroMag-std()
* 42 - tbodygyrojerkmagmean - tBodyGyroJerkMag-mean()
* 43 - tbodygyrojerkmagstd - tBodyGyroJerkMag-std()
* 44 - fbodyaccmeanx - fBodyAcc-mean()-X
* 45 - fbodyaccmeany - fBodyAcc-mean()-Y
* 46 - fbodyaccmeanz - fBodyAcc-mean()-Z
* 47 - fbodyaccstdx - fBodyAcc-std()-X
* 48 - fbodyaccstdy - fBodyAcc-std()-Y
* 49 - fbodyaccstdz - fBodyAcc-std()-Z
* 50 - fbodyaccjerkmeanx - fBodyAccJerk-mean()-X
* 51 - fbodyaccjerkmeany - fBodyAccJerk-mean()-Y
* 52 - fbodyaccjerkmeanz - fBodyAccJerk-mean()-Z
* 53 - fbodyaccjerkstdx - fBodyAccJerk-std()-X
* 54 - fbodyaccjerkstdy - fBodyAccJerk-std()-Y
* 55 - fbodyaccjerkstdz - fBodyAccJerk-std()-Z
* 56 - fbodygyromeanx - fBodyGyro-mean()-X
* 57 - fbodygyromeany - fBodyGyro-mean()-Y
* 58 - fbodygyromeanz - fBodyGyro-mean()-Z
* 59 - fbodygyrostdx - fBodyGyro-std()-X
* 60 - fbodygyrostdy - fBodyGyro-std()-Y
* 61 - fbodygyrostdz - fBodyGyro-std()-Z
* 62 - fbodyaccmagmean - fBodyAccMag-mean()
* 63 - fbodyaccmagstd - fBodyAccMag-std()
* 64 - fbodybodyaccjerkmagmean - fBodyBodyAccJerkMag-mean()
* 65 - fbodybodyaccjerkmagstd - fBodyBodyAccJerkMag-std()
* 66 - fbodybodygyromagmean - fBodyBodyGyroMag-mean()
* 67 - fbodybodygyromagstd - fBodyBodyGyroMag-std()
* 68 - fbodybodygyrojerkmagmean - fBodyBodyGyroJerkMag-mean()
* 69 - fbodybodygyrojerkmagstd - fBodyBodyGyroJerkMag-std()
