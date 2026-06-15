#Step 1
feature<-read.table("./UCI HAR Dataset/features.txt")
feature_names<-feature[,2]
train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names = feature_names)
test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names = feature_names)
combined<-rbind.data.frame(train,test)

#Step 2
target_columns<-grep("mean()|std()",colnames(combined))
tidy_combined<-combined[,target_columns]

#Step 3
train_act<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names = "Activity")
test_act<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names = "Activity")
activities<-rbind(train_act,test_act)
activity_label<-read.table("./UCI HAR dataset/activity_labels.txt",col.names = c("Activity","Activity_Name"))
tidy_combined<-cbind(tidy_combined,activities)
tidy_combined<-merge(tidy_combined,activity_label,by="Activity")
tidy_combined$Activity<-NULL

#Step 4
new_names<-names(tidy_combined)
new_names<-gsub("^t","Time_",new_names)
new_names<-gsub("^f","Frequency_",new_names)

new_names<-gsub("Acc","Accelerometre",new_names)
new_names<-gsub("Gyro","Gyroscope",new_names)
new_names<-gsub("Mag","Magnitude",new_names)
new_names<-gsub("BodyBody","Body",new_names)

new_names<-gsub("()","",new_names)
new_name<-gsub("-","_",new_names)

colnames(tidy_combined)<-new_names

#Step 5
temp_subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
temp_subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(temp_subject_train,temp_subject_test)
colnames(subject)<-"Subject"
tidy_combined<-cbind(tidy_combined,subject)

final_tidy_data <- tidy_combined %>%
  group_by(Subject, Activity_Name) %>%
  summarise(across(everything(), mean), .groups = "drop")
final_tidy_data<-final_tidy_data[order(final_tidy_data$Subject,final_tidy_data$Activity_Name)]

write.table(final_tidy_data, "final_tidy_dataset.txt", row.name = FALSE)