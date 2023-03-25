# Sam Thorne
# 2023-03-10
# dsci-310 group 18 project
# contains function that reads the web url for the 
# 4 locations of interest
# script takes in nothing and produces 4 csv files containing each places heart disease data


library(tidyverse)
library(testthat)

#' Reads in heart data url
#' 
#' This function takes in the name of the place the heart data came from
#' and the url for the csv file online.
#' 
#' @param place a string of the name of the location. Place must be 'cleveland',
#'  'va', 'hungary', or 'switzerland'
#' @param url a string containing url of online data
#' 
#' @returns a csv file for the place within data/raw.
#' 
#' @examples
#' # web_data('switzerland',"https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.switzerland.data")
web_data <- function(place, url){
  col_names <- c('age', 'sex', 'chest_pain', 'rest_bp', 'cholestoral_mmHg', 'fasting_bs', 
                 'rest_ECG', 'max_heart_rate', 'exercise', 'ST_dep', 'slope', 'major_vessels', 'thal', 'diagnosis')
  data <- read_csv(url, col_names = col_names, show_col_types = FALSE) %>%
    na_if('?') %>%
    mutate(place = place) %>%
    select(-ST_dep, -slope) %>%
    select(place, everything())
  if (place == 'switzerland'){
    location = '../data/raw/switzerland.csv'
  }else if(place =='va'){
    location = '../data/raw/va.csv'
  }else if(place == 'cleveland'){
    location = '../data/raw/cleveland.csv'
  }else{
    location = '../data/raw/hungary.csv'
  }
  write_csv(data, location)
}
