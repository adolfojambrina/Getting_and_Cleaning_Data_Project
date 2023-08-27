#load packages
library(data.table)
library(dplyr)
library(reshape2)
#Get data
path<-getwd()
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "data.zip", method="curl")
unzip(zipfile="data.zip")
#load activity labels and features
activityLabels<-fread("UCI HAR Dataset/activity_labels.txt", col.names=c("classlabels","activityName"))
features<-fread("UCI HAR Dataset/features.txt",col.names=c("index", "featureNames"))
featuresNeed<-grep("(mean|std)\\(\\)", features[,featureNames])
measurements<-features[featuresNeed,featureNames]
measurements<-gsub("[()]","", measurements)

#Load train datasets
train<-fread("UCI HAR Dataset/train/X_train.txt")
train<-train[,featuresNeed,with=FALSE]
colnames(train)<-measurements
trainActivities<-fread("UCI HAR Dataset/train/Y_train.txt", col.names=c("Activity"))
trainSubjects<-fread("UCI HAR Dataset/train/subject_train.txt", col.names=c("SubjectNum"))
train<-cbind(trainSubjects,trainActivities,train)
#Load test datasets
test<-fread("UCI HAR Dataset/test/X_test.txt")
test<-test[,featuresNeed, with=FALSE]
colnames(test)<-measurements
testActivities<-fread("UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))
testSubjects<-fread("UCI HAR Dataset/test/subject_test.txt", col.names=c("SubjectNum"))
test<-cbind(testSubjects,testActivities,test)

#combine datasets
merged<-rbind(train, test)

Activity<-c()
for(i in 1:nrow(merged)){
  if(merged[i,2]=="1"){
    Activity[i]<-"WALKING"
  }else if(merged[i,2]=="2"){
    Activity[i]<-"WALKING_UPSTAIRS"
  }else if(merged[i,2]=="3"){
    Activity[i]<-"WALKING_DOWNSTAIRS"
  } else if(merged[i,2]=="4"){
    Activity[i]<-"SITTING"
  } else if(merged[i,2]=="5"){
    Activity[i]<-"STANDING"
  }else{
    Activity[i]<-"LAYING"
  }
}
merged_def<-cbind(merged[,1],Activity,merged[,3:ncol(merged)])
#Create a tidy data set with the average of each variable for each activity and each subject.
merged_def<-melt(data=merged_def,id=c("SubjectNum", "Activity"))
merged_def<-dcast(data=merged_def, SubjectNum+Activity~variable,fun.aggregate=mean)
write.table(merged_def, file="tidyData.txt", row.names=FALSE, sep=";")
