library(testthat)
test_that("X-axis label is not the same!", {
          plot <- majority_classifier_vis_function(majority_classifier)
          expect_identical(plot$labels$x, 'Heart disease degree of severity')})
test_that("Y-axis label is not the same!", {
          plot <- majority_classifier_vis_function(majority_classifier)
          expect_identical(plot$labels$y, 'Percent of outcomes \n in training dataset')})


plot <- forwardSelection(heart_training)
test_that("The number of variables is not the same!", {
          expect_equivalent(max(plot$size), 5)})
test_that("The results are not the same!", {
          expect_equivalent(min(plot$accuracy), 0.426789675597178)})