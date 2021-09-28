# Getting-and-Cleaning-Data
Practicing to retrieve datasets from the web and tidy the data

## Introduction
This repository holds an practical assignemnt which major tasks was to get sensory data from the web. A study was contucted by Jorge et al. (2012) to retrieve measurements on human activity recognition using a Samsung Smartphone. A number of 30 volunteers wore a Smartphone around their waist and performed every-day life acitivitys (e.g. sitting, standing, lying, walking, walking upstairs, walking downstairs), afterwards 70% of the subjects were allocated to the train group and respectively 30% to the test group. Sensor signals of the smartphone, namely accelerometer and gyroscope, were measured and each recording 3 axial signals into different directions. The researchers investigate a little further and calculate different variables with a time or frequency domain. The dataset for this assignemnt can be downloaded here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

### What does this Zip file contain? 
The underlying UCI HAR Dataset features 4 files and two other folders. 
* *README.txt* gives description on what has been done and what is stored where 
* *features_info.txt* gives an description of all the variables that were measured and processed for each subject
* *features.txt* lists all the variables (in total 516)
* *activity_labels.txt* lists all activities that have been executed by the subjects 
* the folder *train* and *test* contain the datasets for each group, the contents is equivalent:
  * *subject_....txt* list all subject ids that were allocated to respective group, *X_t....txt* entails all measurements of the variables and *Y_t....txt* stores the information about the activity beeing excuted for the certain measurement.

## The Assignment
### Goal:
The goal is to load the dataset into R, process it and provide a tidy, subsetted dataset.

### Execution:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

These steps are done in the attached R script called run_analysis.R

## Output 
The output of this task can be found in this repository.

### Output files:
* README.md: Shows information about what has been done and explains attached files
* CodeBook: detailed explanation of what has been done for purpose of reproducability
* run_analysis.R: stores the R script performing the task from the beginning to end
* FinalDataSet.csv: stores the final dataset, for each subject (1-30) and activity (sitting, standing, lying, walking, walking upstairs, walking downstairs), the mean of the measurements are provided, the units are radians/ seconds. 

## Citation:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
