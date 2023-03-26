
.PHONY: all
all: data/raw/switzerland.csv data/raw/cleveland.csv data/raw/va.csv data/raw/hungary.csv data/processed/heart_data.csv figures/boxplot.png data/modelling/training_split.csv data/modelling/testing_split.csv data/modelling/heart_data_subset.csv data/modelling/forward_selection_data.csv figures/classifier_accuracies.png data/modelling/training-split_new.csv data/modelling/testing-data_new.csv data/modelling/majority_classifier.csv figures/majority_classifier_vis.png data/modelling/training_split_new.csv figures/classification_model_visualization.png data/heart_data_final_workflow.rds data/modelling/predict_data.csv figures/confusion_matrix.png

# change directory
.PHONY: change_dir
change_dir:
	cd notebooks

# download raw data
data/raw/switzerland.csv data/raw/cleveland.csv data/raw/va.csv data/raw/hungary.csv: R/01-loading.R	
	Rscript R/01-loading.R --out_dir="data/raw/"

# process raw data
data/processed/heart_data.csv: R/02-build_heart_data.R
	Rscript R/02-build_heart_data.R --input_dir="data/raw/" --out_dir="data/processed/"

# build visualizaton based on heart data
figures/boxplot.png: R/02.1-intial_visualization.R
	Rscript R/02.1-intial_visualization.R --input_path="data/processed/heart_data.csv" --out_dir="figures/boxplot.png"

# split training and testing data

data/modelling/training_split.csv data/modelling/testing_split.csv: R/03-data_splitting.R

	Rscript R/03-data_splitting.R --input_dir="data/processed/heart_data.csv" --out_dir="data/modelling/"

# create subset of training data
data/modelling/heart_data_subset.csv: R/04.0-subset_training_data.R
	Rscript R/04.0-subset_training_data.R --input_dir="data/modelling/training_split.csv" --out_dir="data/modelling/heart_data_subset.csv"

# change subset of training data for forward selection
data/modelling/forward_selection_data.csv: R/04.1-forward_selection_data.R
	Rscript R/04.1-forward_selection_data.R --input_dir="data/modelling/heart_data_subset.csv" --out_dir="data/modelling/forward_selection_data.csv"

# build forward selection visualization
figures/classifier_accuracies.png: R/04.2-forward_selection_visualization.R
	Rscript R/04.2-forward_selection_visualization.R --input_path="data/modelling/forward_selection_data.csv" --out_dir="figures/classifier_accuracies.png"

# build new training and testing data based on previous
data/modelling/training-split_new.csv data/modelling/testing-data_new.csv: R/05-data_tidying.R
	Rscript R/05-data_tidying.R --input_dir="data/modelling/" --out_dir="data/modelling/"

# create dataset for majority classifier based on new training data
data/modelling/majority_classifier.csv: R/06.0-majority_classifier.R
	Rscript R/06.0-majority_classifier.R --input_dir="data/modelling/training-split_new.csv" --out_dir="data/modelling/majority_classifier.csv" 

# build major classifier visualization

figures/majority_classifier_vis.png: R/06.1-major_classifier_visualization.R
	Rscript R/06.1-major_classifier_visualization.R --input_path="R/majority_classifier_function.R" --out_dir="figures/majority_classifier_vis.png"

# building classification model
data/modelling/training_split_new.csv: R/07.0-build_classification_model.R
	Rscript R/07.0-build_classification_model.R --input_dir="data/modelling/training_split_new.csv" --out_dir="data/modelling/heart_data_accuracies.csv"

# build classification model visualization
figures/classification_model_visualization.png: R/07.1-visualize_classification_model.R
	Rscript R/07.1-visualize_classification_model.R --input_path="data/modelling/heart_data_accuracies.csv" --out_path="figures/classification_model_visualization.png"

# build final workflow for classifier
data/heart_data_final_workflow.rds: R/07.2-heart_data_final_workflow.R
	Rscript R/07.2-heart_data_final_workflow.R --out_path="data/heart_data_final_workflow.rds"

# testing classifier with testing set
data/modelling/predict_data.csv: R/08.0-test_classifier.R
	Rscript R/08.0-test_classifier.R --input_dir="data/heart_data_final_workflow.rds" --out_dir="data/modelling/predict_data.csv"

# build visualization for confusion matrix
figures/confusion_matrix.png: R/08.1-build_confusion_matrix.R
	Rscript R/08.1-build_confusion_matrix.R --input_path="data/modelling/predict_data.csv" --out_path="figures/confusion_matrix.png"



# clean all data and figures
.PHONY: clean
clean:
	rm -rf data/modelling/
	rm -rf data/processed/
	rm -rf data/raw/
	rm -rf figures/

	rm -rf data/heart_data_final_workflow.rds

