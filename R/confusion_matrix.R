library(caret)
library(ggplot2)
library(reshape2)
#' Testing accuracy of model
#' 
#' @param data a dataset to 
#' @param expected_value is the actual of the diagnosis
#' @param predicted_value is the prediction of the diagnosis
#' 
#' @return a Confusion Matrix with the accuracies based on variables of the model 
#' 
#' @examples 
#' confusion_matrix(heart_data_final_fit, heart_testing)
#' 
confusion_matrix <- function(data, test_data) {
  data_summary <- data %>%
    predict(test_data) %>%
    bind_cols(test_data) %>%
    metrics(truth = diagnosis_f, estimate = .pred_class) %>%
    filter(.metric == "accuracy")
  data_summary
  
  data_predict <- data %>%
    predict(test_data) %>%
    bind_cols(test_data)
  
  confusion_matrix <- data_predict %>%
      conf_mat(truth = diagnosis_f, estimate = .pred_class)
  confusion_matrix
  
  options(repr.plot.height = 7, repr.plot.width = 7)
  confusion_vis <- autoplot(confusion_matrix, type = "heatmap") +
    theme(text = element_size(size = 22)) +
    labs(y = "Prediction of diagnosis",
         x = "actual Diagnosis",
         title = "Confusion Matrix Plot: \nNumber of diagnosis that are correct \nand incorrect") +
    scale_fill_gradient(low = '#cce3ff', high = '#177fff')
}


