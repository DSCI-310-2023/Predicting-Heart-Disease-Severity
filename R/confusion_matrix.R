library(caret)
library(ggplot2)
library(reshape2)
#' Testing accuracy of model
#' 
#' @param data is the predicted data of our classifier
#' @param hGraph is the height of the Confusion matrix
#' @param wGraph is the width of the Confusion matrix
#' @param textSize is size of text
#' @param yLab is the label for y axis
#' @param xLab is the label for x axis
#' @param titleLab is the title for the matrix
#' 
#' @return a Confusion Matrix with the accuracies based on variables of the model 
#' 
#' @examples 
#' confusion_matrix(data_predict, 7, 7, 20, "Prediction of diagnosis", "actual Diagnosis", "Confusion Matrix Plot: \nNumber of diagnosis that are correct \nand incorrect")
#' 
confusion_matrix <- function(data, hGraph, wGraph, textSize, yLab, xLab, titleLab) {
  confusion_matrix <- data %>%
      conf_mat(truth = diagnosis_f, estimate = .pred_class)
  confusion_matrix
  
  options(repr.plot.height = hGraph, repr.plot.width = wGraph)
  confusion_vis <- autoplot(confusion_matrix, type = "heatmap") +
    theme(text = element_size(size = textSize)) +
    labs(y = yLab,
         x = xlab,
         title = titleLab) +
    scale_fill_gradient(low = '#cce3ff', high = '#177fff')
  confusion_vis
}


