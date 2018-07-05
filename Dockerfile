FROM jupyter/datascience-notebook:latest

MAINTAINER Peter Organisciak <organisciak@gmail.com>

USER root

RUN apt-get update -qq && \
    apt-get install -y \
	libfreetype6-dev \
	libpng12-dev \
	libx11-dev \
	libopenblas-dev \
	graphviz \
	parallel

## Alias parallel so it always mutes the notice within the container
RUN echo "alias parallel='parallel --no-notice'">>/root/bash_profile

USER jovyan

RUN conda install \
	ipyparallel \
	pytables \
	gensim \
	dask \
	nltk \
	theano \ 
	spacy

RUN pip install \
	htrc-feature-reader==1.94 \
	htrc \
	tqdm \
	graphviz \
	plotly \
	Pillow==2.9.0 \
	xxHash
	#https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp34-cp34m-linux_x86_64.whl


# Install Jupyterlab. This is in beta (Feb 18), so may be unnecessary in the future.
RUN conda install -c conda-forge jupyterlab

RUN python -m spacy download en

# TensorBoard and Jupyter ports
EXPOSE 6006
EXPOSE 8888

WORKDIR "/notebooks"
