# Step 1 - Extract features
dfFeatureNames <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\features.txt", col.names=c("SignalCode", "Signal"))

# Step 2 - Find out indices of mean and SD columns
colsForMean <- grep("mean([^a-zA-Z])", dfFeatureNames$Signal)
colsForStd <- grep("std([^a-zA-Z])", dfFeatureNames$Signal)
colsToSelect <- c(colsForMean, colsForStd)
colsToSelect <- sort(colsToSelect)

# Step 3 - Extract features of interest, i.e. mean and SD columns only
dfFilteredFeatures <- dfFeatureNames[dfFeatureNames$SignalCode %in% colsToSelect,]

# Step 4 - Provide meaningful names to features, clean up feature names

# 1. Replace BodyBody by Body
dfFilteredFeatures$Signal <- gsub("BodyBody","Body",as.matrix(dfFilteredFeatures$Signal))
# 2. Replace beginning t by Time -  
dfFilteredFeatures$Signal <- gsub("^t", "Time-", as.matrix(dfFilteredFeatures$Signal))
# 3. Replace beginning f by Frequency - 
dfFilteredFeatures$Signal <- gsub("^f", "Frequency-", as.matrix(dfFilteredFeatures$Signal))
# 4. Replace Acc by Acceleration
dfFilteredFeatures$Signal <- gsub("Acc", "Acceleration ", as.matrix(dfFilteredFeatures$Signal))
# 5. Replace Body by Body with a space
dfFilteredFeatures$Signal <- gsub("Body", "Body ", as.matrix(dfFilteredFeatures$Signal))
# 6. Replace Mag by Magnitude with a space
dfFilteredFeatures$Signal <- gsub("Mag", "Magnitude ", as.matrix(dfFilteredFeatures$Signal))
# 7. Replace Gravity by Gravity with a space
dfFilteredFeatures$Signal <- gsub("Gravity", "Gravity ", as.matrix(dfFilteredFeatures$Signal))
# 8. Replace Jerk by Jerk with a space
dfFilteredFeatures$Signal <- gsub("Jerk", "Jerk ", as.matrix(dfFilteredFeatures$Signal))
# 10. Replace gyro by Angular Velocity
dfFilteredFeatures$Signal <- gsub("Gyro", "Angular Velocity ", as.matrix(dfFilteredFeatures$Signal))
# 11. Replace mean() by Mean
dfFilteredFeatures$Signal <- gsub("mean([^a-zA-Z]*)", " Mean ", as.matrix(dfFilteredFeatures$Signal))
# 12. Replace std() by Std Deviation
dfFilteredFeatures$Signal <- gsub("std([^a-zA-Z]*)", " Standard Deviation ", as.matrix(dfFilteredFeatures$Signal))
# 13. Replace terminating X by X Axis 
dfFilteredFeatures$Signal <- gsub("X$", "- X Axis", as.matrix(dfFilteredFeatures$Signal))
# 14. Replace terminating Y by Y Axis
dfFilteredFeatures$Signal <- gsub("Y$", "- Y Axis", as.matrix(dfFilteredFeatures$Signal))
# 15. Replace terminating Z by Z Axis
dfFilteredFeatures$Signal <- gsub("Z$", "- Z Axis", as.matrix(dfFilteredFeatures$Signal))

# Step 5 - Filter test data set by features of interest and assign feature labels
dfTest <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
dfFilteredTest <- dfTest[,colsToSelect]
colnames(dfFilteredTest) <- dfFilteredFeatures$Signal

# Step 6 - Add activity and student codes into test data set
dfActTest <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\Y_test.txt", col.names=c("ActivityCode")) 
dfSubTest <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt", col.names=c("Subject"))
dfMergeTest <- cbind(dfSubTest, dfActTest, dfFilteredTest)

# Step 7 - Filter training data set by features of interest and assign feature labels
dfTrain <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
dfFilteredTrain <- dfTrain[,colsToSelect]
colnames(dfFilteredTrain) <- dfFilteredFeatures$Signal

# Step 8 - Add activity and student codes into training data set
dfActTrain <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\Y_train.txt", col.names=c("ActivityCode")) 
dfSubTrain <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt", col.names=c("Subject"))
dfMergeTrain <- cbind(dfSubTrain, dfActTrain, dfFilteredTrain)

# Step 9 - Merge test and training data sets
dfMerged <- rbind(dfMergeTest, dfMergeTrain)

# Step 10 - Join with activity descriptions data set to supply activity names
dfActivityNames <- read.table(file=".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt", col.names=c("ActivityCode", "Activity")) 
dfMergedWithActivity <- merge(dfMerged, dfActivityNames, by.x = "ActivityCode", by.y = "ActivityCode")

# Step 11 - Tidy data set creation
# # Option 1 (wide form)
# dfAg <- aggregate(. ~ Subject+ActivityCode,data = dfMerged,FUN=mean)
# dfTidy <- merge(dfAg, dfActivityNames, by.x = "ActivityCode", by.y = "ActivityCode")
# dfTidy <- dfTidy[,!names(dfTidy) %in% c("ActivityCode")]
# dfTidyFinal <- dfTidy[, c(1, 68, 2:67)]
# dfTidyFinal <- dfTidyFinal[order(dfTidyFinal$Subject),]
# print (head(dfTidyFinal))

# Option 2 (tall form)
dfAg <- aggregate(. ~ Subject+ActivityCode,data = dfMerged,FUN=mean)
library(reshape2)
dfMelt2 <- melt(dfAg, id=c("Subject", "ActivityCode"))
dfTidy2 <- merge(dfMelt2, dfActivityNames, by.x = "ActivityCode", by.y = "ActivityCode")
dfTidy2 <- dfTidy2[,!names(dfTidy2) %in% c("ActivityCode")]
colnames(dfTidy2) <- c("Subject", "Observation", "Mean Value", "Activity")
# Reorder columns according to tidy data principles: fixed variables followed by measured variables
dfTidy2Final <- dfTidy2[, c(1, 4, 2:3)]
dfTidy2Final <- dfTidy2Final[order(dfTidy2Final$Subject),]

write.table(dfTidy2Final, file=".\\ProjectOutput.txt", row.names=FALSE)
