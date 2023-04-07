FROM continuumio/miniconda3

RUN apt-get update && \
    apt-get install -y r-base
    
RUN conda install -y --quiet \
    jupyter \
    jupyterlab=3.5 \
    r-base=4.2.2 \
    r-irkernel \
    r-cowplot=1.1.1 \
    r-tidymodels=0.1.4 \
    r-tidyverse=1.3.1 \
    r-repr=1.1.4 \
    r-ggplot2=3.3.6 \
    r-caret=6.0_93 \
    r-e1071=1.7_11 \
    r-testthat=3.1.6 

RUN pip install jupyterlab-git

RUN conda init bash

RUN echo "conda activate dsci310-gorup18" > ~/.bashrc

WORKDIR /home/joyvan/dsci-310-group-18
