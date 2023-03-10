# Sam Thorne
# 2023-03-10 
# DSCI310 group 18 project

library(tidyverse)
library(ggplot2)

# this script contains a function that builds 3 box plots
# and displays them in a grid for initial visualizations
# of the data. 

#' Boxplot Visualizations
#' 
#' Make 3 boxplots, one for age, resting blood pressure
#' and max heart rate in regards to heart disease diagnosis
#' 
#' @param heart_data this is a dataframe with 14 columns and every place
#'  this data frame is the output of joining_data.R
#'
#'@returns A grid containing 3 boxplots, and saves this grid to figures.
#'
#'@examples
#'# grid_boxplots(heart_data)
grid_boxplots <- function(heart_data){
  boxplot_age <- ggplot(heart_data, aes(x=diagnosis_f, y=age)) +  
    geom_boxplot(color="#033291", fill="#b0c8f7", alpha=0.2) +
    labs(x="Degree of heart disease", y="Age (years)") +
    ggtitle("A. Boxplot of degree of heart \n disease in relation to patient's \nage") +
    theme(text = element_text(size = 24))
  boxplot_rest_bp <- ggplot(heart_data, aes(x=diagnosis_f, y=rest_bp)) + 
    geom_boxplot(color="#033291", fill="#b0c8f7", alpha=0.2) +
    labs(x="Degree of heart disease", y="Resting blood pressure (mmHg)") +
    ggtitle("B. Boxplot of degree of heart \ndisease in relation to patient's \nresting blood pressure") +
    theme(text = element_text(size = 24))
  boxplot_max_heart_rate <- ggplot(heart_data, aes(x=diagnosis_f, y=max_heart_rate)) + 
    geom_boxplot(color="#033291", fill="#b0c8f7", alpha=0.2) +
    labs(x="Degree of heart disease", y="Maximum heart rate (BPM)") +
    ggtitle("C. Boxplot of degree of heart \ndisease in relation to patient's \nmaximum heart rate") +
    theme(text = element_text(size = 24))
  
  options(repr.plot.width = 20, repr.plot.height = 10)
  boxplots <- plot_grid(boxplot_age, boxplot_rest_bp, boxplot_max_heart_rate, ncol=3)
  show(boxplots)
  ggsave("../figures/boxplot.png")
}
