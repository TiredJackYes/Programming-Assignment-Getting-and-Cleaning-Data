---
title: "CODE BOOK"
output: html_document
---


This code book indicates all the variables, units and other useful information that we work with run_in analysis.R

## information about the data set taken from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]

An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.


Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.



# [Source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## Data package
We are cleaning data obtained from these data sets
1. features_info.txt 
      Stores informations about the features.
2. features.txt
      Contains all features.
3. activity_labels.txt
      Links the class labels with their activity name.
4. X_train.txt
      Training data
5. y_train.txt
      Training labels.
6. X_test.txt
      Test set.
7. y_test.txt
      Test labels.

## Data packages needed to install
1. data.table()
2. reshape2()

##Activity names to name the activities in the data set
They come from activity_labels.txt
We read them into R in activity_labels <- fread(file.path("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/activity_labels.txt")
                         , col.names = c("classLabels", "activityName"))
and incorporate into the merged data set later in the run_analysis.R script
These names are
      
      WALKING
      WALKING_UPSTAIRS
      WALKING_DOWNSTAIRS
      SITTING
      STANDING
      LAYING

## names of the attributes in the merged data set are as following

      "tbodyacc-mean-x"
      "tbodyacc-mean-y"
      "tbodyacc-mean-z"
      "tbodyacc-std-x"
      "tbodyacc-std-y"
      "tbodyacc-std-z"
      "tgravityacc-mean-x"
      "tgravityacc-mean-y"
      "tgravityacc-mean-z"
      "tgravityacc-std-x"
      "tgravityacc-std-y"
      "tgravityacc-std-z"
      "tbodyaccjerk-mean-x"
      "tbodyaccjerk-mean-y"
      "tbodyaccjerk-mean-z"
      "tbodyaccjerk-std-x"
      "tbodyaccjerk-std-y"
      "tbodyaccjerk-std-z"
      "tbodygyro-mean-x"
      "tbodygyro-mean-y"
      "tbodygyro-mean-z"
      "tbodygyro-std-y"
      "tbodygyro-std-z"
      "tbodygyrojerk-mean-x"
      "tbodygyrojerk-mean-y"
      "tbodygyrojerk-mean-z"
      "tbodygyrojerk-std-x"
      "tbodygyrojerk-std-y"
      "tbodygyrojerk-std-z"
      "tbodyaccmag-mean"
      "tbodyaccmag-std"
      "tgravityaccmag-mean"
      "tgravityaccmag-std"
      "tbodyaccjerkmag-mean"
      "tbodyaccjerkmag-std"
      "tbodygyromag-mean"
      "tbodygyromag-std"
      "tbodygyrojerkmag-mean"
      "tbodygyrojerkmag-std"
      "fbodyacc-mean-x"
      "fbodyacc-mean-y"
      "fbodyacc-mean-z"
      "fbodyacc-std-x"
      "fbodyacc-std-y"
      "fbodyacc-std-z"
      "fbodyaccjerk-mean-x"
      "fbodyaccjerk-mean-y"
      "fbodyaccjerk-mean-z"
      "fbodyaccjerk-std-x"
      "fbodyaccjerk-std-y"
      "fbodyaccjerk-std-z"
      "fbodygyro-mean-x"
      "fbodygyro-mean-y"
      "fbodygyro-mean-z"
      "fbodygyro-std-x"
      "fbodygyro-std-y"
      "fbodygyro-std-z"
      "fbodyaccmag-mean"
      "fbodyaccmag-std"
      "fbodybodyaccjerkmag-mean"
      "fbodybodyaccjerkmag-std"
      "fbodybodygyromag-mean"
      "fbodybodygyromag-std"
      "fbodybodygyrojerkmag-mean"
      "fbodybodygyrojerkmag-std"
# Creating a final output

In the end we create a tidy data set from the merged data set as a separate text file and we save it as tidy_data_set



