## Coursera "Getting and Cleaning Data" Project

### Targets: 
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Using the files:

It is strongly suggested to read the **CodeBook** provided for more info.

**Important**: In order to **generate** the tidy dataset using the **run_analysis.R**, the files should be downloaded and unzipped into a folder:

```{r}
./project/UCI_HAR_Dataset
```
The **run_analysis.R** performes the actions described in the Targets section above, and also described extensively in the Codebook file.

-In order to **read** the tidy Data dataframe ("tidy_Data") into R use the following code:

```{r}
tidy_Data<-read.table("./tidy_data.txt", header =TRUE)
View(tidy_Data)
```