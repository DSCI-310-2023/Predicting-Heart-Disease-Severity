# This script build the final workflow for classifier
# takes in data from 07.0 script

# Pulls optimal k and builds a final workflow for classifier

# Pulling optimal K value based on above cross validation
set.seed(1)
best_k<-heart_data_accuracies%>%
  arrange(desc(mean))%>%
  slice(2)%>%
  pull(neighbors)
# best_k

# New classifier model using optimal K values
set.seed(1)
heart_data_spec_final<- nearest_neighbor(weight_func="rectangular", neighbors=best_k)%>%
  set_engine("kknn")%>%
  set_mode("classification")

# Final workflow for classifier using new model.
set.seed(1)
heart_data_final_fit<-workflow()%>%
  add_recipe(heart_data_recipe)%>%
  add_model(heart_data_spec_final)%>%
  fit(data=heart_training)

#heart_data_final_fit

# saves the workflow as an rds file to data folder
saveRDS(heart_data_final_fit, 'data/heart_data_final_workflow.rds')