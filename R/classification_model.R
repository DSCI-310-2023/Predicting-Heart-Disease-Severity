library(caret)
library(tidyverse)
set.seed(1)
#' K visualization 
#' 
#' @param data a dataset used to be plot accuracy versus K
#' 
#' @return a line graph with the accuracy estimates versus the number of neighbors
#' 
#' @examples 
#' classifier(heart_training)
classifier <- function(data) {
  recipe <- recipe(diagnosis_f ~ ., data) %>%
      step_scale(all_predictors()) %>%
      step_center(all_predictors())
  
  spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
      set_engine("kknn") %>%
      set_mode("classification")
  
  vfold <- vfold_cv(data, v = 5, strata = diagnosis_f)
  
  gridvals <- tibble(neighbors = seq(from = 1, to = 21))
  
  results <- workflow() %>%
      add_recipe(recipe) %>%
      add_model(spec) %>%
      tune_grid(resamples = vfold, grid = gridvals) %>%
      collect_metrics()
  accuracies <- results %>%
      filter(.metric == "accuracy")
  accuracies
  
  options(repr.plot.width = 14, repr.plot.height = 5)
  accuracy_versus_k <- ggplot(accuracies, aes(x = neighbors, y = mean)) +
    geom_point() +
    geom_line() +
    labs(x = "Neighbors", y = "Accuracy Estimate") +
    ggtitle("Plot of estimated accuracy versus the number of neighbors") +
    theme(text = element_text(size = 22)) +
    ylim(0.2, 0.8) +
    scale_x_continuous(breaks = 1:21)
  accuracy_versus_k
  
  best_k <- accuracies %>%
    arrange(desc(mean)) %>%
    slice(2) %>%
    pull(neighbors)
  data_spec_final <- nearest_neighbor(weight_func = "rectangular", neighbors = best_k) %>%
    set_engine("kknn") %>%
    set_mode("classification")
  data_final_fit <- workflow() %>%
    add_recipe(recipe) %>%
    add_model(data_spec_final) %>%
    fit(data)
}
