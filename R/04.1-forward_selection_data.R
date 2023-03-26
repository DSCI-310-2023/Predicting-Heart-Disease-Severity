# takes in the data generated from 04.0 script

# produces forward selection results as csv file
# will be saved inside data/modelling

source('../R/selection_forward_function.R')

# reading file created in 04
heart_data_subset <- read_csv('../data/modelling/heart_data_subset.csv') %>%
    mutate(diagnosis_f = as.factor(diagnosis_f))

# takes forwardSelection function and creates new table
accuracies <- forwardSelection(heart_data_subset)

# saving table to data/modelling
write_csv(accuracies, '../data/modelling/forward_selection_data.csv') 