# Code book for Getting and Cleaning Data Course Assignment
This code book describes the contents of the processed tidy data file "assignment.txt" that is created after running the R script run_analysis.R

## Description of file
This file consists of a summary of a merged version of the component tables contained in the *UCI HAR Dataset* data file.  
The files was created by reading and merging train and test data (tables "X_train.txt", "Y_train.txt", "X_test.txt" and "Y_test.txt").  
Measurement variables were assigned variable column names derived from the "features.txt" file.  
Values for the categorical variable "activity" were derived from "activity_labels.txt".  
A subset of the "means" and "std" variables in the dataset was created.  
The average of each "means" and "std" variable per subject per activity was calculated.  
The resulting data frame was exported to "assignment.txt".  

## Description of variables
* **subject:** reflects the subject number (1-30)
* **activity:** reflects 1 of 6 measuring conditions (activities). These were labeled as 1-6 in the original dataset. They have been transformed to "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING", respectively
* **measurements (columns 3-68):** reflect the means per subject per activity for all measurements (means and standard deviations)
  * **Column names** can be read as follows:
    * *element 1:* "t" or "f". leading character "t" denotes time; leading character "f" denotes Fast Fourier Transform of the variable
    * *element 2:* "Body" or "Gravity". Denotes whether signal is derived from body movement or gravity (only applies to acceleration variables)
    * *element 3:* "Acc" or "Gyro". Denotes whether signal is an acceleration signal ("Acc" for accelerometer) or angular velocity vector ("Gyro" for gyroscope)
    * *(optional) element 4:* "Jerk", "Mag" or "JerkMag". Denotes whether signal is a Jerk or magnitude signal.
    * *dash:* "-"
    * *element 5:* the element that follows the dash denotes whether the value is mean ("mean") or standard deviation ("std")
    * *(optional) dash:* "-"
    * *element 6:* "X", "Y", "Z" or "XYZ". Denotes over which axis the signal was measured, or whether it is a 3-axial signal ("XYZ")
  * **Units** and other specifics of measurements are as follows:
    * *Acceleration signals* (element 3 = "Acc") are expresssed in standard gravity units 'g'
    * *Angular velocity vectors* (element 3 = "Gyro") are expressed in radians/second.
    * Features are normalized and bounded within [-1,1]

