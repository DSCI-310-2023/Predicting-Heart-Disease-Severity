# This script visualizes a confusion matrix
# takes in data from 08.0 script 

source('../R/confusion_matrix.R')

# builds the confusion matrix from the predict data 
conf_mat <- confuson_matrix('../data/modelling/predict_data.csv')

# saves the confusion matrix as a png into the figures folder
ggsave('../figures/confusion_matrix.png', conf_mat)