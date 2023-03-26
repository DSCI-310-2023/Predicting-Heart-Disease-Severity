# this script takes in the file generated in 01-loading

# it produces a csv file as 'data/processes/heart_data.csv'

# sourcing the function that cleans the raw place data
source("R/joining_data.R")

# joining all different place data into one mass csv
heart_data <- bind_rows(clean_csv('data/raw/switzerland.csv'),
                        clean_csv('data/raw/va.csv'),
                        clean_csv('data/raw/cleveland.csv'),
                        clean_csv('data/raw/hungary.csv')) %>%
    slice(-157, -357, -557)

write_csv(heart_data, 'data/processed/heart_data.csv')
