#NOTE: Please launch this script from a working directory where the downloaded & unzipped data file named "UCI HAR Dataset" is located.
#NOTE: The first two steps (download file & unzip file) have been deactivated in this script.
#NOTE: In case the dataset is not downloaded and unzipped remove the "##" before the scriptlines to activate.

#section 1: This optional section downloads & unzips the file
##if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
##  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##  download.file(fileURL, "getdata_projectfiles_UCI HAR Dataset.zip", method = "curl")
##}
##if(!file.exists("UCI HAR Dataset")) {
##  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
##}

#section 2: This section stores the initial working directory filepath as a value "WD" and loads the dplyr and plyr packages that are necessary to perform the analysis
WD <- getwd()
library(dplyr)
library(plyr)
setwd("UCI HAR Dataset")

#section 3: This section imports the "activity_labels.txt" file (to prepare for assignment step 3)
activitylabels <- read.table("activity_labels.txt", header = FALSE)

#section 4: This section imports the "features.txt" file, modifies the names in the file using gsub, and assigns the values to a list "features" consisting of readable and clean column names (assignment step 4)
features <- gsub("[()]","",gsub("[0-9]","",gsub(" ","", readLines("features.txt"))))

#section 5: this section imports and merges (using cbind) the test datasets into a data frame called test
setwd("test")
subject_test <- read.table("subject_test.txt", header = FALSE)
X_test <- read.table("X_test.txt", header = FALSE)
Y_test <- read.table("Y_test.txt", header = FALSE)
test <- cbind(subject_test, Y_test, X_test)

#section 6: this section imports and merges (using cbind) the train datasets into a data frame called train
setwd(WD)
setwd("UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt", header = FALSE)
X_train <- read.table("X_train.txt", header = FALSE)
Y_train <- read.table("y_train.txt", header = FALSE)
train <- cbind(subject_train, Y_train, X_train)

#section 7: this section merges the test and train data frame into one set called testtrain using rbind, and attributes column names (assignment step 1)
testtrain <- rbind(test, train)
colnames(testtrain) <- c("subject", "activity", features)

#section 8: This section subsets testtrain containing the "subject" and "activity" variables as well as all means and stds (assignment step 2)
testtrain_subset <- cbind(testtrain[,1:2], testtrain[,grepl("mean", colnames(testtrain))], testtrain[,grepl("std", colnames(testtrain))])
#removes columns 26:28, 32:34, 38:40, 42, 44, 46, 48 from the subset which contain "meanFreq" variables which were subsetted with grepl() but should not be part of the selection.
testtrain_subset <- testtrain_subset[-c(26:28,32:34,38:40,42,44,46,48)]

#section 9: This section assigns names to the categorical values in the activity column (assignment step 3)
testtrain_subset$activity <- mapvalues(testtrain_subset$activity, from = as.vector(activitylabels$V1), to = as.vector(activitylabels$V2))

#section 10: This section calculates the average for each variable for each activity for each subject
testtrain_subset_average <- aggregate(testtrain_subset[,3:68], by = list(testtrain_subset$subject, testtrain_subset$activity), mean)
testtrain_subset_average <- dplyr::rename(testtrain_subset_average, subject = Group.1, activity = Group.2)

#section 11: This section exports the tidy data set with average values named "assignment.txt" (assignment step 5)
setwd(WD)
write.table(testtrain_subset_average, "assignment.txt", row.names = FALSE)
