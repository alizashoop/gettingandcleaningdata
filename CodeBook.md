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


