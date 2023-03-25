# takes in the data generated from 04.0 script

# produces forward selection results as csv file
# will be saved inside data/modelling

source('../R/selection_forward_function.R')

# reading file created in 04
heart_data_subset <- clean_csv('../data/modelling/heart_data_subset.csv')

# takes forwardSelection function and creates new table
accuracies <- forwardSelection(heart_data_subset)

# saving table to data/modelling
write_csv(forward_selection_data, '../data/modelling/forward_selection_data.csv') 