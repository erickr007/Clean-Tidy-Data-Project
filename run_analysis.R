run_analysis <- function(){
	## Read in features, training, and test data
	features <- read.csv("features.txt",colClasses="character",sep="",header=FALSE)
	testX <- read.csv("./test/X_test.txt",colClasses="numeric", sep="",header=FALSE)
	testY <- read.csv("./test/Y_test.txt",colClasses="character", sep="",header=FALSE)
	testSubjects <- read.csv("./test/subject_test.txt",colClasses="numeric", sep="",header=FALSE)
	trainX <- read.csv("./train/X_train.txt",colClasses="numeric", sep="",header=FALSE)
	trainY <- read.csv("./train/Y_train.txt",colClasses="character", sep="",header=FALSE)
	trainSubjects <- read.csv("./train/subject_train.txt",colClasses="numeric", sep="",header=FALSE)

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
	
	while(headindex <= length(heading))
	{
		
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

	## Replace dataset's Activity integer values with the descriptive labels
	labelindex <- 1
	while(labelindex <= length(alabels[,2]))
	{
		logicvector <- completeSet[,"Activity"] == alabels[labelindex,1]
		completeSet[logicvector,"Activity"] = alabels[labelindex,2]	
	
		labelindex <- labelindex + 1
	}

	## Display average for each activity of each Subject
	meltDataSet <- melt(completeSet, id=c("Activity","Subject"), measure.vars=names(ds)[3:length(ds)])
	castDataSet <- dcast(meltds2, Activity + Subject ~ variable, mean)

	castDataSet

}