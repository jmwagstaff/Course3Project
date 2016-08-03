---
title: "README"
author: "jmwagstaff"
date: "3 August 2016"
output: html_document
---

## Information on run_analysis.R: 

The scrip run_analysis.R is related to the data collected from the accelerometers 
from the Samsung Galaxy S smartphone. A full description is available at the site 
where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Step 1: Download and unzip the following file to your working directory:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Now you should have the folder "UCI HAR Dataset", and all its subfolders in your 
working directory.

Step 2: Then you can run the script run_analysis.R 

```
source("run_analysis.R")
```

Step 3: The output is the new tidy dataset newtidydata.txt saved to a folder "newtidydata", which is created if it does not exist already. You can read in 
the data with the following:

```
data<-read.table("./newtidydata/newtidydata.txt",header = TRUE,fill = TRUE)
```



### Detailed description of the script

The scrip run_analysis.R will: 

* Collect the "test set" and "training set" datasets from the folder "UCI HAR Dataset" 
and its subfolders, and append the corresponding "subject" and "activity" lists.
* The two datasets are then merged to make one complete dataset. 
* The variables which are calculations of mean() or std() (not inc. meanFreq()) 
are extracted from the dataset to make a new dataset.
* Descriptive activity names and variable names are given based on information 
obtained in activity_labels.txt and features_info.txt.
* The data set is melted with id variables "subjectid", "activitynumber", 
"activityname" and the measured variables are all the extracted features variables.
* Then a new dataset "newtidydata.txt", in the folder "newtidydata", is created 
in which the mean is calculated for all the variables for all possible 
combinations of subject and activity.


# Course3Project
