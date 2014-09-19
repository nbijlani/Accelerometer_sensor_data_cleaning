## Read me
This file outlines the steps performed to complete the course project for "Getting and Cleaning Data" offered by Johns Hopkins University via Coursera. The aim of the project is to collate and tidy sensor data collected on various subjects from accelerometers using the Samsung Galaxy S smartphone, as part of a Wearable Computing initiative.

## Files included
There are three files included in the repo:
1. run_analysis.r: single script containing all the data cleaning steps performed
2. README.md: this file outlining data cleaning steps
3. Codebook.md: describes the measurements/variables used and the transformations performed to clean up the data

## Files required to run the scripts
The following files must be present in the user's working directory to successfully run the data cleanup script (note directory where applicable):
1. run_analysis.r
2. UCI HAR dataset folder containing the following files:
 * features_info.txt: information about the variables used on the feature vector.
 * features.txt': List of all features.
 * activity_labels.txt: Links the class labels with their activity name.
 * train/X_train.txt: Training set.
 * train/y_train.txt: Training labels.
 * train/subject_train.txt: Training subjects.
 * test/X_test.txt: Test set.
 * test/y_test.txt: Test labels.
 * test/subject_test.txt: Test subjects.

## Output file
The output file is the tidy data file "ProjectOutput.txt" created in the same directory that holds run_analysis.r. The "tidy data" is presented in "long" or "tall" form. In this form, data is organized in rows and columns such that each row contains a single value (mean value in this case) measurement for a single subject for a single activity. Each column is presented with a meaningful column header and contains a single piece of information only. A sample output is shown below:

"Subject" "Activity" "Observation" "Mean Value"

1 "WALKING" "Time-Body Acceleration - Mean - X Axis" 0.277330758736842
1 "WALKING" "Frequency-Body Angular Velocity Jerk Magnitude - Standard Deviation " -0.381601911789474

## Running the analysis/cleanup script
From the working directory (with required input files present as detailed above), type the following instruction within RStudio (or R console prompt):

source("D:\\MOOC\\Getting and Cleaning Data\\run_analysis.R")

(where "D:\\MOOC\\Getting and Cleaning Data\\" is assumed to be the working directory on a Windows machine. Note the \\ )

## Steps to produce tidy data:
1. The first step is a manual inspection of all of the files in the dataset to identify data types, ranges, column headers, and data organization/relationship across data sets.
2. Read in the file "features.txt" into a data frame, providing meaningful column headers: SignalCode and Signal.
3. Identify (via grep), sort by SignalCode, and then select observations related to "mean"" and "standard deviation" signals from the above feature set. To do this, filter signals where "Signal" value ends with "mean()" and "std()". Note that the additional angle variables: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean are not considered.
4. Clean up the individual signal names obtained above, to make them more meaningful and user-friendly. Here are the name manipulation algorithms used:
  * Replace "BodyBody"" by "Body"
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
This leads to user-friendly signal names such as "Time-Body Acceleration - Mean - X Axis", "Frequency-Body Angular Velocity Jerk Magnitude - Standard Deviation" etc.
5. Read in the test data set (X_test.txt) into a data frame. Filter the test data set by the features of interest (i.e. mean and standard deviation) and assign the columns the user-friendly feature labels obtained above.
6. Read in the test activity data set (Y_test.txt) into a data frame, providing meaningful column header: ActivityCode.
7. Read in the test subject data set (subject_test.txt) into a data frame, providing meaningful column header: Subject.
8. Add activity code and subject information from steps 6 and 7 above, into the test data set via cbind.
9. Repeat steps 5 through 8 for the training data set.
10. Merge the test and training data frames (each updated with column headers, activity and subject information above) using rbind. This produces the input to the final steps of tidy data set creation, and has the following columns:
  Subject  ActivityCode Signal1  Signal2  Signal3...Signal66 (where Signal1, Signal2, Signal3...Signal66 are the user-friendly column headers for the signal information related to mean and standard deviation signals).
11. To produce the final version of the tidy data set, the following steps are followed:
  * Use the aggregate() function to calculate the mean of all the signals by activity code and then by subject.
  * Melt the aggregated data frame retaining Subject and ActivityCode as fixed variables. The melted data frame is of the form:
    Subject ActivityCode Variable Value
  
  * Read in the file "activity_labels.txt" into a data frame, providing the meaningful column headers: ActivityCode and Activity.
  * Merge the melted data frame obtained above with the Activity data frame based on the common column: ActivityCode. The new data frame is of the form:  Subject ActivityCode Variable Value Activity
  * Exclude the ActivityCode column from the above data frame
  * Reorder the remaining columns so that the new data frame is of the form: Subject Activity Variable Value
  * Finally, rename the last two columns to "Observation" and "Mean Value" respectively, so that the final tidy data set has the form: "Subject" "Activity" "Observation" "Mean Value"

Write the data frame to a text file called "ProjectOutput.txt" in the working directory, via write.table().
  
  
