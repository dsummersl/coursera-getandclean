CodeBook
========

A summary of the Human Activity Recognition database built from the recordings
of 30 subjects performing activities of daily living (ADL) while carrying a
waist-mounted smartphone with embedded inertial sensors.

More information about the dataset can be found 
[on its website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The `run_analysis.R` script generates a data set with the average values grouped
by activity and subject.

Transforms
----------

1. If a local copy doesn't exist, it is downloaded [from this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Data, subjects, and activities data are loaded for both training and test
   sets.
3. Activity tables are converted to factors.
4. The training and test datasets are merged into data, subject, and activity
   sets.
6. The list of all features are loaded. All features containing `mean()` or
   `std()` are filtered from the list of features.
7. Columns filtered from the previous step are selected from the data set.
8. The column names are converted to lowercase, parens are remove, `t` and `f`
   prefix are expanded to their full meanings, and hyphens are converted to
   periods. Example: `tBodyAcc-mean()-X` is converted to `bodyacc.time.mean.x`.
9. The subject values are added as the `subject` column to the data set.
10. The activity values are added as the `activity` column to the data set.
11. The data set is grouped by subject and activity, and the average is computed
    for all columns in each group.
12. The data is written to a file called `mean_by_activity_and_subject.csv`.

Data
----

The data set variables:

 * activity: (factor) An activity label.
 * subject: (int) The test subject identifier.
 * bodyacc.time.mean.x: (num) Body acceleration mean along x-axis.
 * bodyacc.time.mean.y: (num) Body acceleration mean along y-axis.
 * bodyacc.time.mean.z: (num) Body acceleration mean along z-axis.
 * bodyacc.time.std.x: (num) Body acceleration standard deviation along x-axis.
 * bodyacc.time.std.y: (num) Body acceleration standard deviation along y-axis.
 * bodyacc.time.std.z: (num) Body acceleration standard deviation along z-axis.
 * gravityacc.time.mean.x: (num) Gravity acceleration mean along x-axis.
 * gravityacc.time.mean.y: (num) Gravity acceleration mean along y-axis.
 * gravityacc.time.mean.z: (num) Gravity acceleration mean along z-axis.
 * gravityacc.time.std.x: (num) Gravity acceleration standard deviation along x-axis.
 * gravityacc.time.std.y: (num) Gravity acceleration standard deviation along y-axis.
 * gravityacc.time.std.z: (num) Gravity acceleration standard deviation along z-axis.
 * bodyaccjerk.time.mean.x: (num) Body jerk signal mean along x-axis.
 * bodyaccjerk.time.mean.y: (num) Body jerk signal mean along y-axis.
 * bodyaccjerk.time.mean.z: (num) Body jerk signal mean along z-axis.
 * bodyaccjerk.time.std.x: (num) Body jerk signal standard deviation along x-axis.
 * bodyaccjerk.time.std.y: (num) Body jerk signal standard deviation along y-axis.
 * bodyaccjerk.time.std.z: (num) Body jerk signal standard deviation along z-axis.
 * bodygyro.time.mean.x: (num) Body angular velocity mean along x-axis.
 * bodygyro.time.mean.y: (num) Body angular velocity mean along y-axis.
 * bodygyro.time.mean.z: (num) Body angular velocity mean along z-axis.
 * bodygyro.time.std.x: (num) Body angular velocity standard deviation x-axis.
 * bodygyro.time.std.y: (num) Body angular velocity standard deviation y-axis.
 * bodygyro.time.std.z: (num) Body angular velocity standard deviation z-axis.
 * bodygyrojerk.time.mean.x: (num) Body angular jerk signal mean x-axis.
 * bodygyrojerk.time.mean.y: (num) Body angular jerk signal mean y-axis.
 * bodygyrojerk.time.mean.z: (num) Body angular jerk signal mean z-axis.
 * bodygyrojerk.time.std.x: (num) Body angular jerk signal standard deviation x-axis.
 * bodygyrojerk.time.std.y: (num) Body angular jerk signal standard deviation y-axis.
 * bodygyrojerk.time.std.z: (num) Body angular jerk signal standard deviation z-axis.
 * bodyaccmag.time.mean: (num) Mean magnitude of body acceleration.
 * bodyaccmag.time.std: (num) Standard deviation of magnitude of body acceleration.
 * gravityaccmag.time.mean: (num) Gravity acceleration mean.
 * gravityaccmag.time.std: (num) Gravity acceleration standard deviation.
 * bodyaccjerkmag.time.mean: (num) Body acceleration jerk magnitude mean.
 * bodyaccjerkmag.time.std: (num) Body acceleration jerk magnitude standard deviation.
 * bodygyromag.time.mean: (num) Body angular velocity magnitude mean.
 * bodygyromag.time.std: (num) Body angular velocity magnitude standard deviation.
 * bodygyrojerkmag.time.mean: (num) Body angular jerk magnitude mean.
 * bodygyrojerkmag.time.std: (num) Body angular jerk magnitude standard deviation.
 * bodyacc.frequency.mean.x: (num) Body acceleration frequency mean along x-axis.
 * bodyacc.frequency.mean.y: (num) Body acceleration frequency mean along y-axis.
 * bodyacc.frequency.mean.z: (num) Body acceleration frequency mean along z-axis.
 * bodyacc.frequency.std.x: (num) Body acceleration frequency standard deviation along x-axis.
 * bodyacc.frequency.std.y: (num) Body acceleration frequency standard deviation along y-axis.
 * bodyacc.frequency.std.z: (num) Body acceleration frequency standard deviation along z-axis.
 * bodyaccjerk.frequency.mean.x: (num) Body acceleration jerk frequency mean along x-axis.
 * bodyaccjerk.frequency.mean.y: (num) Body acceleration jerk frequency mean along y-axis.
 * bodyaccjerk.frequency.mean.z: (num) Body acceleration jerk frequency mean along z-axis.
 * bodyaccjerk.frequency.std.x: (num) Body acceleration jerk frequency standard deviation along x-axis.
 * bodyaccjerk.frequency.std.y: (num) Body acceleration jerk frequency standard deviation along y-axis.
 * bodyaccjerk.frequency.std.z: (num) Body acceleration jerk frequency standard deviation along z-axis.
 * bodygyro.frequency.mean.x: (num) Body angular velocity frequency mean along x-axis.
 * bodygyro.frequency.mean.y: (num) Body angular velocity frequency mean along y-axis.
 * bodygyro.frequency.mean.z: (num) Body angular velocity frequency mean along z-axis.
 * bodygyro.frequency.std.x: (num) Body angular velocity frequency standard deviation along x-axis.
 * bodygyro.frequency.std.y: (num) Body angular velocity frequency standard deviation along y-axis.
 * bodygyro.frequency.std.z: (num) Body angular velocity frequency standard deviation along z-axis.
 * bodyaccmag.frequency.mean: (num) Body acceleration magnitude frequency mean.
 * bodyaccmag.frequency.std: (num) Body acceleration magnitude frequency standard deviation.
 * bodybodyaccjerkmag.frequency.mean: (num) Mean frequency of BodyBody acceleration jerk.
 * bodybodyaccjerkmag.frequency.std: (num) Standard deviation frequency of BodyBody acceleration jerk.
 * bodybodygyromag.frequency.mean: (num) Mean frequency of BodyBody angular velocity magnitude.
 * bodybodygyromag.frequency.std: (num) Standard deviation frequency of BodyBody angular velocity magnitude.
 * bodybodygyrojerkmag.frequency.mean: (num) Mean frequency of BodyBody angular velocity jerk magnitude.
 * bodybodygyrojerkmag.frequency.std: (num) Standard deviation frequency of BodyBody angular velocity jerk magnitude.
