#Coursera Getting and Cleaning Data
##This repo contains

-README.md  
-CodeBook.md: variables and discriptions  
-run_analysis.R: Code  

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

##The code  
-Merges the training and the test sets to create one data set.  
-Extracts only the measurements on the mean and standard deviation for each measurement.  
-Appropriately labels the data set with descriptive activity names.  
-Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

##Steps  
-Download the data from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
-Unzip the data.  
-Set your working directory to the folder in which you unzipped the file called UCI HAR Dataset.  
-Do not change any names of folders or files downloaded.  
-Run source("run_analysis.R").  
-The code will write a data set to your working directory named "Tidyset.txt".  

