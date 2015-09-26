# setwd("~/R/clean_data")
# Read files
X_train.txt<-read.table("./project/UCI_HAR_Dataset/train/X_train.txt")
Y_train.txt<-read.table("./project/UCI_HAR_Dataset/train/Y_train.txt")
subject_train.txt<-read.table("./project/UCI_HAR_Dataset/train/subject_train.txt")

X_test.txt<-read.table("./project/UCI_HAR_Dataset/test/X_test.txt")
Y_test.txt<-read.table("./project/UCI_HAR_Dataset/test/Y_test.txt")
subject_test.txt<-read.table("./project/UCI_HAR_Dataset/test/subject_test.txt")

features.txt<-read.table("./project/UCI_HAR_Dataset/features.txt")
activity_labels.txt<-read.table("./project/UCI_HAR_Dataset/activity_labels.txt")

# 1.1 Merges the training, test and the subject data sets to create a bound data set:
X_bind<-rbind(X_train.txt,X_test.txt)
Y_bind<-rbind(Y_train.txt,Y_test.txt)
S_bind<-rbind(subject_train.txt,subject_test.txt)
              
# 1.2 Replace Y_bind level by its coresponding label from activity_labels.txt
# This is basickly 3. Uses descriptive activity names to name the activities in the data set
Y_bind$V1 <- factor(Y_bind$V1, levels = c(1:6), labels = activity_labels.txt$V2)

# 1.3 Merges the training and the test sets to create one data set.
Merged_DF<-cbind(S_bind,Y_bind,X_bind)

# 1.4 Name the columns in the merged dataframe:
colnames(Merged_DF) <- c("subject", "activity", as.character(features.txt[,2]))


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Merged_DF <- cbind(Merged_DF[,1:2],Merged_DF[, grep("mean|Mean|std", names(Merged_DF))])

# 4. Appropriately labels the data set with descriptive variable names
# 4.1 remove all non-standard R symbols such as "-()," etc. and replace them with "_"
names(Merged_DF)<-gsub("()-", "_", names(Merged_DF), fixed = TRUE)
names(Merged_DF)<-gsub("-", "_", names(Merged_DF), fixed = TRUE)
names(Merged_DF)<-gsub(",", "_", names(Merged_DF), fixed = TRUE)
names(Merged_DF)<-gsub("()", "", names(Merged_DF), fixed = TRUE)
names(Merged_DF)<-gsub("(", "_", names(Merged_DF), fixed = TRUE)
names(Merged_DF)<-gsub(")", "", names(Merged_DF), fixed = TRUE)
#4.2 Replace initials to descriptive variable names
names(Merged_DF)<-gsub("^t", "Time_", names(Merged_DF))
names(Merged_DF)<-gsub("^f", "Frequency_", names(Merged_DF))
names(Merged_DF)<-gsub("MAg", "Magnitude", names(Merged_DF))
names(Merged_DF)<-gsub("Acc", "Accelerometer", names(Merged_DF))
names(Merged_DF)<-gsub("Gyro", "Gyroscope", names(Merged_DF))

# 5.1 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
tidy_Data = dcast(melt(Merged_DF, id.var = c("subject", "activity")) , subject + activity ~ variable, mean)
# dim(tidy_Data)

# 5.2 Finally, write the tidy_Data dataframe to a text file
write.table(tidy_Data, file="./tidy_data.txt", row.name=FALSE)

# TD<-read.table("./tidy_data.txt", header =TRUE)
