# Description of variables and summary methods used in the Raw and Tidy Datasets

## Study design (as specified by UCI)

- The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

- Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smart phone (Samsung Galaxy S II) on the waist. 

- Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

- The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

- The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

- The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 

- The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## Features of the Raw Dataset

- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals **(prefix 't' to denote time)** were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

- Similarly, the acceleration signal was then separated into body and gravity acceleration signals **(tBodyAcc-XYZ and tGravityAcc-XYZ)** using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

- Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals **(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)**. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. **(Note the 'f' to indicate frequency domain signals)**. 

- These signals were used to estimate variables of the feature vector for each pattern \
**-XYZ is used to denote 3-axial signals in the X, Y and Z directions**

    * tBodyAcc-XYZ 
    * tGravityAcc-XYZ 
    * tBodyAccJerk-XYZ
    * tBodyGyro-XYZ
    * tBodyGyroJerk-XYZ
    * tGravityAccMag
    * tBodyAccJerkMag
    * tBodyGyroMag
    * tBodyGyroJerkMag
    * fBodyAcc-XYZ
    * fBodyAccJerk-XYZ
    * fBodyGyro-XYZ
    * fBodyAccMag
    * fBodyAccJerkMag
    * fBodyGyroMag
    * fBodyGyroJerkMag

- The set of variables that were estimated from these signals are: 

    * mean(): Mean value
    * std(): Standard deviation
    * mad(): Median absolute deviation 
    * max(): Largest value in array
    * min(): Smallest value in array
    * sma(): Signal magnitude area
    * energy(): Energy measure. Sum of the squares divided by the number of values. 
    * iqr(): Interquartile range 
    * entropy(): Signal entropy
    * arCoeff(): Auto-regression coefficients with Burg order equal to 4
    * correlation(): correlation coefficient between two signals
    * maxInds(): index of the frequency component with largest magnitude
    * meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    * skewness(): skewness of the frequency domain signal 
    * kurtosis(): kurtosis of the frequency domain signal 
    * bandsEnergy(): Energy of a frequency interval within the 64  bins of the FFT of each window.
    * angle(): Angle between to vectors.

- Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable :

    * gravityMean
    * tBodyAccMean
    * tBodyAccJerkMean
    * tBodyGyroMean
    *  tBodyGyroJerkMean

- The complete list of variables of each feature vector is available in *features.txt*
```
Units for all acceleration variables = standard gravity unit 'g'
Units for gyroscope variable = radians/second
```


## Features of the Tidy Dataset


- The training - ***( X_train.txt and y_train.txt )***, test ***( X_test.txt and y_test.txt )*** and subject ***( subject_train.txt and subject_test.txt )*** data were merged together and ordered by subject. 

- Appropriate column names were given for the added columns. 

- *y_train.txt* and *y_test.txt* contain activity labels which are numeric. These labels are specified in *activity_labels.txt*. These were converted into descriptive names (as given in the file).

- The **mean()** and **std()** [Standard deviation] measurements for each variable was extracted from the data in the previous step.

- The average of these measurements was taken for each subject, performing each activity specified in *activity_labels.txt*.

- Thus, the final tidy data set contains the average of **mean()** and **std()** measurements for each variable, grouped first by subject, then by activity for each subject.

- The variable names and **units** for the measurements were not changed, and are the same as specified for the raw data set. The new columns added are :
  * ***subject*** - denoting the id of the subject performing the action. Range is [1,30]
  * ***activities*** - denoting the various activities performed by each subject


