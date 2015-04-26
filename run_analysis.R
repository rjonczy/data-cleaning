library(reshape2)

# load 'test' datasets
test.subject <- read.table('./data/dataset/test/subject_test.txt')
test.x <- read.table('./data/dataset/test/X_test.txt')
test.y <- read.table('./data/dataset/test/y_test.txt')

# load 'training' dataset
train.subject <- read.table('./data/dataset/train/subject_train.txt')
train.x <- read.table('./data/dataset/train/X_train.txt')
train.y <- read.table('./data/dataset/train/y_train.txt')

# load 'features' and activity_labels
features <- read.table('./data/dataset/features.txt')
activity_labels <- read.table('./data/dataset/activity_labels.txt')

# merge test and training data into one dataset
data.subject <- rbind(test.subject, train.subject)
colnames(data.subject) <- "subject"

data.labels <- rbind(test.y, train.y)
data.labels <- merge(data.labels, activity_labels, by = 1)[,2]

data.values <- rbind(test.x, train.x)
colnames(data.values) <- features[,2]

# merge data.subject, data.labels and data.values into one dataset
data <- cbind(data.subject, data.labels, data.values)

# get only mean and standard deviations from data
col_mean_std <- grep("-mean|-std", colnames(data))
data_new <- data[, c(1, 2, col_mean_std)]

melted <- melt(data_new, id.var = c("subject", "data.labels"))
means <- dcast(melted, subject + data.labels ~ variable, mean)

write.table(means, file="./data/tidy_data.txt", row.names = FALSE)


