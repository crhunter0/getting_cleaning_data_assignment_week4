﻿# Getting and Cleaining Data Week 4 Assignment

## Introduction

The purpose of the script in this repository is to calculate an average of all the mean and standard deviation variables from the Test and Train data of the UCI HAR dataset located at http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip.  These variables relate to  measurements taken from the Samsung Galaxy S smartphone accelerometers of 30 volunteers within an age group of 19-48.  Each subject performed six activities inluding walking, walking up stairs, walking downstairs, sitting, standing, and laying.

 More technical details on the data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

## Data Set Information

From the UCI HAR data set, the following files were used:

* X_test.txt
* y_test.txt
* X_train.txt
* y_train.txt
* subject_test.txt
* subject_train.txt
* features.txt
* activity_labels.txt


## run_analysis.R script

This script reads in the 8 data sets mentioned above into separate data frames.  Using the second column in features.txt, it assigns meaningful variable names to the X_test and X_train data fram. Using the activity names from activity_labels.txt meaningful activity descriptions are applied to the  numeric values in y_test and y_train as labels in a factor variable.  The subject values are given a meaningful variable name in the respective data frames for Test and Train.
Next, both the X_Test and X_Train data are filtered to find only columns that calculate the mean or standard deviation *. After this data is filtered, it is combined with the subject and y data into 2 data frames each containing all of the Test or Train data.  Next the Test and Train data are combined into one data frame.  Finally, the combined data is grouped by Activity and Subject and summarized by taking the average of each measurement column to provide the final data set.

## Data Set Info

The final data set is named **Mean_StdDev Averages.txt**

The code book is in the codebook.MD file which explains all variables of the data set.


* - Please note that the columns containing *meanFreq* were bypassed as it was determined that these did not fit the project requirments as it was not truly calculating the mean of the other measurements.



