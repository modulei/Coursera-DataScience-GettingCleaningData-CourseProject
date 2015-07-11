# CodeBook 
This is the CodeBook for the tidy data set produced by Step 5 of `run_analysis.R` within this repo

## Data Source
This tidy data set contains data derived from the "Human Activity Recognition Using Smartphones Data Set".
- Original Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Original Data Set Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### About the Original Data Set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the `README.*txt*` file for further details about this (original) dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: http://www.youtube.com/watch?v=XOEN9W05_4A

### Original Data Set Files
The dataset includes the following files:

- `README.txt`: Further details about the original dataset.

- `features_info.txt`: Information about the variables used on the feature vector.

- `features.txt`: List of all features.

- `activity_labels.txt`: Links the class labels with their activity name.

- `train/X_train.txt`: Training set.

- `train/y_train.txt`: Training labels.

- `test/X_test.txt`: Test set.

- `test/y_test.txt`: Test labels.

- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Transformations on the Original Data Set
`run_analysis.R` is an R script that modifies the original data set. This section describes the modifications in 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Implementation of Transformations listed above found in `run_anlysis.R`

1. Requires the `plyr` library. 
2. Load the train data and the test data into `temp1` and `temp2` and then bind them together into tables `x`, `s`, and `y`, respectively.
3. Load the feature labels into `features`.
4. Extract only the feature columns (names and data) referring to mean and standard deviations into `features__mean_and_std`.
5. Subset data from the desired features (means and st. devs) into `x`.
6. Clean the feature column names into `names(x)`.
7. Load the activity labels into `activities`.
8. Apply descriptive activity names from `activities` into `y`.
9. Apply the "activity" label to `names(y)`.
10. Apply the "subject" label to `names(s)`.
11. Create a comprehensive (merged) table with the newly cleaned and labeled data called `cleaned` and write the result to the file `merged_cleaned_data.txt`.
12. Create a table called `averages` that merges the `cleaned` data with a column that 
    holds the average of each variable for each activity and each subject. 
13. Write an output file called `data_set_with_averages.txt` that contains data from `averages`.
