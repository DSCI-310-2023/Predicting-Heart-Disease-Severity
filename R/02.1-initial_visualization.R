# takes in the data generated from 02 script

# produces a png file of boxplot visualization
# will be saved to '../figures/boxplot.png'

# uses function grid_boxplot in '../R/boxplots.R'
source('R/boxplots.R')

# file containing clean_csv function
source('R/joining_data.R')

heart_data <- clean_csv('data/processed/heart_data.csv')

boxplot_age <- grid_boxplot(heart_data, age, "Age (years)", "A. Boxplot of degree of heart \n disease in relation to patient's \nage")
boxplot_rest_bp <- grid_boxplot(heart_data, rest_bp, "Resting blood pressure (mmHg)", "B. Boxplot of degree of heart \ndisease in relation to patient's \nresting blood pressure")
boxplot_max_heart_rate <- grid_boxplot(heart_data, max_heart_rate, "Maximum heart rate (BPM)", "C. Boxplot of degree of heart \ndisease in relation to patient's \nmaximum heart rate")

options(repr.plot.width = 20, repr.plot.height = 10)
boxplots <- plot_grid(boxplot_age, boxplot_rest_bp, boxplot_max_heart_rate, ncol=3)

ggsave("figures/boxplot.png")
