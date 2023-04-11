FROM jupyter/r-notebook:notebook-6.5.3

WORKDIR /home/jovyan/dsci-310-group-18

# copies all files in repo into the container.
COPY . /home/jovyan/dsci-310-group-18/

# reads in the environment file
RUN conda env create --file environment.yml

# adds additional packages not in the environment file.
RUN conda install -c conda-forge \
    'r-cowplot=1.1*' \
    'r-repr=1.1*' \
    'r-ggplot2=3.3*' \
    'r-testthat=3.1*' \
    'r-kknn'

# installs jupyter book and make
RUN conda install -c conda-forge jupyter-book  
RUN conda install make   

# adding our personal package
RUN Rscript -e "devtools::install_github('DSCI-310/dsci-310-group-18-pkg')"

RUN echo "conda activate dsci310-group18" > ~/.bashrc
