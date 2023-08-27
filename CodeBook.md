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
