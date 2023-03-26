
.PHONY: all
all: 
	make data/raw data/modelling data/processed data/raw/switzerland.csv data/raw/cleveland.csv data/raw/va.csv data/raw/hungary.csv 
	make data/processed/heart_data.csv figures/boxplot.png data/modelling/training_split.csv data/modelling/testing_split.csv data/modelling/heart_data_subset.csv
	make data/modelling/forward_selection_data.csv figures/classifier_accuracies.png 
	make data/modelling/training_split_new.csv data/modelling/testing_data_new.csv  
	make data/modelling/majority_classifier.csv figures/majority_classifier_vis.png data/modelling/heart_data_accuracies.csv figures/classification_model_visualization.png 
	make data/heart_data_final_workflow.rds data/modelling/predict_data.csv figures/confusion_matrix.png

# make folders
data/raw data/modelling data/processed:
	mkdir data/raw
	mkdir data/modelling
	mkdir data/processed
	
# download raw data
data/raw/switzerland.csv data/raw/cleveland.csv data/raw/va.csv data/raw/hungary.csv:	
	Rscript R/01-loading.R 

# process raw data
data/processed/heart_data.csv: data/raw/switzerland.csv data/raw/cleveland.csv data/raw/va.csv data/raw/hungary.csv
	Rscript R/02-build_heart_data.R 

# build visualizaton based on heart data
figures/boxplot.png: data/processed/heart_data.csv
	Rscript R/02.1-initial_visualization.R 

# split training and testing data

data/modelling/training_split.csv data/modelling/testing_split.csv: data/processed/heart_data.csv
	Rscript R/03-data_splitting.R 

# create subset of training data
data/modelling/heart_data_subset.csv: data/modelling/training_split.csv
	Rscript R/04.0-subset_training_data.R 

# change subset of training data for forward selection
data/modelling/forward_selection_data.csv: data/modelling/heart_data_subset.csv
	Rscript R/04.1-forward_selection_data.R 

# build forward selection visualization
figures/classifier_accuracies.png: data/modelling/forward_selection_data.csv
	Rscript R/04.2-forward_selection_visualization.R 

# build new training and testing data based on previous
data/modelling/training_split_new.csv data/modelling/testing_data_new.csv: data/modelling/training_split.csv data/modelling/testing_split.csv
	Rscript R/05-data_tidying.R 

# create dataset for majority classifier based on new training data
data/modelling/majority_classifier.csv: data/modelling/training_split_new.csv
	Rscript R/06.0-majority_classifier_data.R 

# build major classifier visualization

figures/majority_classifier_vis.png: data/modelling/majority_classifier.csv data/modelling/training_split_new.csv
	Rscript R/06.1-majority_classifier_visualization.R 

# building classification model
data/modelling/heart_data_accuracies.csv: data/modelling/training_split_new.csv data/modelling/testing_data_new.csv
	Rscript R/07.0-build_classification_model.R 

# build classification model visualization
figures/classification_model_visualization.png: data/modelling/heart_data_accuracies.csv
	Rscript R/07.1-visualize_classification_model.R 

# build final workflow for classifier
data/heart_data_final_workflow.rds: data/modelling/heart_data_accuracies.csv data/modelling/training_split_new.csv
	Rscript R/07.2-heart_data_final_workflow.R 

# testing classifier with testing set
data/modelling/predict_data.csv: data/heart_data_final_workflow.rds data/modelling/testing_data_new.csv
	Rscript R/08.0-test_classifier.R 

# build visualization for confusion matrix
figures/confusion_matrix.png: data/modelling/predict_data.csv
	Rscript R/08.1-build_confusion_matrix.R 



# clean all data and figures
.PHONY: clean
clean:
	rm -rf data/modelling/
	rm -rf data/processed/
	rm -rf data/raw/
	rm -rf figures/
	rm -rf data/heart_data_final_workflow.rds

