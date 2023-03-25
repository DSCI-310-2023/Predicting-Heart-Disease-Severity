# This script builds a table of the classifcation model

source('../R/classification_model.R')

heart_data_accuracies <- classifier(heart_training)

write_table(heart_data_accuracies, '../figures/classification_model.png')