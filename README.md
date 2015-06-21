# tidy-data
Project assignment for "Getting and Cleaning Data" module of the Coursera Data Science Specialization signature track

## Overview
The script run_analysis.R reads a set of Samsung data files, combines them, aggregates the mean values by subject and activity type, and writes the tidy aggregated data to file tidy.txt.

## Contents
* run_analysis.R: the script file which reads the raw files and performs and outputs the aggregated tidy data.
* tidy.txt: the tidy aggregated mean data for each subject and activity
* codebook.txt: code book describing the variables in tidy.txt
* features.txt: the ordered names of 561 measures
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

*Read the measure column names, then clean them up to be valid for R dataframes

*Use make.names to change special characters to periods (.) and enforce unique columns names

*Use gsub to collapse three periods (...) and two periods (..) down to one (.) for readability

*Read the activity labels table and set the column names to activityNum and activityLabel

*Read the test tables and associated activity numbers and subject numbers, naming the columns appropriately

*Assign descriptive measure column names to test measures table

*Assign activityNum column name to test activity table

*Assign subject column name to test subject table

*Read the training tables and associated activity numbers and subject numbers, naming the columns appropriately

*Assign descriptive measure column names to training measures table

*Assign activityNum column name to training activity table

*Assign subject column name to training subject table

*Combine the activity and subject tables with the measures tables, then combine the two measures tables

*Narrow down the columns to subject, ActivityName, and standar deviation/mean columns

*Get the activity labels by merging meanStd with activityLabels data frame, keying on activityNum

*Remove the activityNum column

*convert the subject from int to factor in order to perform aggregation

*Generate the final aggregated tidy data frame by calculating the mean for all measure columns (".") by activityLabel and subject (see http://stackoverflow.com/questions/12064202/using-aggregate-for-multiple-aggregations)

*Write the tidy set to tidy.txt
