library(testthat)

source("../R/majority_classifier_function.R")
test_that("X-axis label is not the same!", {
          plot <- majority_classifier_vis_function(majority_classifier)
          expect_identical(plot$labels$x, 'Heart disease degree of severity')})
test_that("Y-axis label is not the same!", {
          plot <- majority_classifier_vis_function(majority_classifier)
          expect_identical(plot$labels$y, 'Percent of outcomes \n in training dataset')})

source("../R/selection_forward_function.R")
plot <- forwardSelection(heart_training)
test_that("The number of variables is not the same!", {
          expect_equivalent(max(plot$size), 5)})
test_that("The results are not the same!", {
          expect_equivalent(min(plot$accuracy), 0.426789675597178)})

source("../R/place_data.R")
# test that there are the right number of columns
testthat::expect_equal(ncol(web_data('switzerland', url_switzerland)), 21)
testthat::expect_equal(ncol(web_data('cleveland', url_cleveland)), 21)

# test that there are 200 rows
testthat::expect_equal(nrow(web_data('va', url_va)), 200)
testthat:: expect_equal(nrow(web_data('hungary', url_hungarian)), 200)

# making sure columns are of the correct type
testthat::expect_equal(is.numeric(web_data('switzerland', url_switzerland)$age), TRUE)
testthat::expect_equal(is.factor(web_data('va', url_va)$major_vessels_f), TRUE)
