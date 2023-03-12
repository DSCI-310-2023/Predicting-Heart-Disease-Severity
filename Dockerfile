FROM jupyter/r-notebook:latest

WORKDIR /home/joyvan/dsci-310-group-18

COPY environment.yml .
RUN conda env create --file environment.yml

RUN conda init bash

RUN echo "conda activate dsci310-group18" > ~/.bashrc

USER root

