# takes in the data generated from 05 script

# produces major classifier results as csv file
# will be saved inside data/modelling

# reading files created in 05 script
heart_training <- clean_csv('../data/modelling/training-split_new.csv')

set.seed(1)

# collecting number of rows in training set
total_rows<-nrow(heart_training)

# collecting number of columns in training set
number_of_columns<-heart_training%>%
    group_by(diagnosis_f)%>%
    summarize(number=n())%>%
    select(number)
    
# majority classifier data
majority_classifier<-heart_training%>%
    group_by(diagnosis_f)%>%   
    summarize(percent_outcomes=n()/total_rows*100)%>%
     arrange(desc(percent_outcomes))%>%
     bind_cols(number_of_columns)


# write csv to data/modelling
write_csv(majority_classifier, '../data/modelling/majority_classifier.csv')