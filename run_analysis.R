cnames = read.table("./UCI HAR Dataset/features.txt") #Read the variable names/features - to be used as column names
coln = cnames[,2] #store column names in a vector

subject.train = read.table("./UCI HAR Dataset/train/subject_train.txt") #Read training data, its activity labels and subjects performing them
activities.train = read.table("./UCI HAR Dataset/train/y_train.txt")
train.data = read.table("./UCI HAR Dataset/train/X_train.txt")
names(subject.train) = "subject" #Give appropriate column names
names(activities.train)= "activities"
names(train.data)=coln #Assign descriptive column names to the data
train.data = cbind(subject.train , train.data , activities.train) #Adding new columns for subject and activities

subject.test = read.table("./UCI HAR Dataset/test/subject_test.txt") #Repeat all above for test data
activities.test = read.table("./UCI HAR Dataset/test/y_test.txt")
test.data = read.table("./UCI HAR Dataset/test/X_test.txt")
names(subject.test) = "subject"
names(activities.test)= "activities"
names(test.data)=coln
test.data = cbind(subject.test , test.data , activities.test)

train_test_merge = rbind(train.data,test.data) #Merge training and test data together
train_test_merge = train_test_merge[order(train_test_merge$subject),]
train_test_merge$activities = mgsub::mgsub(as.character(train_test_merge$activities) , c(1,2,3,4,5,6),c("walking" , "walking_upstairs","walking_downstairs","sitting","standing","laying")) #Give descriptive activity labels

reqd.indexes = grep("mean\\(\\)|std\\(\\)" , coln) #Extract mean() and std() measurements
reqd.column.names = coln[reqd.indexes]

mean.std.data = train_test_merge[reqd.column.names] #Create a new data frame containing only said measurements
mean.std.data = cbind(train_test_merge$subject , mean.std.data , train_test_merge$activities)

colnames(mean.std.data)[1] = "subject" #Give appropriate col names to new data frame
colnames(mean.std.data)[68] = "activities"

grouped.data = group_by(mean.std.data , subject , activities) #Group data by subject and activities performed by each subject
tidydata = summarise_all(grouped.data , mean) #Calculate average of each measurement for each subject per activity. This is the final tidy data set

write.table(tidydata, "tidydata.txt", sep="\t") #Export data 
