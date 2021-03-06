
# create 'data' directory if it doesn't exists
if(!file.exists("data")) {
    dir.create("data")
}

# get and extract dataset
zipped_dataset <- "./data/dataset.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = zipped_dataset, method = "curl")

# extract zipped dataset to data folder
unzip(zipped_dataset, exdir = "data")

# rename dataset to simplify
file.rename("./data/UCI HAR Dataset", "./data/dataset")

# save date when data was downloaded
dateDownloaded <- date()
