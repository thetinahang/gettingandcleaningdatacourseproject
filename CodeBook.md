## Getting and Cleaning Data Course Project

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Source Information
Please go to the following URL for more information. 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### The Variables
- "TimeBodyAccelerometerMean()-X"                    
- "TimeBodyAccelerometerMean()-Y"                    
- "TimeBodyAccelerometerMean()-Z"                    
- "TimeBodyAccelerometerSTD()-X"                     
- "TimeBodyAccelerometerSTD()-Y"                     
- "TimeBodyAccelerometerSTD()-Z"                     
- "TimeGravityAccelerometerMean()-X"                 
- "TimeGravityAccelerometerMean()-Y"                 
- "TimeGravityAccelerometerMean()-Z"                 
- "TimeGravityAccelerometerSTD()-X"                  
- "TimeGravityAccelerometerSTD()-Y"                  
- "TimeGravityAccelerometerSTD()-Z"                  
- "TimeBodyAccelerometerJerkMean()-X"                
- "TimeBodyAccelerometerJerkMean()-Y"                
- "TimeBodyAccelerometerJerkMean()-Z"                
- "TimeBodyAccelerometerJerkSTD()-X"                 
- "TimeBodyAccelerometerJerkSTD()-Y"                 
- "TimeBodyAccelerometerJerkSTD()-Z"                 
- "TimeBodyGyroscopeMean()-X"                        
- "TimeBodyGyroscopeMean()-Y"                        
- "TimeBodyGyroscopeMean()-Z"                        
- "TimeBodyGyroscopeSTD()-X"                         
- "TimeBodyGyroscopeSTD()-Y"                         
- "TimeBodyGyroscopeSTD()-Z"                         
- "TimeBodyGyroscopeJerkMean()-X"                    
- "TimeBodyGyroscopeJerkMean()-Y"                    
- "TimeBodyGyroscopeJerkMean()-Z"                    
- "TimeBodyGyroscopeJerkSTD()-X"                     
- "TimeBodyGyroscopeJerkSTD()-Y"                     
- "TimeBodyGyroscopeJerkSTD()-Z"                     
- "TimeBodyAccelerometerMagnitudeMean()"             
- "TimeBodyAccelerometerMagnitudeSTD()"              
- "TimeGravityAccelerometerMagnitudeMean()"          
- "TimeGravityAccelerometerMagnitudeSTD()"           
- "TimeBodyAccelerometerJerkMagnitudeMean()"         
- "TimeBodyAccelerometerJerkMagnitudeSTD()"          
- "TimeBodyGyroscopeMagnitudeMean()"                 
- "TimeBodyGyroscopeMagnitudeSTD()"                  
- "TimeBodyGyroscopeJerkMagnitudeMean()"             
- "TimeBodyGyroscopeJerkMagnitudeSTD()"              
- "FrequencyBodyAccelerometerMean()-X"               
- "FrequencyBodyAccelerometerMean()-Y"               
- "FrequencyBodyAccelerometerMean()-Z"               
- "FrequencyBodyAccelerometerSTD()-X"                
- "FrequencyBodyAccelerometerSTD()-Y"                
- "FrequencyBodyAccelerometerSTD()-Z"                
- "FrequencyBodyAccelerometerMeanFreq()-X"           
- "FrequencyBodyAccelerometerMeanFreq()-Y"           
- "FrequencyBodyAccelerometerMeanFreq()-Z"           
- "FrequencyBodyAccelerometerJerkMean()-X"           
- "FrequencyBodyAccelerometerJerkMean()-Y"           
- "FrequencyBodyAccelerometerJerkMean()-Z"           
- "FrequencyBodyAccelerometerJerkSTD()-X"            
- "FrequencyBodyAccelerometerJerkSTD()-Y"            
- "FrequencyBodyAccelerometerJerkSTD()-Z"            
- "FrequencyBodyAccelerometerJerkMeanFreq()-X"       
- "FrequencyBodyAccelerometerJerkMeanFreq()-Y"       
- "FrequencyBodyAccelerometerJerkMeanFreq()-Z"       
- "FrequencyBodyGyroscopeMean()-X"                   
- "FrequencyBodyGyroscopeMean()-Y"                   
- "FrequencyBodyGyroscopeMean()-Z"                   
- "FrequencyBodyGyroscopeSTD()-X"                    
- "FrequencyBodyGyroscopeSTD()-Y"                    
- "FrequencyBodyGyroscopeSTD()-Z"                    
- "FrequencyBodyGyroscopeMeanFreq()-X"               
- "FrequencyBodyGyroscopeMeanFreq()-Y"               
- "FrequencyBodyGyroscopeMeanFreq()-Z"               
- "FrequencyBodyAccelerometerMagnitudeMean()"        
- "FrequencyBodyAccelerometerMagnitudeSTD()"         
- "FrequencyBodyAccelerometerMagnitudeMeanFreq()"    
- "FrequencyBodyAccelerometerJerkMagnitudeMean()"    
- "FrequencyBodyAccelerometerJerkMagnitudeSTD()"     
- "FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()"
- "FrequencyBodyGyroscopeMagnitudeMean()"            
- "FrequencyBodyGyroscopeMagnitudeSTD()"             
- "FrequencyBodyGyroscopeMagnitudeMeanFreq()"        
- "FrequencyBodyGyroscopeJerkMagnitudeMean()"        
- "FrequencyBodyGyroscopeJerkMagnitudeSTD()"         
- "FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()"

### The Data
The end result is a file named "secondtidyset.txt" and it should be in your working directory. The first row should contain the names of the variables (section above). 

### Transformations/Work
The training and test data files were read in, after being downloaded and unzipped. The feature and activity tables were read in as well. Column names were assigned respectively. The cbind and rbind functions were used to merge the training and test data, as it was asked for in the course project instructions. Going forward, methods were defined to take only the mean and standard deviation columns from the merged set. The activities were then renamed to be more readable for the human user. Finally, the second tidy set of data was formed. This is the data set that would then be used for data analysis. 