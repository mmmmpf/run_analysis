---
title: "CodeBook Getting and Cleaning Data Project"
author: "mmmmpf"
date: "26/09/2015"
output: html_document
---

## Coursera "Getting and Cleaning Data" Project
### Project Description:
This project demonstrates the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.


## Study design
Data was collected from 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

More info can be found in the README.txt file and features_info.txt files in the UCI_HAR_Dataset folder.

This **CodeBook** describes the steps taken to create a tudy dataset from the raw data that was collected in the experint.

The data is arranged in a **wide** form of the data, ordered by the subject, activity and averaged mean and standart deviation (std) veriables.

### Collection of the raw data
The data source for the project is located in the following link: 
    
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

***
##Creating the tidy datafile:

**Important**: In order to **generate** the tidy dataset using the run_analysis.R, the files should be downloaded and unzipped into a folder:

```{r}
./project/UCI_HAR_Dataset
```

The data is located in the UCI HAR Dataset folder, split into two sets: train and test, located in the train and test folders respectively.

Subject data is located in the subject_train.txt and subject_test.txt.

features data  is located in the X_train.txt and X_test.txt,
with each number corralated to the feature in features.txt (located in the UCI HAR Dataset folder).

activity data  is located in the Y_train.txt and Y_test.txt,
with each number corralated to one of the activities in activity_labels.txt (located in the UCI HAR Dataset folder).


###1. Merges the training and the test sets to create one data set.
1.1 Read the files into R and merge each of the train and test files to create a bound data set.

1.2 Use descriptive activity names to name the activities in the data set.

1.3 Merge the subject, activity and features into one merged dataframe.

1.4 Rename the columns of the merged dataframe to represent the features by the features.txt file.

###2. Extracts only the measurements on the mean and standard deviation for each measurement. 
2.1 Use grep to extract only the subject, activity, features that include mean (including partial name of mean and Mean) and std calculations.

This was also suggested by David here:
"https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/"

###3. Uses descriptive activity names to name the activities in the data set
This was already performed in stage 1.2.

###4. Appropriately labels the data set with descriptive variable names. 
Use gsub to transform the feature names in order to remove non-standart R sumbols and replace initials with more descriptive variable names.

##### 4.1 dataset was removed of all non-standard R symbols such as "-()," etc. and replaced with "_" or removed:

  + names(Merged_DF)<-gsub("()-", "_", names(Merged_DF), fixed = TRUE)
  
  + names(Merged_DF)<-gsub("-", "_", names(Merged_DF), fixed = TRUE)
  
  + names(Merged_DF)<-gsub(",", "_", names(Merged_DF), fixed = TRUE)
  
  + names(Merged_DF)<-gsub("()", "", names(Merged_DF), fixed = TRUE)
  
  + names(Merged_DF)<-gsub("(", "_", names(Merged_DF), fixed = TRUE)

##### 4.2 The following initials were aslo replaced to use descriptive variable names:
  + Prefix "t" was replaced with "Time_"
  
  + Prefix "f" was replaced with "Frequency_"
  
  + Prefix "MAg" was replaced with "Magnitude"
  
  + Prefix "Acc" was replaced with "Accelerometer"
  
  + Prefix "Gyro" was replaced with "Gyroscope"
  
###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

5.1 Using the reshape2 library, a tidy dataset was created using the subject and activity veriables, performing a mean calculation to create the final tidy_Data dataset.

5.2 Finally, writing the tidy_Data dataset to a text file "tidy_Data.txt".




***

-In order to **read** the tidy Data dataframe ("tidy_Data") into R use the following code:

```{r}
tidy_Data<-read.table("./tidy_data.txt", header =TRUE)
View(tidy_Data)
```

***

###tidy_data.txt properties
The final tidy_data.txt includes 180 obs. of 88 variables (see next section containing a full list).

####Short list of the variables:

The names can be produced using the code:
```{r}
names(tidy_Data)
```
 [1] "subject"                                        
 [2] "activity"                                       
 [3] "Time_BodyAccelerometer_mean_X"                  
 [4] "Time_BodyAccelerometer_mean_Y"                  
 [5] "Time_BodyAccelerometer_mean_Z"                  
 [6] "Time_BodyAccelerometer_std_X"                   
 [7] "Time_BodyAccelerometer_std_Y"                   
 [8] "Time_BodyAccelerometer_std_Z"                   
 [9] "Time_GravityAccelerometer_mean_X"               
