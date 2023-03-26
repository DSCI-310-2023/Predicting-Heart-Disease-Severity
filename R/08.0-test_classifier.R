# This script tests our classifier using the testing set
# takes in data from 07.2 script (rds file)

set.seed(1)

# reads the final heart data workflow saved in the data folder 
heart_data_final_fit <- readRDS('data/heart_data_final_workflow.rds')

# Testing our classifier using the testing set
heart_data_summary<-heart_data_final_fit%>%
  predict(heart_testing)%>%
  bind_cols(heart_testing)%>%
  metrics(truth=diagnosis_f, estimate=.pred_class)%>%
  filter(.metric == 'accuracy')
heart_data_summary

heart_data_predict <- heart_data_final_fit %>%
  predict(heart_testing) %>%
  bind_cols(heart_testing)

# writes the predict data into the data folder
write_csv(heart_data_predict, 'data/modelling/predict_data.csv')