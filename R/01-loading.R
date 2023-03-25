# This script is loading all libraries necessary for the report
# input is not necessary. All files are linked in this script
# output heart_data dataframe containing all wrangled data

# It will also produce a table sample of the data

library(tidyverse)
library(repr)
library(tidymodels)
library(cowplot)
library(ggplot2)
library(caret)
library(e1071)
options(repr.matrix.max.rows = 6)
set.seed(1)

# url for each of the 4 data sets.
url_switzerland <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.switzerland.data"
url_va <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.va.data"
url_cleveland <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.va.data"
url_hungarian <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.va.data"

# reading in data off the internet and minor cleaning with functions
source("../R/place_data.R")

# running the function that reads off the internet:
# this also saves all the raw data into the directory
web_data('switzerland', url_switzerland)
web_data('va', url_va)
web_data('cleveland', url_cleveland)
web_data('hungary', url_hungarian)

