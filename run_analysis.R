## read data sets

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")

## combine test and train data sets

x <- rbind(X_train,X_test) ##  10299 x 561 var
y <- rbind(y_train,y_test) ##  10299 x 1   obs labels
subject <- rbind(subject_train,subject_test)  ## 10299 x 1

## extract mean and standard devation variables

meanStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
xselect <- x[, meanStd]

## clean up variable names

names(xselect) <- gsub("\\(\\)", "", features[meanStd, 2]) 
names(xselect) <- gsub("mean", "Mean", names(xselect)) 
names(xselect) <- gsub("std", "Std", names(xselect)) 
names(xselect) <- gsub("-", "", names(xselect)) 

# clean up and label descriptive activity names

actLabel <- read.table("UCI HAR Dataset/activity_labels.txt")
actLabel[, 2] <- tolower(gsub("_", "", actLabel[, 2]))
substr(actLabel[2:3, 2], 8, 8) <- toupper(substr(actLabel[2:3, 2], 8, 8))
substr(actLabel[3, 2], 8, 8) <- toupper(substr(actLabel[3, 2], 8, 8))
actLabel <- actLabel[y[, 1], 2]
y[, 1] <- actLabel
names(y) <- "activity"
names(subject) <- "subject"
data <- cbind(subject, y, xselect)

# second set with averages for each activity and subject

Tidyset <- aggregate(. ~subject + activity, data, mean)
Tidyset <- Tidyset[order(Tidyset$subject,Tidyset$activity),]

## write data

write.table(Tidyset, file = "Tidyset.txt", row.names = FALSE)

