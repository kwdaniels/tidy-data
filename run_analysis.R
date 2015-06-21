
#Read the measure column names, then clean them up to be valid for R dataframes
rawMeasureColNames  <- read.table("features.txt")
#Use make.names to change special characters to periods (.) and enforce unique columns names
measureColNames <- make.names(as.vector(rawMeasureColNames  $V2), unique=TRUE, allow_ = TRUE) 
#Use gsub to collapse three periods (...) and two periods (..) down to one (.) for readability
measureColNames <- gsub("[.][.][.]",".", measureColNames )
measureColNames <- gsub("[.][.]",".",measureColNames )

#Read the activity labels table and set the column names to activityNum and activityLabel
activityLabels <- read.table("activity_labels.txt")
names(activityLabels) <- c("activityNum", "activityLabel")

#Read the test tables and associated activity numbers and subject numbers, naming the columns appropriately
xtest <- read.table("X_test.txt")
#Assign descriptive measure column names to test measures table
names(xtest) <- measureColNames 
ytest <- read.table("y_test.txt")
#Assign activityNum column name to test activity table
names(ytest)[1] <- "activityNum"
subjectTest <- read.table("subject_test.txt")
#Assign subject column name to test subject table
names(subjectTest)[1] <- "subject"

#Read the training tables and associated activity numbers and subject numbers, naming the columns appropriately
xtrain <- read.table("X_train.txt")
#Assign descriptive measure column names to training measures table
names(xtrain) <- measureColNames 
ytrain <- read.table("y_train.txt")
#Assign activityNum column name to training activity table
names(ytrain)[1] <- "activityNum"
subjectTrain <- read.table("subject_train.txt")
#Assign subject column name to training subject table
names(subjectTrain)[1] <- "subject"

#Combine the activity and subject tables with the measures tables, then combine the two measures tables
test <- cbind(subjectTest,ytest,xtest) 
train <- cbind(subjectTrain,ytrain,xtrain) 
testtrain <- rbind(test, train) 

#Narrow down the columns to subject, ActivityName, and standar deviation/mean columns
meanStd <- select(testtrain,subject,activityNum,contains("std"),contains("mean"))

#Get the activity labels by merging meanStd with activityLabels data frame, keying on activityNum 
meanStd <- merge(activityLabels,meanStd,by.x="activityNum",by.y="activityNum")

#Remove the activityNum column
meanStd <- subset(meanStd,select = -activityNum)

#convert the subject from int to factor in order to perform aggregation
meanStd$subject <- factor(meanStd$subject)

#Generate the final aggregated tidy data frame by calculating the mean for all measure columns (".") 
#by activityLabel and subject (see http://stackoverflow.com/questions/12064202/using-aggregate-for-multiple-aggregations)
tidy <- aggregate(. ~ activityLabel+subject, data=meanStd, FUN=function(x) mn=mean(x))

#Write the tidy set to tidy.txt
write.table(tidy,file="tidy.txt",row.name=FALSE)
