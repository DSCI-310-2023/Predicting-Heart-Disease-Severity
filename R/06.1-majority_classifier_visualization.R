library(group18package)
# takes in the data generated from 06.0 script

# produces a png file of bar chart visualization
# will be saved to '../figures/major_classifier_visualization.png'

# uses function majority_classifier_vis_function in '../R/majority_classifier_function.R'
source('R/majority_classifier_function.R')
library(tidyverse)
library(ggplot2)

majority_classifier <- read_csv('data/modelling/majority_classifier.csv') %>%
    mutate(diagnosis_f = as.factor(diagnosis_f))

majority_classifier_vis_function(majority_classifier)

ggsave("figures/majority_classifier_vis.png")
