# UCI HAR Dataset Codebook

The UCI HAR tidy dataset consists of files [`UCI_HAR_tidy.txt`](UCI_HAR_tidy.txt) and [`UCI_HAR_means.txt`](UCI_HAR_means.txt) (means of each feature by Subject and Activity) which are created by R script [`run_analysis.R`](run_analysis.R), see [README](README.md).

The table consists of the following fields:

* Subject -- a numeric subject identifier between 1 and 30.
* Activity -- WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.
* Features -- 48 columns with structure `{feature}.{statistic}.{axis}` where
  * `{feature}` may be `tBodyAcc`, `tGravityAcc`, `tBodyAccJerk`, `tBodyGyro`, `tBodyGyreJerk`, `fBodyAcc`, `fBodyAccJerk` or `fBodyGyro`;
  * `{statistic}` may be `mean` or `std` for standard deviation;
  * `{axis}` may be `x`, `y` or `z`.

For actions taken to produce the tidy dataset from the original one, see the R script [`run_analysis.R`](run_analysis.R), comments therein and README of the original dataset.


## Data description

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed the six activities
wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and
3-axial angular velocity were captured at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying
oise filters and then sampled in fixed-width sliding windows of 2.56 sec and
50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using
a Butterworth low-pass filter into body acceleration and gravity.
The gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
a vector of features was obtained by calculating variables
from the time and frequency domain.

Features are normalized and bounded within [-1,1].

The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate
frequency domain signals). 

For more information, see the original dataset's documentation in
`UCI HAR Dataset/README.txt`.


## Reference

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. _Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine._ International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
