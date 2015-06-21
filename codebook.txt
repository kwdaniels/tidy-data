#Codebook for dimensions and variables in tidy.txt 

##Overview
The data in tiny.txt represents a mean aggregation of the data in "Human Activity Recognition Using Smartphones Data Set" from the UCI Center for Machine Learning and Intelligent Systems, described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The original data were distributed across two sets of files, one representing 2947 sets of readings for testing and the other representing 7352 sets of readings for training. Each row of these measure files contained 561 measures. In addition, the test and training sets each included a file corresponding to subject identifiers and another file corresponding to activity identifiers for each set of readings.

All these files were combined together into a single dataset of 10299 rows (2947 for testing and 7352 for training) and 563 columns (one for subject, one for activity label, and the original 561 measures). All the original measure columns except for those related to mean or standard deviation were removed from the set, leaving 86 measure columns. The measurement rows were aggregated to reflect the mean of the measured values for each subject and activity combination.  This resulted in 180 rows representing the averaged measures for six activities (LAYING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 30 subjects in the test and training experiments.

The aggregated values were stored in the dataset tidy.txt, with 88 columns (activity label, subject number, and 86 averaged measures) and 180 rows.

##Variables
The variables selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
 
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Below is the complete list of aggregated mean variables of each feature vector:

* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.std.
* tGravityAccMag.std.
* tBodyAccJerkMag.std.
* tBodyGyroMag.std.
* tBodyGyroJerkMag.std.
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyAccMag.std.
* fBodyBodyAccJerkMag.std.
* fBodyBodyGyroMag.std.
* fBodyBodyGyroJerkMag.std.
* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyAccMag.mean.
* tGravityAccMag.mean.
* tBodyAccJerkMag.mean.
* tBodyGyroMag.mean.
* tBodyGyroJerkMag.mean.
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.meanFreq.X
* fBodyAcc.meanFreq.Y
* fBodyAcc.meanFreq.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.meanFreq.X
* fBodyAccJerk.meanFreq.Y
* fBodyAccJerk.meanFreq.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.meanFreq.X
* fBodyGyro.meanFreq.Y
* fBodyGyro.meanFreq.Z
* fBodyAccMag.mean.
* fBodyAccMag.meanFreq.
* fBodyBodyAccJerkMag.mean.
* fBodyBodyAccJerkMag.meanFreq.
* fBodyBodyGyroMag.mean.
* fBodyBodyGyroMag.meanFreq.
* fBodyBodyGyroJerkMag.mean.
* fBodyBodyGyroJerkMag.meanFreq.
* angle.tBodyAccMean.gravity.
* angle.tBodyAccJerkMean.gravityMean.
* angle.tBodyGyroMean.gravityMean.
* angle.tBodyGyroJerkMean.gravityMean.
* angle.X.gravityMean.
* angle.Y.gravityMean.
* angle.Z.gravityMean.
