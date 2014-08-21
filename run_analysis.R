run_analysis <- function(){
	## Read in features, training, and test data
	features <- read.csv("features.txt",colClasses="character",sep="",header=FALSE)
	testX <- read.csv("./test/X_test.txt",colClasses="character", sep="",header=FALSE)
	testY <- read.csv("./test/Y_test.txt",colClasses="character", sep="",header=FALSE)
	testSubjects <- read.csv("./test/subject_test.txt",colClasses="character", sep="",header=FALSE)
	trainX <- read.csv("./train/X_train.txt",colClasses="character", sep="",header=FALSE)
	trainY <- read.csv("./train/Y_train.txt",colClasses="character", sep="",header=FALSE)
	trainSubjects <- read.csv("./train/subject_train.txt",colClasses="character", sep="",header=FALSE)

	## Combine all XY data
	testSet <- cbind(testY, testSubjects, testX)
	trainSet <- cbind(trainY, trainSubjects, trainX)
	completeSet <- rbind(trainSet, testSet)

	## Create heading for the complete dataset
	heading <- c("Activity", "Subject", features[,2])
	names(completeSet) <- heading

	## Filter out all measure values not relating to std() or mean()
	boolvector <- vector()
	headindex <- 1
	
	while(headindex <= length(heading)){
		
		if(grepl("Activity", heading[headindex], ignore.case=TRUE) | 
			grepl("Subject", heading[headindex], ignore.case=TRUE) | 
			grepl("mean()", heading[headindex], ignore.case=TRUE) | 
			grepl("std()", heading[headindex], ignore.case=TRUE))

		{
			boolvector <- c(boolvector, TRUE)
		}
		else{
			boolvector <- c(boolvector, FALSE)
		}
		headindex <- headindex + 1
	}	
	
	completeSet <- completeSet[,boolvector]

	## Get Activity labels
	alabels <- read.csv("./activity_labels.txt",colClasses="character",header=FALSE, sep="")
	names(alabels) <- c("Index","Activity")

	

	completeSet

}