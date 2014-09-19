## Codebook for "Getting and Cleaning Data" course project
This codebook details information on the data fields that make up the tidy data set output of the course project. The purpose of this project is to collate and tidy sensor data collected on various subjects from accelerometers using the Samsung Galaxy S smartphone, as part of a Wearable Computing initiative.

## Related information
There are three files included in the repo:
1. run_analysis.r: single script containing all the data cleaning steps performed
2. README.md: this file describes the process steps for ingesting and transforming the input data to produce the output tidy data
3. Codebook.md: this file

## Input data set
The input data set is a zip file that can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Unzipping the input data set yields the following data files. See the corresponding README.txt file that describes the various input data elements in detail.

##Tidy data set
The tidy data set contains the following columns (in order):

1. Subject: This is the value of the single column entry taken from the test data set "subject_test.txt" and training data set "subject_train.txt"
  * Type: Numeric
  * Units: Same as for input data set
  * Transformation: None.

2. Activity: This is the descriptive value  taken from the data set "activity_labels.txt".
 * Type: Character
 * Transformation: None
 * Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
3. Observation: This is the descriptive value of features taken from the data set "features.txt". Only that subset of features is considered that contain the value "mean()" or "std()". Per the project requirement, only measurements related to mean and standard deviation are to be included in the output. Hence, all other features are excluded.
 * Type: Character
 * Transformation: The following transformations were performed on the feature descriptions:
   * Replace "BodyBody" by "Body"
   * Replace beginning "t" by "Time -"
   * Replace beginning "f" by "Frequency -"
   * Replace "Acc" by "Acceleration"
   * Replace "Body"" by "Body" followed by a space
   * Replace "Mag" by "Magnitude" followed by a space
   * Replace "Gravity" by "Gravity" with a space
   * Replace "Jerk" by "Jerk" with a space
   * Replace "gyro" by "Angular Velocity"
   * Replace "mean()" by "Mean"
   * Replace "std()" by "Std Deviation"
   * Replace "std()" by "Std Deviation"
   * Replace terminating "X" by "- X Axis"
   * Replace terminating "Y" by "- Y Axis"
   * Replace terminating "Z" by "- Z Axis"
 * Possible values: The transformation of input feature descriptions to output "Observation" values is shown below:
 
    Original Feature           | Transformed Header
    -------------              | -------------
    tBodyAcc-mean()-X          | Time-Body Acceleration - Mean - X Axis
    tBodyAcc-mean()-Y          | Time-Body Acceleration - Mean - Y Axis
    tBodyAcc-mean()-Z          | Time-Body Acceleration - Mean - Z Axis
    tBodyAcc-std()-X           | Time-Body Acceleration - Standard Deviation - X Axis
    tBodyAcc-std()-Y           | Time-Body Acceleration - Standard Deviation - Y Axis
    tBodyAcc-std()-Z           | Time-Body Acceleration - Standard Deviation - Z Axis
    tGravityAcc-mean()-X       | Time-Gravity Acceleration - Mean - X Axis
    tGravityAcc-mean()-Y       | Time-Gravity Acceleration - Mean - Y Axis
    tGravityAcc-mean()-Z       | Time-Gravity Acceleration - Mean - Z Axis
    tGravityAcc-std()-X        | Time-Body Acceleration - Standard Deviation - X Axis
    tGravityAcc-std()-Y        | Time-Body Acceleration - Standard Deviation - Y Axis
    tGravityAcc-std()-Z        | Time-Body Acceleration - Standard Deviation - Z Axis
    tBodyAccJerk-mean()-X      | Time-Body Acceleration Jerk - Mean - X Axis
    tBodyAccJerk-mean()-Y      | Time-Body Acceleration Jerk - Mean - Y Axis
    tBodyAccJerk-mean()-Z      | Time-Body Acceleration Jerk - Mean - Z Axis
    tBodyAccJerk-std()-X       | Time-Body Acceleration Jerk - Standard Deviation - X Axis
    tBodyAccJerk-std()-Y       | Time-Body Acceleration Jerk - Standard Deviation - Y Axis
    tBodyAccJerk-std()-Z       | Time-Body Acceleration Jerk - Standard Deviation - Z Axis
    tBodyGyro-mean()-X         |Time-Body Angular Velocity - Mean - X Axis
    tBodyGyro-mean()-Y         | Time-Body Angular Velocity - Mean - Y Axis
    tBodyGyro-mean()-Z         | Time-Body Angular Velocity - Mean - Z Axis
    tBodyGyro-std()-X          | Time-Body Angular Velocity - Standard Deviation - X Axis
    tBodyGyro-std()-Y          | Time-Body Angular Velocity - Standard Deviation - Y Axis
    tBodyGyro-std()-Z          | Time-Body Angular Velocity - Standard Deviation - Z Axis
    tBodyGyroJerk-mean()-X     | Time-Body Angular Velocity Jerk - Mean - X Axis
    tBodyGyroJerk-mean()-Y     | Time-Body Angular Velocity Jerk - Mean - Y Axis
    tBodyGyroJerk-mean()-Z     | Time-Body Angular Velocity Jerk - Mean - Z Axis
    tBodyGyroJerk-std()-X      | Time-Body Angular Velocity Jerk - Standard Deviation - X Axis
    tBodyGyroJerk-std()-Y      | Time-Body Angular Velocity Jerk - Standard Deviation - Y Axis
    tBodyGyroJerk-std()-Z      | Time-Body Angular Velocity Jerk - Standard Deviation - Z Axis
    tBodyAccMag-mean()         | Time-Body Acceleration Jerk Magnitude - Mean
    tBodyAccMag-std()          |Time-Body Acceleration Jerk Magnitude - Standard Deviation
    tGravityAccMag-mean()      | Time-Gravity Acceleration Magnitude - Mean
    tGravityAccMag-std()       | Time-Gravity Acceleration Magnitude - Standard Deviation
    tBodyAccJerkMag-mean()     | Time-Body Acceleration Jerk Magnitude - Mean
    tBodyAccJerkMag-std()      | Time-Body Acceleration Jerk Magnitude - Standard Deviation
     tBodyGyroMag-mean()       | Time-Body Angular Velocity Magnitude - Mean
    tBodyGyroMag-std()         | Time-Body Angular Velocity Magnitude - Standard Deviation
    tBodyGyroJerkMag-mean()    | Time-Body Angular Velocity Jerk Magnitude - Mean
    tBodyGyroJerkMag-std()     | Time-Body Angular Velocity Jerk Magnitude - Standard Deviation
    fBodyAcc-mean()-X          | Frequency-Body Acceleration - Mean - X Axis
    fBodyAcc-mean()-Y          | Frequency-Body Acceleration - Mean - Y Axis
    fBodyAcc-mean()-Z          | Frequency-Body Acceleration - Mean - Z Axis
    fBodyAcc-std()-X           | Frequency-Body Acceleration - Standard Deviation - X Axis"
    fBodyAcc-std()-Y           | Frequency-Body Acceleration - Standard Deviation - Y Axis"
    fBodyAcc-std()-Z           | Frequency-Body Acceleration - Standard Deviation - Z Axis"
    fBodyAccJerk-mean()-X      | Frequency-Body Acceleration Jerk - Mean - X Axis
    fBodyAccJerk-mean()-Y      | Frequency-Body Acceleration Jerk - Mean - Y Axis
    fBodyAccJerk-mean()-Z      | Frequency-Body Acceleration Jerk - Mean - Z Axis
    fBodyAccJerk-std()-X       | Frequency-Body Acceleration Jerk - Standard Deviation - X Axis
    fBodyAccJerk-std()-Y       | Frequency-Body Acceleration Jerk - Standard Deviation - Y Axis
    fBodyAccJerk-std()-Z       | Frequency-Body Acceleration Jerk - Standard Deviation - Z Axis
    fBodyGyro-mean()-X         | Frequency-Body Angular Velocity - Mean - X Axis
    fBodyGyro-mean()-Y         | Frequency-Body Angular Velocity - Mean - Y Axis
    fBodyGyro-mean()-Z         | Frequency-Body Angular Velocity - Mean - Z Axis
    fBodyGyro-std()-X          | Frequency-Body Angular Velocity - Standard Deviation - X Axis
    fBodyGyro-std()-Y          | Frequency-Body Angular Velocity - Standard Deviation - Y Axis
    fBodyGyro-std()-Z          | Frequency-Body Angular Velocity - Standard Deviation - Z Axis
    fBodyAccMag-mean()         | Frequency-Body Acceleration Magnitude - Mean
    fBodyAccMag-std()          | Frequency-Body Acceleration Magnitude - Standard Deviation
    fBodyBodyAccJerkMag-mean() | Frequency-Body Acceleration Jerk Magnitude - Mean
    fBodyBodyAccJerkMag-std()  | Frequency-Body Acceleration Jerk Magnitude - Standard Deviation
    fBodyBodyGyroMag-mean()    | Frequency-Body Angular Velocity Magnitude - Mean
    fBodyBodyGyroMag-std()     | Frequency-Body Angular Velocity Magnitude - Standard Deviation
    fBodyBodyGyroJerkMag-mean()| Frequency-Body Angular Velocity Jerk Magnitude - Mean
    fBodyBodyGyroJerkMag-std() | Frequency-Body Angular Velocity Jerk Magnitude - Standard Deviation

4. Mean Value: This is the mean value of the above mean and standard deviation measurements aggregated by activity for each subject
  * Type: Numeric
  * Units: Same as for input data set (aggregated)
  * Transformation: Aggregated original measurement values from the merged test data set "X_test.txt" and training data set "X_train.txt" to compute mean by activity for each subject.
