FROM debian:stable

RUN apt-get update

RUN apt-get install r-base r-base-dev -y 

RUN R -e "install.packages(c('tidyverse', 'repr', 'tidymodels', 'cowplot', 'ggplot2', 'caret', 'e1071'))"
