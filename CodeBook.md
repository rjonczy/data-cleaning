#CodeBook

## Tidy Data

After running `run_analysis.R` script you will get tidy dataset in file `./data/dataset-tidy.txt`, which includes mean and standard deviation variables for the following original variables,

* tBodyAcc, 
* tGravityAcc, 
* tBodyAccJerk, 
* tBodyGyro, 
* tBodyGyroJerk, 
* tBodyAccMag, 
* tBodyAccJerkMag, 
* tBodyGyroMag, 
* tBodyGyroJerkMag, 
* fBodyAcc, 
* fBodyAccJerk, 
* fBodyGyro, 
* fBodyAccMag, 
* fBodyBodyAccJerkMag, 
* fBodyBodyGyroMag, 
* fBodyBodyGyroJerkMag. 

Column names end with X, Y, Z which indicates direction.

## Transformations


`run_analysis.R` script, performes following operations:

* loads test datasets (`subject_test.txt`, `X_test.txt`, `y_test.txt`)
* loads training datasets (`subject_train.txt`, `X_train.txt`, `y_train.txt`)
* merges the three test and three train files into a single data table, setting textual columns heading
* extracts only mean and std variables
* computes the means, group by subject/activity.
* saves this last dataset to `./data/dataset-tidy.txt`
