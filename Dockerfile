FROM jupyter/r-notebook:notebook-6.5.3

# R packages:
RUN conda install -c conda-forge \
    'r-cowplot=1.1*' \
    'r-repr=1.1*' \
    'r-ggplot2=3.3*' \
    'r-testthat=3.1*'

RUN conda remove --force 'r-dplyr'

RUN conda install -c conda-forge \
    'r-dplyr=1.0*'

RUN conda install -c conda-forge jupyter-book  
RUN conda install make   


RUN echo "conda activate dsci310-group18" > ~/.bashrc

WORKDIR /home/jovyan/dsci-310-group-18

# COPY . /home/jovyan/dsci-310-group-18/

COPY --chown=jovyan:jovyan . /home/jovyan/dsci-310-group-18/
