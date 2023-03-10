# Sam Thorne
# 2023-03-10
# dsci-310 group 18 project
# contains function that reads the web url for the 
# 4 locations of interest
# script takes in nothing and produces 4 csv files containing each places heart disease data


library(tidyverse)
library(testthat)

# url for each of the 4 data sets.
url_switzerland <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.switzerland.data"
url_va <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.va.data"
url_cleveland <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.va.data"
url_hungarian <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.va.data"


#' Reads in heart data url
#' 
#' This function takes in the name of the place the heart data came from
#' and the url for the csv file online.
#' 
#' @param place a string of the name of the location. Place must be 'cleveland',
#'  'va', 'hungary', or 'switzerland'
#' @param url a string containing url of online data
#' 
#' @returns a csv file for the place within data/processed.
#'  Columns as factors: sex_f, chest_pain_f, fasting_bs_f, rest_ECG_f, 
#'  exercise_f, major_vessels_f, thal_f, diagnosis_f
#'  Columns as numbers: sex, chest_pain, fasting_bs rest_ECG, max_heart_rate, 
#'  cholestoral_mmHg, exercise, major_vessels, thal, diagnosis, rest_bp
#' 
#' @examples 
#' # web_data('switzerland',"https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.switzerland.data")
web_data <- function(place, url){
  col_names <- c('age', 'sex', 'chest_pain', 'rest_bp', 'cholestoral_mmHg', 'fasting_bs', 
                 'rest_ECG', 'max_heart_rate', 'exercise', 'ST_dep', 'slope', 'major_vessels', 'thal', 'diagnosis')
  data <- read_csv(url, col_names = col_names, show_col_types = FALSE) %>%
    na_if('?') %>%
    mutate(place = place) %>%
    mutate(sex_f = as.factor(sex), chest_pain_f = as.factor(chest_pain), fasting_bs_f = as.factor(fasting_bs),
           rest_ECG_f = as.factor(rest_ECG), 
           exercise_f = as.factor(exercise), major_vessels_f = as.factor(major_vessels), 
           thal_f = as.factor(thal), diagnosis_f = as.factor(diagnosis)) %>%
    mutate(sex = as.numeric(sex), chest_pain = as.numeric(chest_pain), fasting_bs = as.numeric(fasting_bs),
           rest_ECG = as.numeric(rest_ECG), max_heart_rate = as.numeric(max_heart_rate), cholestoral_mmHg = as.numeric(cholestoral_mmHg),
           exercise = as.numeric(exercise), major_vessels = as.numeric(major_vessels), 
           thal = as.numeric(thal), diagnosis = as.numeric(diagnosis), rest_bp = as.numeric(rest_bp)) %>%
    select(-ST_dep, -slope) %>%
    select(place, everything())
  if (place == 'switzerland'){
    location = '../data/processed/wrangled_switzerland.csv'
  }else if(place =='va'){
    location = '../data/processed/wrangled_va.csv'
  }else if(place == 'cleveland'){
    location = '../data/processed/wrangled_cleveland.csv'
  }else{
    location = '../data/processed/wrangled_hungary.csv'
  }
  write_csv(data, location)
}

# running the function:
web_data('switzerland', url_switzerland)
web_data('va', url_va)
web_data('cleveland', url_cleveland)
web_data('hungary', url_hungarian)