[10] "Time_GravityAccelerometer_mean_Y"               
[11] "Time_GravityAccelerometer_mean_Z"               
[12] "Time_GravityAccelerometer_std_X"                
[13] "Time_GravityAccelerometer_std_Y"                
[14] "Time_GravityAccelerometer_std_Z"                
[15] "Time_BodyAccelerometerJerk_mean_X"              
[16] "Time_BodyAccelerometerJerk_mean_Y"              
[17] "Time_BodyAccelerometerJerk_mean_Z"              
[18] "Time_BodyAccelerometerJerk_std_X"               
[19] "Time_BodyAccelerometerJerk_std_Y"               
[20] "Time_BodyAccelerometerJerk_std_Z"               
[21] "Time_BodyGyroscope_mean_X"                      
[22] "Time_BodyGyroscope_mean_Y"                      
[23] "Time_BodyGyroscope_mean_Z"                      
[24] "Time_BodyGyroscope_std_X"                       
[25] "Time_BodyGyroscope_std_Y"                       
[26] "Time_BodyGyroscope_std_Z"                       
[27] "Time_BodyGyroscopeJerk_mean_X"                  
[28] "Time_BodyGyroscopeJerk_mean_Y"                  
[29] "Time_BodyGyroscopeJerk_mean_Z"                  
[30] "Time_BodyGyroscopeJerk_std_X"                   
[31] "Time_BodyGyroscopeJerk_std_Y"                   
[32] "Time_BodyGyroscopeJerk_std_Z"                   
[33] "Time_BodyAccelerometerMag_mean"                 
[34] "Time_BodyAccelerometerMag_std"                  
[35] "Time_GravityAccelerometerMag_mean"              
[36] "Time_GravityAccelerometerMag_std"               
[37] "Time_BodyAccelerometerJerkMag_mean"             
[38] "Time_BodyAccelerometerJerkMag_std"              
[39] "Time_BodyGyroscopeMag_mean"                     
[40] "Time_BodyGyroscopeMag_std"                      
[41] "Time_BodyGyroscopeJerkMag_mean"                 
[42] "Time_BodyGyroscopeJerkMag_std"                  
[43] "Frequency_BodyAccelerometer_mean_X"             
[44] "Frequency_BodyAccelerometer_mean_Y"             
[45] "Frequency_BodyAccelerometer_mean_Z"             
[46] "Frequency_BodyAccelerometer_std_X"              
[47] "Frequency_BodyAccelerometer_std_Y"              
[48] "Frequency_BodyAccelerometer_std_Z"              
[49] "Frequency_BodyAccelerometer_meanFreq_X"         
[50] "Frequency_BodyAccelerometer_meanFreq_Y"         
[51] "Frequency_BodyAccelerometer_meanFreq_Z"         
[52] "Frequency_BodyAccelerometerJerk_mean_X"         
[53] "Frequency_BodyAccelerometerJerk_mean_Y"         
[54] "Frequency_BodyAccelerometerJerk_mean_Z"         
[55] "Frequency_BodyAccelerometerJerk_std_X"          
[56] "Frequency_BodyAccelerometerJerk_std_Y"          
[57] "Frequency_BodyAccelerometerJerk_std_Z"          
[58] "Frequency_BodyAccelerometerJerk_meanFreq_X"     
[59] "Frequency_BodyAccelerometerJerk_meanFreq_Y"     
[60] "Frequency_BodyAccelerometerJerk_meanFreq_Z"     
[61] "Frequency_BodyGyroscope_mean_X"                 
[62] "Frequency_BodyGyroscope_mean_Y"                 
[63] "Frequency_BodyGyroscope_mean_Z"                 
[64] "Frequency_BodyGyroscope_std_X"                  
[65] "Frequency_BodyGyroscope_std_Y"                  
[66] "Frequency_BodyGyroscope_std_Z"                  
[67] "Frequency_BodyGyroscope_meanFreq_X"             
[68] "Frequency_BodyGyroscope_meanFreq_Y"             
[69] "Frequency_BodyGyroscope_meanFreq_Z"             
[70] "Frequency_BodyAccelerometerMag_mean"            
[71] "Frequency_BodyAccelerometerMag_std"             
[72] "Frequency_BodyAccelerometerMag_meanFreq"        
[73] "Frequency_BodyBodyAccelerometerJerkMag_mean"    
[74] "Frequency_BodyBodyAccelerometerJerkMag_std"     
[75] "Frequency_BodyBodyAccelerometerJerkMag_meanFreq"
[76] "Frequency_BodyBodyGyroscopeMag_mean"            
[77] "Frequency_BodyBodyGyroscopeMag_std"             
[78] "Frequency_BodyBodyGyroscopeMag_meanFreq"        
[79] "Frequency_BodyBodyGyroscopeJerkMag_mean"        
[80] "Frequency_BodyBodyGyroscopeJerkMag_std"         
[81] "Frequency_BodyBodyGyroscopeJerkMag_meanFreq"    
[82] "angle_tBodyAccelerometerMean_gravity"           
[83] "angle_tBodyAccelerometerJerkMean_gravityMean"   
[84] "angle_tBodyGyroscopeMean_gravityMean"           
[85] "angle_tBodyGyroscopeJerkMean_gravityMean"       
[86] "angle_X_gravityMean"                            
[87] "angle_Y_gravityMean"                            
[88] "angle_Z_gravityMean" 

##Libraries used
reshape2
