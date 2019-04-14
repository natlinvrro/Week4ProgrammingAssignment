                                                            ####Code Book
                        
This file contains information on the data, variables and transformations performed in the completion of Week 4 Getting and Cleaning Data Course Project.

#####Data

The data is composed of **180 rows** and **82** columns. The first three columns contain identification information for the subject and activity. The rest of the columns contain the mean for each feature per subject and type of activity.

#####Variables

The following variables are dedicated for the identification of the subject and activity:

1. subject_id

    This refers to the test subject from test subject 1 to 30.

2. activity

    This refers to the test or the type of activity done during taking samples. There are six values, namely: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS". "SITTING", "STANDING" and "LAYING"

3. test_id

    This refers to the identification number, from 1 to 6, of the test or type of activity done during taking the sample.

    The following variables compose the rest of the dataset. All are the summarized (averaged) version of the main samples per subject and activity:

    * tBodyAcc-mean()-X
    * tBodyAcc-mean()-Y
    * tBodyAcc-mean()-Z
    * tBodyAcc-std()-X
    * tBodyAcc-std()-Y
    * tBodyAcc-std()-Z
    * tGravityAcc-mean()-X
    * tGravityAcc-mean()-Y
    * tGravityAcc-mean()-Z
    * tGravityAcc-std()-X
    * tGravityAcc-std()-Y
    * tGravityAcc-std()-Z
    * tBodyAccJerk-mean()-X
    * tBodyAccJerk-mean()-Y
    * tBodyAccJerk-mean()-Z
    * tBodyAccJerk-std()-X
    * tBodyAccJerk-std()-Y
    * tBodyAccJerk-std()-Z
    * tBodyGyro-mean()-X
    * tBodyGyro-mean()-Y
    * tBodyGyro-mean()-Z
    * tBodyGyro-std()-X
    * tBodyGyro-std()-Y
    * tBodyGyro-std()-Z
    * tBodyGyroJerk-mean()-X
    * tBodyGyroJerk-mean()-Y
    * tBodyGyroJerk-mean()-Z
    * tBodyGyroJerk-std()-X
    * tBodyGyroJerk-std()-Y
    * tBodyGyroJerk-std()-Z
    * tBodyAccMag-mean()
    * tBodyAccMag-std()
    * tGravityAccMag-mean()
    * tGravityAccMag-std()
    * tBodyAccJerkMag-mean()
    * tBodyAccJerkMag-std()
    * tBodyGyroMag-mean()
    * tBodyGyroMag-std()
    * tBodyGyroJerkMag-mean()
    * tBodyGyroJerkMag-std()
    * fBodyAcc-mean()-X
    * fBodyAcc-mean()-Y
    * fBodyAcc-mean()-Z
    * fBodyAcc-std()-X
    * fBodyAcc-std()-Y
    * fBodyAcc-std()-Z
    * fBodyAcc-meanFreq()-X
    * fBodyAcc-meanFreq()-Y
    * fBodyAcc-meanFreq()-Z
    * fBodyAccJerk-mean()-X
    * fBodyAccJerk-mean()-Y
    * fBodyAccJerk-mean()-Z
    * fBodyAccJerk-std()-X
    * fBodyAccJerk-std()-Y
    * fBodyAccJerk-std()-Z
    * fBodyAccJerk-meanFreq()-X
    * fBodyAccJerk-meanFreq()-Y
    * fBodyAccJerk-meanFreq()-Z
    * fBodyGyro-mean()-X
    * fBodyGyro-mean()-Y
    * fBodyGyro-mean()-Z
    * fBodyGyro-std()-X
    * fBodyGyro-std()-Y
    * fBodyGyro-std()-Z
    * fBodyGyro-meanFreq()-X
    * fBodyGyro-meanFreq()-Y
    * fBodyGyro-meanFreq()-Z
    * fBodyAccMag-mean()
    * fBodyAccMag-std()
    * fBodyAccMag-meanFreq()
    * fBodyBodyAccJerkMag-mean()
    * fBodyBodyAccJerkMag-std()
    * fBodyBodyAccJerkMag-meanFreq()
    * fBodyBodyGyroMag-mean()
    * fBodyBodyGyroMag-std()
    * fBodyBodyGyroMag-meanFreq()
    * fBodyBodyGyroJerkMag-mean()
    * fBodyBodyGyroJerkMag-std()
    * fBodyBodyGyroJerkMag-meanFreq()

#####Transformations

The following are the main transformations performed toward the data:

1. mutate

    This was used to combine the data (subject_id, x_train, test_id) whether it was for train or test data.

2. rbind

    This was used to combine the two datasets (test and train) together.

3. merge

    This was used to link the table for activities with the binded data.

4. aggregate

    This was used to get the mean per column of the dataset.

5. assignments

    This was done for basic manipulation (e.g. changing the order of the data frame columns, duplicating objects, etc.)