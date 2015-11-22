# getcleandata_assignment
This is my repo for the course assignment for the Data Science Specialization course Getting and Cleaning Data

## Contents
This repo contains:
* README.md (a description of the repo and an explanation of run_analysis.R)
* CodeBook.md (a description of the tidy dataset and its variables)
* run_analysis.R (the script that performs steps 1-5 of the course assignment)

## Explanation of run_analysis.R
### Conditions for running of the script
This script is designed to launch from a directory to which the downloaded & unzipped data file named "UCI HAR Dataset" is located. Therefore, the variable "WD" created at the start of the script should contain a filepath to a directory containing the file "UCI HAR Dataset".

The first two steps (download file & unzip file) have been deactivated in this script. In case the dataset is not downloaded and unzipped remove the "##" before the scriptlines to activate. This will download and unzip the dataset files.

### Running the script
section 1: This optional section downloads & unzips the file  
section 2: This section stores the initial working directory filepath as a value "WD" and loads the dplyr and plyr packages that are necessary to perform the analysis  
section 3: This section imports the "activity_labels.txt" file (to prepare for assignment step 3)  
section 4: This section imports the "features.txt" file, modifies the names in the file using gsub, and assigns the values to a list "features" consisting of readable and clean column names (assignment step 4)  
section 5: this section imports and merges (using cbind) the test datasets into a data frame called test  
section 6: this section imports and merges (using cbind) the train datasets into a data frame called train  
section 7: this section merges the test and train data frame into one set called testtrain using rbind, and attributes column names (assignment step 1)  
section 8: This section subsets testtrain containing the "subject" and "activity" variables as well as all means and stds (assignment step 2)  
section 9: This section assigns names to the categorical values in the activity column (assignment step 3)  
section 10: This section calculates the average for each variable for each activity for each subject  
section 11: This section exports the tidy data set with average values named "assignment.txt" (assignment step 5)  




