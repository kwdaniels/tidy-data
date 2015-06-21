# tidy-data
Project assignment for "Getting and Cleaning Data" module of the Coursera Data Science Specialization signature track

## Overview
The script run_analysis.R reads a set of Samsung data files, combines them, aggregates the mean values by subject and activity type, and writes the tidy aggregated data to file tidy.txt.

The data in tiny.txt represents a mean aggregation of the data in "Human Activity Recognition Using Smartphones Data Set" from the UCI Center for Machine Learning and Intelligent Systems, described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The original data were distributed across two sets of files, one representing 2947 sets of readings for testing and the other representing 7352 sets of readings for training. Each row of these measure files contained 561 measures. In addition, the test and training sets each included a file corresponding to subject identifiers and another file corresponding to activity identifiers for each set of readings.

All these files were combined together into a single dataset of 10299 rows (2947 for testing and 7352 for training) and 563 columns (one for subject, one for activity label, and the original 561 measures). All the original measure columns except for those related to mean or standard deviation were removed from the set, leaving 86 measure columns. The measurement rows were aggregated to reflect the mean of the measured values for each subject and activity combination.  This resulted in 180 rows representing the averaged measures for six activities (LAYING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 30 subjects in the test and training experiments.

The aggregated values were stored in the dataset tidy.txt, with 88 columns (activity label, subject number, and 86 averaged measures) and 180 rows.

The data in tidy.txt qualifies as tidy because each variable measured is in one and only one column, and the each row represents a different aggregate observation of that variable for each activity and subject.

## Contents of this repository
* run_analysis.R: the script file which reads the raw files and performs and outputs the aggregated tidy data.
* tidy.txt: the tidy aggregated mean data for each subject and activity
* codebook.md: code book describing the variables in tidy.txt (see https://github.com/kwdaniels/tidy-data/blob/master/codebook.md)
* features.txt: the ordered names of 561 measures from the original data source at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* activity_labels.txt: the labels describing 6 different activities for which measurements were made
* X_test.txt: raw test measures data
* y_test.txt: raw activity numbers, each row corresponding to a raw measurement row in X_test.txt 
* subject_test.txt: raw subject numbers, each row corresponding to a raw measurement row in X_test.txt 
* X_train.txt: raw training measures data
* y_train.txt: raw activity numbers, each row corresponding to a raw measurement row in X_train.txt 
* subject_train.txt: raw subject numbers, each row corresponding to a raw measurement row in X_train.txt 

## How it works
Detailed comments of the import, tidying, aggregation, and output operations are included within the run_analysis.R script itself.

In summary, the script does the following:

* Read the measure column names, then clean them up to be valid for R dataframes
  * Use make.names to change special characters to periods (.) and enforce unique columns names
  * Use gsub to collapse three periods (...) and two periods (..) down to one (.) for readability
* Read the activity labels table and set the column names to activityNum and activityLabel
* Read the test tables and associated activity numbers and subject numbers, naming the columns appropriately
  * Assign descriptive measure column names to test measures table
  * Assign activityNum column name to test activity table
  * Assign subject column name to test subject table
* Read the training tables and associated activity numbers and subject numbers, naming the columns appropriately
  * Assign descriptive measure column names to training measures table
  * Assign activityNum column name to training activity table
  * Assign subject column name to training subject table
* Combine the activity and subject tables with the measures tables, then combine the two measures tables
* Narrow down the columns to subject, ActivityName, and standard deviation/mean columns
* Get the activity labels by merging meanStd with activityLabels data frame, keying on activityNum
* Remove the activityNum column
* convert the subject from int to factor in order to perform aggregation
* Generate the final aggregated tidy data frame by calculating the mean for all measure columns (".") by activityLabel and subject (see http://stackoverflow.com/questions/12064202/using-aggregate-for-multiple-aggregations)
* Write the tidy set to tidy.txt
