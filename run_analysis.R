## First you should download and unzip the following file to your working directory:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Assuming now that you have the folder "UCI HAR Dataset", and all its 
## subfolders in your working directory.

## run_analysis(): This script will collect and merge the relevant data from 
## the above mentioned folder and subfolders. Variables which are calculations 
## of mean() or std() (not inc. meanFreq()) are extracted. Descriptive activity 
## names and variable names are given. A new dataset "newtidydata.txt", in the 
## folder "newtidydata", is created in which the mean is calculated for all the
## variables for all possible combinations of subject and activity.


        
## First we read-in all relevant data.

## The 561 features data from the test dataset
testdata <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt",
                       header = FALSE,
                       fill = TRUE)
## The 561 features data from the training dataset
traindata <-
        read.table("./UCI\ HAR\ Dataset/train/X_train.txt",
                   header = FALSE,
                   fill = TRUE)
## The corresponding activity number from the test dataset
testactivity <-
        read.table("./UCI\ HAR\ Dataset/test/y_test.txt",
                   header = FALSE,
                   fill = TRUE)
## The corresponding activity number from the training dataset
trainactivity <-
        read.table("./UCI\ HAR\ Dataset/train/y_train.txt",
                   header = FALSE,
                   fill = TRUE)
## The corresponding subjest id from the test dataset
testsubject <-
        read.table("./UCI\ HAR\ Dataset/test/subject_test.txt",
                   header = FALSE,
                   fill = TRUE)
## The corresponding subjest id from the training dataset
trainsubject <-
        read.table("./UCI\ HAR\ Dataset/train/subject_train.txt",
                   header = FALSE,
                   fill = TRUE)

## Change the names of the columns for the activity and subject data
colnames(testactivity) <- c("activitynumber")
colnames(testsubject) <- c("subjectid")
colnames(trainactivity) <- c("activitynumber")
colnames(trainsubject) <- c("subjectid")

## Add the corresponding subject and activity columns to the features
## data frames
testdata <- cbind(testsubject, testactivity, testdata)
traindata <- cbind(trainsubject, trainactivity, traindata)

## Now we can merge the test and training data sets on all variables
mergeddata <- merge(testdata, traindata, all = TRUE)


## Here we only want to find the variables in the features dataset which
## are calculations of mean() or sdt(). This does not include meanFreq().
features <- read.table("./UCI\ HAR\ Dataset/features.txt",
                       header = FALSE,
                       fill = TRUE)
## This is a list of the features names
features$V2 <- as.character(features$V2)
mspositions <- grep("mean\\(\\)|std\\(\\)", features$V2)
## This gives the positions where "mean()" or "std()" are found

## Get the features names from file, we will use this later for
## re-labelling
featuresnames <- features[mspositions, 2]

## Add offset since we added two extra cols at front of the merged data
## frame
mspositions <- mspositions + 2

## Extract from the merged dataset only cols which calculated mean() or
## std()
mergeddata <- mergeddata[, c(1, 2, mspositions)]

## Now we want to creat descriptive names for the activities,
## instead of just the activty numbers from 1-6
mergeddata$activityname <-
        character(length = length(mergeddata$subjectid))
## creat a new column with descriptive activity names
for (i in seq_along(mergeddata$activityname)) {
        if (mergeddata$activitynumber[i] == 1) {
                mergeddata$activityname[i] <- "walking"
        } else if (mergeddata$activitynumber[i] == 2) {
                mergeddata$activityname[i] <- "walkingupstairs"
        } else if (mergeddata$activitynumber[i] == 3) {
                mergeddata$activityname[i] <- "walkingdownstairs"
        } else if (mergeddata$activitynumber[i] == 4) {
                mergeddata$activityname[i] <- "sitting"
        } else if (mergeddata$activitynumber[i] == 5) {
                mergeddata$activityname[i] <- "standing"
        } else if (mergeddata$activitynumber[i] == 6) {
                mergeddata$activityname[i] <- "laying"
        } else{
                mergeddata$activityname[i] <- NA
        }
}

## Here we put the activity name column in third position in the merged
## dataset
mergeddata <-
        mergeddata[, c(1, 2, ncol(mergeddata), 3:(ncol(mergeddata) - 1))]

## Now we want to creat descriptive names for the features variables
## which we have extracted. For this we simply modify slightly the
## already existing features names. The modifications are: removing
## parenthesis and dashes and making all letters lower case.
featuresnames2 <- gsub("\\(\\)", "", featuresnames)
featuresnames2 <- gsub("-", "", featuresnames2)
featuresnames2 <- tolower(featuresnames2)
## These names are fully descriptive and are very tidy.
## Re-name all cols of merged dataset with descriptive names from above
colnames(mergeddata) <-
        c("subjectid", "activitynumber", "activityname",
          featuresnames2)

## Next we want to creat a second tidy dataset with the mean of each
## variable for each activity and each subject.
## First we melt the dataset where the id variables are "subjectid",
## "activitynumber","activityname" and the measured variables are all
## the features variables
library(reshape2)
meltmerged <- melt(mergeddata,
                   id = c(1, 2, 3),
                   measure.vars = c(4:ncol(mergeddata)))
## Then creat a new dataset in which the mean is calculated for all
## variables for all possible combinations of subjectid and activity
castmeltmerged <- dcast(meltmerged,
                        subjectid + activitynumber + activityname ~
                                variable,
                        mean)

## Finally we write out the new tidy dataset to a folder "newtidydata",
## which is created if it does not exist already
if (!file.exists("newtidydata")) {
        dir.create("newtidydata")
}
write.table(castmeltmerged, file = "./newtidydata/newtidydata.txt",row.name=FALSE)

## clear all data from memory
rm(list = ls())
