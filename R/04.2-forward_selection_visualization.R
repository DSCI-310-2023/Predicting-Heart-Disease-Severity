# takes in the data generated from 04.1 script

# produces a png file of line chart visualization
# will be saved to '../figures/forward_visualization.png'

# reading file created in 04.1
accuracies <- read_csv('data/modelling/forward_selection_data.csv')

# visualization of number of predictors and accuracy based on forward selection
options(repr.plot.width = 7, repr.plot.height = 7)
forward_visualization <- ggplot(accuracies, aes(x = size, y = accuracy)) +
    geom_line() +
    geom_point() +
    labs(x = 'Number of predictors used',
         y = 'Estimated accuracy using forward selection',
         title = 'Number of different predictors compared \nto the accuracy of classifier model') +
    theme(text = element_text(size = 20)) +
    ylim(c(0,1))

ggsave("figures/classifier_accuracies.png")