library(caret)
library(tidyverse)
set.seed(1)
#' K visualization 
#' 
#' @param data a dataset used to be plot accuracy versus K
#' @param split is the number of diagnosis
#' @param gridFrom is the gridvals value
#' @param gridTo is the gridvals value
#' @param wGraph is the width of the Confusion matrix
#' @param hGraph is the height of the Confusion matrix
#' @param xLab is the label for x axis
#' @param yLab is the label for y axis
#' @param textSize is size of text
#' @param titleLab is the title for the matrix
#' @param lowLimit is the min value label of the graph
#' @param highLimit is the max value label of the graph
#' 
#' @return a line graph with the accuracy estimates versus the number of neighbors
#' 
#' @examples 
#' classifier(heart_training, 5, 1, 21, 14, 5, "Neighbors", "Accuracy Estimate", "Plot of estimated accuracy versus the number of neighbors", 22, 0.2, 0.8)
classifier <- function(data, split, gridFrom, gridTo, wGraph, hGraph, xLab, yLab, textSize, titleLab, lowLimit, highLimit) {
  set.seed(1)
  
  recipe <- recipe(diagnosis_f ~ ., data) %>%
      step_scale(all_predictors()) %>%
      step_center(all_predictors())
  
  spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
      set_engine("kknn") %>%
      set_mode("classification")
  
  vfold <- vfold_cv(data, v = split, strata = diagnosis_f)
  
  gridvals <- tibble(neighbors = seq(from = gridFrom, to = gridTo))
  
  results <- workflow() %>%
      add_recipe(recipe) %>%
      add_model(spec) %>%
      tune_grid(resamples = vfold, grid = gridvals) %>%
      collect_metrics()
  accuracies <- results %>%
      filter(.metric == "accuracy")
  accuracies
  
  options(repr.plot.width = wGraph, repr.plot.height = hGraph)
  accuracy_versus_k <- ggplot(accuracies, aes(x = neighbors, y = mean)) +
    geom_point() +
    geom_line() +
    labs(x = xLab, y = yLab) +
    ggtitle(titleLab) +
    theme(text = element_text(size = textSize)) +
    ylim(lowLimit, highLimit) +
    scale_x_continuous(breaks = gridFrom:gridTo)
  accuracy_versus_k
}
