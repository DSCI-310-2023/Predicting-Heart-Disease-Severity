# This script visualizes a confusion matrix

source('../R/confusion_matrix.R')

confuson_matrix('../data/modelling/predict_data.csv')

ggsave('../R/confusion_matrix.png', confusion_matrix)