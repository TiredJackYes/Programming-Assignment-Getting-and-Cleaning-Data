library(data.table)

# Load datasets
TrainingData <- read.table("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/train/X_train.txt")
data.table::setnames(TrainingData, colnames(TrainingData), TheMeasurements)
TrainingDataingActivities <- fread(file.path("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/train/Y_train.txt")
                         , col.names = c("Activity"))
TrainingDataSubjects <- fread(file.path("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("SubjectNum"))
TrainingData <- cbind(TrainingDataSubjects, TrainingDataingActivities, TrainingData)

TestingingData <- read.table("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/test/X_test.txt")
data.table::setnames(TestingingData, colnames(TestingingData), TheMeasurements)
TestingingDataActivities <- fread(file.path("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/test/Y_test.txt")
                        , col.names = c("Activity"))
TestingingDataSubjects <- fread(file.path("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/test/subject_test.txt")
                      , col.names = c("SubjectNum"))
TestingingData <- cbind(TestingingDataSubjects, TestingingDataActivities, TestingingData)

activity_labels <- fread(file.path("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/activity_labels.txt")
                         , col.names = c("classLabels", "activityName"))
features <- fread(file.path("D:/Dokumenty/R - John Hopkins/data/UCI HAR Dataset/features.txt")
                  , col.names = c("index", "featureNames"))
featuresForUs <- grep("(mean|std)\\(\\)", features[, featureNames])
TheMeasurements <- features[featuresForUs, featureNames]
TheMeasurements <- gsub('[()]', '', TheMeasurements)

# merge datasets
merged <- rbind(TrainingData, TestingingData)

# Convert classLabels to activityName basically. More explicit. 
library(reshape2)
merged[["Activity"]] <- factor(merged[, Activity]
                                 , levels = activity_labels[["classLabels"]]
                                 , labels = activity_labels[["activityName"]])

merged[["SubjectNum"]] <- as.factor(merged[, SubjectNum])
merged <- reshape2::melt(data = merged, id = c("SubjectNum", "Activity"))
merged <- reshape2::dcast(data = merged, SubjectNum + Activity ~ variable, fun.aggregate = mean)

data.table::fwrite(x = merged, file = "tidyData.txt", quote = FALSE)