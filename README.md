### dsci-310-group-18

# Evaluating accuracy of predetermined variables to predict severity of heart disease in patients.
---

### Authors: Daniel Lee, Eric Leung, Sam Thorne

**Adapted from analysis competed by: Emerson, Crick, Allie, Janowcz, Ziva Subelji and Sam Thorne**

Permission to adapt DSCI100 analysis for the purposes of DSCI310 can be see [here](PERMISSIONS/analysis-permission.jpeg)

## About
---

We built a kNN classification model to determine if age, maximum heart rate, and resting blood pressure are good at predicting the severity of heart disease in a patient. We found that together these variables generate a high accuracy classification model of the severity of heart disease in patients (0 being least severe and 4 being most severe). This model could potentially aid in medical diagnosies for patients with heart conditions based on factors that are easy to measure. The information this model provides can be used as a precaution to spread public awareness of heart disease risk based on your age, blood pressure and heart rate. This model should not be used to diagnose individuals directly but used as a tool to assess the possibility that the patient is or will experience heart disease. 

The data we used to build our model comes from the processed versions of data for Cleveland, Hungary, Switzerland and VA Long Beach patient information from 1988. All these data sets can be found [here](https://archive.ics.uci.edu/ml/datasets/Heart+Disease)

## Report

---

The full report can be found [here](analysis.ipynb)

## Usage

---

A Docker container has been created to make this computation reproducible. 

**For those that wish to reproduce the analysis without collaborating or editing the project:**
1. Clone this GitHub repository onto your local computer.
2. Make sure the terminal is in the root of this project you just cloned.
3. Run the following:

```
docker run --rm -p 8888:8888 \
    -v /$(pwd):/home/joyvan/dsci-310-group-18 \
    leuneri/dsci-310-group-18:latest
    jupyter nbconvert --to notebook --execute dsci-310-group-18/analysis.ipynb
```

**For those that wish to edit and interactively run the analysis:**
1. Clone this GitHub repository onto your local computer. 
2. Navigate to the root of the project directory.
3. Run the following:
```
docker run --rm -p 8888:8888 \
    -v /$(pwd):/home/joyvan/dsci-310-group-18 \
    leuneri/dsci-310-group-18:latest
```
4. Copy the URL that will come up that looks something like `http://127.0.0.1:8888/lab?token=2faf555049c37dd3980e06c182f614223f93b57cac264491` into your web browser. This will open Jupyter Lab in the root directory of this analysis. 
5. Nagivate to `analysis.ipynb` in Jupyter lab and run the entire analysis. By navigating to `Kernel` and clicking `Restart Kernal and Run All Cells`. 
6. Work within the container as you need and edit the analysis!

*To stop and remove the container when done collaborating run:* `docker-compose down`. 

## Dependencies:
---
R version 4.2.1. 

Additionally, Jupyter version listed in [`environment.yml`](environment.yml)

## License Information

This project and it's assets are licensed under a [CC-BY license](https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode).

All code of this project is licensed under the [MIT License](https://opensource.org/license/mit/).

Complete license file can be found [here](LICENSE.md)
