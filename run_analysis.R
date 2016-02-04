library(data.table)
library(dplyr)

# if the data has not been downloaded already, download it:
if (!dir.exists("uci_har_dataset")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","dataset.zip")
    unzip("dataset.zip",exdir="uci_har_dataset",junkpaths=T)
}

trainData <- fread("uci_har_dataset/X_train.txt",sep=" ", strip.white=TRUE)
trainData <- as.data.frame(trainData)
trainSubjects <- fread("uci_har_dataset/subject_train.txt",sep=" ", strip.white=TRUE)
trainSubjects <- as.data.frame(trainSubjects)
trainActivities <- fread("uci_har_dataset/y_train.txt",sep=" ", strip.white=TRUE)
trainActivities <- as.data.frame(trainActivities)

testData <- fread("uci_har_dataset/X_test.txt",sep=" ", strip.white=TRUE)
testData <- as.data.frame(testData)
testSubjects <- fread("uci_har_dataset/subject_test.txt",sep=" ", strip.white=TRUE)
testSubjects <- as.data.frame(testSubjects)
testActivities <- fread("uci_har_dataset/y_test.txt",sep=" ", strip.white=TRUE)
testActivities <- as.data.frame(testActivities)

activityFactors <- fread("uci_har_dataset/activity_labels.txt")
activityFactors <- as.data.frame(activityFactors)

data <- rbind(trainData, testData)
subjects <- rbind(trainSubjects, testSubjects)
activities <- rbind(trainActivities, testActivities)

featureNames <- read.delim("uci_har_dataset/features.txt", sep=" ", col.names=c("column","measurement"),header=FALSE)
featureNames$measurement <- as.character(featureNames$measurement)
meansAndSTDs <- grep("mean\\(|std\\(",featureNames$measurement)
data <- data[,meansAndSTDs]

# Clean up the original measurement names.
# from: tBodyAcc-mean()-X
#   to: bodyacc.time.mean.x
dataNames <- tolower(featureNames[meansAndSTDs,2])
dataNames <- sub("^t(\\w+)","\\1-time",dataNames)
dataNames <- sub("^f(\\w+)","\\1-frequency",dataNames)
dataNames <- gsub("\\(\\)","",dataNames)
dataNames <- gsub("-",".",dataNames)
names(data) <- dataNames

data$subject <- subjects[,1]
data$activity <- factor(activities[,1],levels=activityFactors$V1,labels=activityFactors$V2)

meanByActivityAndSubject <- data %>%
  group_by(activity, subject) %>%
  summarise_each(funs(mean)) %>%
  ungroup()

write.table(meanByActivityAndSubject, "mean_by_activity_and_subject.txt", row.name=FALSE)
