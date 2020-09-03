#### INTRODUCTION ####
# You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

#### SETWD ####
getwd()
dir()
#
#
#### LIBRARIES ####
library(tidyr)
library(dplyr)
library(reshape2)
#### LOAD DATA ####

#subject_test
#subject_train
#x_train
#x_test
#y_train
#y_test

sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# Features to name the columns
features <- read.table("UCI HAR Dataset/features.txt")

#### TASK 1 ####
# 1. Merges the training and the test sets to create one data set.

# Merge subjects
subject <- rbind(sub_test, sub_train)
rm("sub_test", "sub_train")
names(subject) <- "subject"


# Merge X data
x_data <- rbind(x_test, x_train)
rm("x_test", "x_train")
names(x_data) <- features$V2


# Merge Y data
y_data <- rbind(y_test, y_train)
rm("y_test", "y_train")
names(y_data) <- "id_activity"

# Merge all data into one

onedataset <- cbind(subject, y_data)
onedataset <- cbind(onedataset, x_data)
rm("subject", "x_data", "y_data")

#### TASK 2 ####
# 2. Extracts only the measurements on the mean and standard deviation for 
# each measurement.

indexing <- features$V2[grepl("(mean|std)\\(\\)", features$V2)]
indexing <- as.character(indexing)
onlymean_std <- onedataset[, c(indexing)]



#### TASK 3 ####
# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("id_activity", "name_activity")
#naming
onlymean_std <- cbind(onedataset[,c(1,2)], onlymean_std)
onlymean_std <- merge(onlymean_std, activities, by.x = "id_activity",
                      all.x = TRUE)
#
#
#### TASK 4 ####
#4. Appropriately labels the data set with descriptive variable names.
#
# wide format to long format
widetolong <- melt(data = onlymean_std, id.vars = c("id_activity", "subject",
                                                    "name_activity"))
#
# adjust names
adjust_names <- strsplit(
  gsub(
    "^((f|t)(Body|BodyBody|Gravity)(Gyro|Acc|Body)[\\-]*(Jerk)?(Mag)?[\\-]*(mean|std)[\\(\\)\\-]*(X|Y|Z)?)",
       "\\2|\\3|\\4|\\5|\\6|\\7|\\8|\\1",
                              widetolong$variable),
  "\\|")
nrows <- length(adjust_names)
ncols <- length(unlist(adjust_names[1]))
variableUnlist <- unlist(adjust_names)
variableMatrix <- base::matrix(data = variableUnlist, nrow = nrows,
                               ncol = ncols, byrow = TRUE)
variableData <- as.data.frame(variableMatrix)
variableData$V8 <- NULL
names(variableData) <- c("dimension", "source","type","jerk", "magnitude",
                         "method","axis")
widetolong <- cbind(widetolong, variableData)

appropriate_labels_data <- widetolong
rm("widetolong", "variableList", "variableUnlist",
   "variableMatrix", "variableData")
#
#
#### TASK 5 ####
# 5. Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 
#
#
longtowide <- dcast(data = appropriate_labels_data, formula = name_activity + subject ~ variable, fun.aggregate = mean)
write.table(x = longtowide, file = "tidy_data_set.txt", row.names = FALSE, quote = FALSE, col.names = FALSE)
#
#
#### END ####