# takes in the data generated from 06.0 script

# produces a png file of bar chart visualization
# will be saved to '../figures/major_classifier_visualization.png'

# uses function majority_classifier_vis_function in '../R/majority_classifier_function.R'
source('R/majority_classifier_function.R')

majority_classifier <- read_csv('data/modelling/majority_classifier.csv')

majority_classifier_vis <- majority_classifier_vis_function(majority_classifier)

ggsave("figures/majority_classifier_vis.png")
