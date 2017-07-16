## import libaries
library(tidyr)
library(dplyr)
## Read in data 
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = c("factor"))
subjTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = c("factor"))
subjTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

## - using the features data set, assign meaningful variable names to the xTest and 
##  xTrain data frames
feature_names <- features[,2]
colnames(xTest) <- feature_names
colnames(xTrain) <- feature_names
## - label yTest and yTrain variables and assign meaningful activity names to the
##  activty numeric factory value
colnames(yTest) <- c('Activity')
levels(yTest[,1]) <- as.vector(activities[,2])
colnames(yTrain) <- c('Activity')
levels(yTrain[,1]) <- as.vector(activities[,2])
## - label subject columns in Test and Train
colnames(subjTest) <- c('Subject')
colnames(subjTrain) <- c('Subject')

## - Filter columns only pertaining to mean and standard deviation
## - Note columns related to meanfreq were intentionally bypassed
xTestFiltered <- xTest[,grep("mean[(]|std[(]", colnames(xTest))]
xTrainFiltered <- xTrain[,grep("mean[(]|std[(]", colnames(xTrain))]

## - combine subject, y, and x columns in both Test and Train data frames 
combTest <- cbind(subjTest, yTest, xTestFiltered)
combTrain <- cbind(subjTrain, yTrain, xTrainFiltered)

## - combine Test and Train dataframes
combAll <- rbind(combTest, combTrain)

## - group by Activity and Subject and summarize by calculating the mean of each
##   column
combAvg <- combAll %>%
  group_by(Activity, Subject) %>%
  summarize_all(mean) 

## - write out final data set
write.table(combAvg, file = "./Mean_StdDev Averages.txt")

