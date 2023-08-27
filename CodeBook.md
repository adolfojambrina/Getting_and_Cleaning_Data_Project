# Getting and Cleaning Data Project

Author: Adolfo Jambrina

## Description 

Additional information about variables, data and transformations used in Getting and Cleaning Data's final project.

## Procedure 

1. Load activity labels and select features that I used (featuresNeed). For the last step grep() and gsub() were used.
2. Load train data sets, from train/X_train.txt, train/y_train.txt and train/subject_train.txt. By mean featuresNeed only necesary data from X_train.txt were selected. Lastly the three data sets were merged in one data set: train.
3. Load test data sets. The same procedure for test/X_test.txt, test/y_test.txt and test/subject_test.txt. Data were merged and stored in one data set: test.
4. Merge train and test by row in one data set merged.
5. Substitute Activity codes by name of activities. I used a for loop and a auxiliary vector. Then I ordered and stored it: merged_def.
6. Create a tidy data set set with the average of each variable for each activity and each subject. For that: 
  + melt: Separate data set by column with Subject and Activity.
  + dcast: Calculate mean and agrupate observations 

## Variables:
  "SubjectNum"
  "Activity"
  "tBodyAcc-mean-X"
  "tBodyAcc-mean-Y"
  "tBodyAcc-mean-Z"
  "tBodyAcc-std-X"
  "tBodyAcc-std-Y"
  "tBodyAcc-std-Z"
  "tGravityAcc-mean-X"
  "tGravityAcc-mean-Y"
  "tGravityAcc-mean-Z"
  "tGravityAcc-std-X"
  "tGravityAcc-std-Y"
  "tGravityAcc-std-Z"
  "tBodyAccJerk-mean-X"
  "tBodyAccJerk-mean-Y"
  "tBodyAccJerk-mean-Z"
  "tBodyAccJerk-std-X"
  "tBodyAccJerk-std-Y"
  "tBodyAccJerk-std-Z"
  "tBodyGyro-mean-X"
  "tBodyGyro-mean-Y"
  "tBodyGyro-mean-Z"
  "tBodyGyro-std-X"
  "tBodyGyro-std-Y"
  "tBodyGyro-std-Z"
  "tBodyGyroJerk-mean-X"
  "tBodyGyroJerk-mean-Y"
  "tBodyGyroJerk-mean-Z"
  "tBodyGyroJerk-std-X"
  "tBodyGyroJerk-std-Y"
  "tBodyGyroJerk-std-Z"
  "tBodyAccMag-mean"
  "tBodyAccMag-std"
  "tGravityAccMag-mean"
  "tGravityAccMag-std"
  "tBodyAccJerkMag-mean"
  "tBodyAccJerkMag-std"
  "tBodyGyroMag-mean"
  "tBodyGyroMag-std"
  "tBodyGyroJerkMag-mean"
  "tBodyGyroJerkMag-std"
  "fBodyAcc-mean-X"
  "fBodyAcc-mean-Y"
  "fBodyAcc-mean-Z"
  "fBodyAcc-std-X"
  "fBodyAcc-std-Y"
  "fBodyAcc-std-Z"
  "fBodyAccJerk-mean-X"
  "fBodyAccJerk-mean-Y"
  "fBodyAccJerk-mean-Z"
  "fBodyAccJerk-std-X"
  "fBodyAccJerk-std-Y"
  "fBodyAccJerk-std-Z"
  "fBodyGyro-mean-X"
  "fBodyGyro-mean-Y"
  "fBodyGyro-mean-Z"
  "fBodyGyro-std-X"
  "fBodyGyro-std-Y"
  "fBodyGyro-std-Z"
  "fBodyAccMag-mean"
  "fBodyAccMag-std"
  "fBodyBodyAccJerkMag-mean"
  "fBodyBodyAccJerkMag-std"
  "fBodyBodyGyroMag-mean"
  "fBodyBodyGyroMag-std"
  "fBodyBodyGyroJerkMag-mean"
  "fBodyBodyGyroJerkMag-std"
