library(testthat)
library(tidyverse)

source("../R/majority_classifier_function.R")
test_that("X-axis label is not the same!", {
          majority_classifier <- read_csv('../data/modelling/majority_classifier.csv')
          plot <- majority_classifier_vis_function(majority_classifier)
          expect_identical(plot$labels$x, 'Heart disease degree of severity')})
test_that("Y-axis label is not the same!", {
          majority_classifier <- read_csv('../data/modelling/majority_classifier.csv')
          plot <- majority_classifier_vis_function(majority_classifier)
          expect_identical(plot$labels$y, 'Percent of outcomes \n in training dataset')})

# source("../R/selection_forward_function.R")
# heart_data_subset <- read_csv('../data/modelling/forward_selection_subset.csv') %>%
#     mutate(diagnosis_f = as.factor(diagnosis_f))
# plot <- forwardSelection(heart_data_subset)
# test_that("The number of variables is not the same!", {
#           expect_equivalent(max(plot$size), 5)})
# test_that("The results are not the same!", {
#           expect_equal(min(plot$accuracy), 0.426789675597178, tolerance = 0.05)})

source("../R/place_data.R")
# test that there are the right number of columns
test_that("The number of columns for Switzerland is not the same!", {
    expect_equal(ncol(web_data('switzerland', url_switzerland)), 13)})
test_that("The number of columns for cleveland is not the same!", {
    expect_equal(ncol(web_data('cleveland', url_cleveland)), 13)})

# test that there are 200 rows
test_that("The number of rows in va are not the same!", {
    expect_equal(nrow(web_data('va', url_va)), 200)})
test_that("The number of rows in hungary are not the same!", {
    expect_equal(nrow(web_data('hungary', url_hungarian)), 200)})

# making sure columns are of the correct type
test_that("Age is not numeric!", {
    expect_equal(is.numeric(web_data('switzerland', url_switzerland)$age), TRUE)})

source("../R/joining_data.R")
# testing that the function creates something that matches the full written data.
full_data <- read_csv('../data/processed/heart_data.csv') %>%
        mutate(sex_f = as.factor(sex_f), chest_pain_f = as.factor(chest_pain_f),
        fasting_bs_f = as.factor(fasting_bs_f), rest_ECG_f = as.factor(rest_ECG_f),
        exercise_f = as.factor(exercise_f), major_vessels_f = as.factor(major_vessels_f),
        thal_f = as.factor(thal_f), diagnosis_f = as.factor(diagnosis_f))
test_that("Full heart data set does not match!", {
    expect_equivalent(join_csv(), full_data)})
test_that("Full heart data set does not have the right number of rows", {
    expect_equal(ncol(join_csv()), 21)})

# source("../R/boxplots.R")
# boxplot <- grid_boxplots(read_csv('../data/processed/heart_data.csv'))

source("../R/classification_model.R")
# Test that there are 7 columns and 21 rows
heart_training <- read.csv('../data/modelling/training-split.csv') %>%
    mutate(diagnosis_f = as.factor(diagnosis_f))
test_that("Classifier data has different number of columns!", {
    expect_equal(ncol(classifier(heart_training)), 7)})
test_that("Classifier data has a different number of rows!", {
    expect_equal(nrow(classifier(heart_training)), 21)})

source("../R/model_visualization.R")
accuracy_data <- read_csv('../data/modelling/heart_data_accuracies.csv')
test_that("Y axis is not what we expected", {
    expect_equivalent(knn_visualization(accuracy_data)$labels$y, "Accuracy Estimate")})
test_that("X axis is not what we expected", {
    expect_equivalent(knn_visualization(accuracy_data)$labels$x, "Neighbors")
})

# Test that the estimate of our classifier is correct
source("../R/confusion_matrix.R")
heart_data_predict <- read_csv('../data/modelling/predict_data.csv') %>%
    mutate(diagnosis_f = as.factor(diagnosis_f), .pred_class = as.factor(.pred_class))
test_that("Y axis of confusion matrix does not match", {
    expect_equivalent(confusion_matrix(heart_data_predict)$labels$y, "Prediction of diagnosis")})
test_that("X axis of confusion matrix does not match", {
    expect_equivalent(confusion_matrix(heart_data_predict)$labels$x, "Actual diagnosis")})
