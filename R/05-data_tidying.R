# takes in the data generated from 02 script

# produces 2 csv files inside data/modelling.
# both are updated versions of the training and testing data

# reading files created in 03 script
heart_training <- clean_csv('../data/modelling/training_split.csv')
heart_testing <- clean_csv('../data/modelling/testing_split.csv')

# Selecting chosen predictors within training and testing data
heart_training <- heart_training %>%
    select(rest_bp, age, max_heart_rate, diagnosis_f) %>%
    na.omit()
heart_training

# Adding training set to directory
write_csv(heart_training, '../data/modelling/training_split_new.csv')

heart_testing <- heart_testing %>%
    select(rest_bp, age, max_heart_rate, diagnosis_f) %>%
    na.omit()

# Adding testing set to directory
write_csv(heart_testing, '../data/modelling/testing_data_new.csv')