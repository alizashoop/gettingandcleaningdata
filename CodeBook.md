CodeBook

This codebook describes the data, variables, relationships and transformations made to the original data set. 

Data

*Original Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

*Data files: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*The data set is comprised of a training collection (subject, x, y), test collection (subject, x, y), a file describing the activities, and 2 files describing the features. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

-'README.txt'
-'features_info.txt': describes the variables used on the features
-'features.txt': list of all features
-'activity_labels.txt': links the activity ids with their activity labels
-'train/X_train.txt': training set
-'train/y_train.txt': training labels
-'test/X_test.txt': test set
-'test/y_test.txt': test labels


*run_analysis.R requires the following libraries:
-dplyr
-data.table

*The script first locates the files on the drive and loads each file.
*Then, the script selects the columns with "mean" or "std" in both the training and testing sets.
*Next, the script begins to clean up the individial data sets and merges each data set.  Column names are also tidied.
*Finally, the mean of each subject/activity group is calculated and saved into a separate data set.  
*Both a full data set (tidy_data.txt) and a summary data set (mean_tidy_data.txt) are then available to the user.
