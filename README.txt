=========================================================================
Getting and Cleaning Data course project.  The goal is to demonstrate the 
ability to collect, work with, and clean a data that can be used for later
analysis.
=========================================================================
Eric Robertson

======================

The script run_analysis will read in all the data files listed in the dataset 
section below.  This data is then organized into one master tidy dataset.  
All variable data is displayed in their own column.  The row data is 
organized by Activity and Subject performing that activity. The dataset was 
comprised of using the following data:
 
- features.txt data for column headings of the dataset

- x_train.txt and x_test.txt data as row data under the features columns of the
  dataset

- y_train.txt and y_test.txt data as a single data column within the dataset 
  representing the activity type 

- subject_train.txt and subject_test.txt data combined into a single
  data column in the dataset representing the id of the subject who the x_train 
  and x_test data values belong to

- activity_labels.txt data is used to map and replace the numeric activity id's 
  with more descriptive text labels
================================================================================

The required R libraries to run the run_analysis script are as follows:

- reshape2
- grep


The dataset includes the following files:
=========================================

- 'README.txt'

- 'codebook.pdf/docx/txt':  Explains all the variables, data, and tranformations performed.

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
