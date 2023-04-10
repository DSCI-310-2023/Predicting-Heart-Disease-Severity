### dsci-310-group-18
---

# Evaluating accuracy of predetermined variables to predict severity of heart disease in patients.

### Authors: Daniel Lee, Eric Leung, Sam Thorne

**Adapted from analysis competed by: Emerson, Crick, Allie, Janowcz, Ziva Subelji and Sam Thorne**

*Permission to adapt DSCI100 analysis for the purposes of DSCI310 can be see [here](PERMISSIONS/analysis-permission.jpeg)*.


## About
---

We built a $kNN$ classification model to determine if age, maximum heart rate, and resting blood pressure are good at predicting the severity of heart disease in a patient. We found that together these variables generate a high accuracy classification model of the severity of heart disease in patients (0 being least severe and 4 being most severe). 

This model could potentially aid in medical diagnosies for patients with heart conditions based on factors that are easy to measure. The information this model provides can be used as a precaution to spread public awareness of heart disease risk based on your age, blood pressure and heart rate. This model should not be used to diagnose individuals directly but used as a tool to assess the possibility that the patient is, or will experience heart disease. 

The data we used to build our model came from the processed versions of data for Cleveland, Hungary, Switzerland and VA Long Beach patient information from 1988. All these data sets can be found [here](https://archive.ics.uci.edu/ml/datasets/Heart+Disease).

## Report

---

The full report can be found [here](analysis.ipynb)

The full HTML report can be found [here](notebooks/_build/html/analysis.html)

# Usage

There are three ways to run the report on your local computer. You can use a dockerhub image, build the image locally or manually download the dependencies onto your local machine.

To follow instructions using the dokcerhub image or to build the image locally, you first need to download [Docker](https://www.docker.com/get-started/). Once you have done this you can follow the instructions below:

---
### Run Using DockerHub Image

1. Clone this GitHub repository onto your local computer using: `git clone <paste-HTTPS/SSH-here>` in your terminal.
2. Navigate to the root of this project directory using `cd dsci-310-group-18`.
3. Run the following: (*you might be prompted to login to docker to move on to the next step*)

```
docker pull leuneri/dsci-310-group-18:latest
```
4. This step should automatically open jupyter lab on your computer inside the project directory (*or prompt you to copy a link to open jupyter lab*). Our report can be found as an .ipynb inside `notebooks/` along with any code within the `R/` directory. To open jupyter run the following:
```
docker run -p 8888:8888 leuneri/dsci-310-group-18:latest
```

5. Navigate to the terminal within jupyter lab. 
6. Run the following within the jupyter terminal: 
```
make notebooks/_build/html/analysis.html
```
7. Copy the link generated inside your web browser and you will be able to view the full report as a .html file.

*If you wish to re-run the above steps run `make clean` in the jupyter terminal first to clear any files generated from the above steps.*

---

### Run by Building Docker Image Locally

1. Clone this GitHub repository onto your local computer using: `git clone <paste-HTTPS/SSH-here>` in your terminal.
2. Navigate to the root of this project directory using `cd dsci-310-group-18`.
3. Run the following: (*THIS STEP TAKES ~25 MINUTES TO RUN SO KEEP THIS IN MIND BEFORE COPYING INTO YOUR TERMINAL*)
```
docker build --tag dsci-310-group-18:latest .
```
4. Once that has loaded you can run (*This will open jupyter lab*):
```
docker run -p 8888:8888 dsci-310-group-18:latest
```

From there you can follow steps 5-7 of the [docker image instructions](#run-using-dockerhub-image).

### Run without Docker

1. Clone this GitHub repository onto your local computer using : `git clone <past-HTTPS/SSH-here>` into your terminal. 
2. Navigate to the root of this project directory using `cd dsci-310-group-18`.
3. Install all the dependencies and softwards listed [below](#dependencies)
4. Run the following in your terminal:
```
make notebooks/_build/html/analysis.html
```
5. Copy the link generated into your web browser to view the complete report.

## Dependencies:
---
**Software includes:**

R version 4.2.3, Jupyterlab 3.6.3, GNU Make 4.3 & JupyterBook 0.13.2

**R language packages include:**

|Package     |Version   |
| ---------- |:--------:|
|cowplot     |1.1.1     |
|tidymodels  |1.0.0     |
|tidyverse   |1.3.2     |
|repr        |1.1.6     |
|ggplot2     |3.3.6     |
|caret       |6.0.94    |
|e1071       |1.7.13    |
|testthat    |3.1.7     |
|kknn | 1.3.1|



## License Information

This project and it's assets are licensed under a [CC-BY license](https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode).

All code of this project is licensed under the [MIT License](https://opensource.org/license/mit/).

Complete license file can be found [here](LICENSE.md)
