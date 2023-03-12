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
#' confusion_matrix(predicted, actual)
#' confusion_matrix(c(1, 0, 0, 1, 1, 1, 0, 0, 0, 1), c(1, 0, 1, 0, 1, 1, 1, 0, 0, 1))
#' 
confusion_matrix <- function(expected_value, predicted_value, labels = NULL) {
  if (!is.null(labels)) {
    expected_value <- factor(expected_value, levels = labels)
    predicted_value <- factor(predicted_value, levels = labels) 
  }
  
  cm <- table(expected_value, predicted_value)
  
  cm_df <- melt(cm)
  
  ggplot(data=cm_df, aes(x=expected_value, y=predicted_value, fill=value)) +
    geom_tile(color="white") +
    geom_text(aes(label=value), color="white") +
    theme_minimal() +
    theme(axis.text.x=element_text(angle=45, hjust=1)) +
    labs(x="Actual", y="Predicted", title="Confusion Matrix")
}


