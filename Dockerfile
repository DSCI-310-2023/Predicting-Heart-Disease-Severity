FROM jupyter/r-notebook:latest

COPY environment.yml .
RUN conda env create --file environment.yml

RUN pip install jupyter

RUN conda init bash

RUN echo "conda activate dsci310-group18" > ~/.bashrc

USER root

WORKDIR /home/joyvan/dsci-310-group-18
