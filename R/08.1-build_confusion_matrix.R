# This script visualizes a confusion matrix
# takes in data from 08.0 script 

source('../R/confusion_matrix.R')

# reading data generated from script 08.0
prediction_data <- read_csv('../data/modelling/predict_data.csv') %>%
    mutate(diagnosis_f = as.factor(diagnosis_f),
    .pred_class = as.factor(.pred_class))

# builds the confusion matrix from the predict data 
conf_mat <- confusion_matrix(prediction_data)

# saves the confusion matrix as a png into the figures folder
ggsave('../figures/confusion_matrix.png', conf_mat)