# Code Book
generated manuallity on 2020-09-03 01:10:00 for `run_analysis.R`

## Actions performed on data:
* download manuallity data
* set working directory
* list files
* load data with read.table from wd
* merging all *_test.txt and *_train.txt files into one dataset: `onedataset`
* subsetted `onedataset` into `onlymean_std` keeping only the key columns and features containing `std` or `mean`.
* merged with activity labels
* melt `onlymean_std` into ` widetolong
* split feature column `adjust_names` into 7 seperate colums (for each sub feature), and added it to `widetolong`,data
* renamed `widetolong` to **`appropriate_labels_data`**
* cast **`appropriate_labels_data`**into **`longtowide`** with the average of each variable for each activity and each subject dimensions :180 x 68
* write `longtowide` to file  `tidy_data_set.txt`

## `longtowide` variable

### key columns

Variable name       | Description
--------------------|------------
`name_activity`     | Label of activity, Factor w/ 6 levels
`subject`      | ID of activity, int (1-6)ID of subject, int (1-30)
`others`      | key columns and features containing `std` or `mean`

### non-key columns

Variable name       | Description
--------------------|------------
`variable`          | comlete name of the feature, Factor w/ 66 levels (eg. tBodyAcc-mean()-X) 
`value`             | the actual value, num (range: -1:1)
`dimension`         | dimension of measurement, Factor w/ 2 levels: `t` (Time) or `f` (Frequency)
`source`            | source of measurement, Factor w/ 3 levels: `Body`,`BodyBody` or `Gravity`
`type`              | type of measurement, Factor w/ 2 levels: `Acc` (accelerometer) or `Gyro` (gyroscope)
`jerk`              | is 'Jerk' signal , Factor w/ 2 levels:  `Jerk` or `` (non Jerk)
`magnitude`         | is 'Magnitude' value , Factor w/ 2 levels:  `Mag` or `` (non Mag)
`method`            | result from method , Factor w/ 2 levels:  `mean` (average) or `std` (standard deviation)
`axis`              | FFT exrapolated to axis , Factor w/ 2 levels:  `` (no FFT-axis) or `X`, `Y` or `Z`

## `tidy_data_set` variable

### key columns

Variable name       | Description
--------------------|------------
`name_activity`     | Label of activity, Factor w/ 6 levels
`subject`           | ID of subject, int (1-30)
### non-key columns

Variable name       | Description
--------------------|------------
`tBodyAcc-mean()-X`   | the average value for this feature, num (range: -1:1)
`tBodyAcc-mean()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyAcc-mean()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyAcc-std()-X`   | the average value for this feature, num (range: -1:1)
`tBodyAcc-std()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyAcc-std()-Z`   | the average value for this feature, num (range: -1:1)
`tGravityAcc-mean()-X`   | the average value for this feature, num (range: -1:1)
`tGravityAcc-mean()-Y`   | the average value for this feature, num (range: -1:1)
`tGravityAcc-mean()-Z`   | the average value for this feature, num (range: -1:1)
`tGravityAcc-std()-X`   | the average value for this feature, num (range: -1:1)
`tGravityAcc-std()-Y`   | the average value for this feature, num (range: -1:1)
`tGravityAcc-std()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerk-mean()-X`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerk-mean()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerk-mean()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerk-std()-X`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerk-std()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerk-std()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyGyro-mean()-X`   | the average value for this feature, num (range: -1:1)
`tBodyGyro-mean()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyGyro-mean()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyGyro-std()-X`   | the average value for this feature, num (range: -1:1)
`tBodyGyro-std()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyGyro-std()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerk-mean()-X`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerk-mean()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerk-mean()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerk-std()-X`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerk-std()-Y`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerk-std()-Z`   | the average value for this feature, num (range: -1:1)
`tBodyAccMag-mean()`   | the average value for this feature, num (range: -1:1)
`tBodyAccMag-std()`   | the average value for this feature, num (range: -1:1)
`tGravityAccMag-mean()`   | the average value for this feature, num (range: -1:1)
`tGravityAccMag-std()`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerkMag-mean()`   | the average value for this feature, num (range: -1:1)
`tBodyAccJerkMag-std()`   | the average value for this feature, num (range: -1:1)
`tBodyGyroMag-mean()`   | the average value for this feature, num (range: -1:1)
`tBodyGyroMag-std()`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerkMag-mean()`   | the average value for this feature, num (range: -1:1)
`tBodyGyroJerkMag-std()`   | the average value for this feature, num (range: -1:1)
`fBodyAcc-mean()-X`   | the average value for this feature, num (range: -1:1)
`fBodyAcc-mean()-Y`   | the average value for this feature, num (range: -1:1)
`fBodyAcc-mean()-Z`   | the average value for this feature, num (range: -1:1)
`fBodyAcc-std()-X`   | the average value for this feature, num (range: -1:1)
`fBodyAcc-std()-Y`   | the average value for this feature, num (range: -1:1)
`fBodyAcc-std()-Z`   | the average value for this feature, num (range: -1:1)
`fBodyAccJerk-mean()-X`   | the average value for this feature, num (range: -1:1)
`fBodyAccJerk-mean()-Y`   | the average value for this feature, num (range: -1:1)
`fBodyAccJerk-mean()-Z`   | the average value for this feature, num (range: -1:1)
`fBodyAccJerk-std()-X`   | the average value for this feature, num (range: -1:1)
`fBodyAccJerk-std()-Y`   | the average value for this feature, num (range: -1:1)
`fBodyAccJerk-std()-Z`   | the average value for this feature, num (range: -1:1)
`fBodyGyro-mean()-X`   | the average value for this feature, num (range: -1:1)
`fBodyGyro-mean()-Y`   | the average value for this feature, num (range: -1:1)
`fBodyGyro-mean()-Z`   | the average value for this feature, num (range: -1:1)
`fBodyGyro-std()-X`   | the average value for this feature, num (range: -1:1)
`fBodyGyro-std()-Y`   | the average value for this feature, num (range: -1:1)
`fBodyGyro-std()-Z`   | the average value for this feature, num (range: -1:1)
`fBodyAccMag-mean()`   | the average value for this feature, num (range: -1:1)
`fBodyAccMag-std()`   | the average value for this feature, num (range: -1:1)
`fBodyBodyAccJerkMag-mean()`   | the average value for this feature, num (range: -1:1)
`fBodyBodyAccJerkMag-std()`   | the average value for this feature, num (range: -1:1)
`fBodyBodyGyroMag-mean()`   | the average value for this feature, num (range: -1:1)
`fBodyBodyGyroMag-std()`   | the average value for this feature, num (range: -1:1)
`fBodyBodyGyroJerkMag-mean()`   | the average value for this feature, num (range: -1:1)
`fBodyBodyGyroJerkMag-std()`   | the average value for this feature, num (range: -1:1)