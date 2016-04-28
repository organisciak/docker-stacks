FROM jupyter/datascience-notebook

MAINTAINER Peter Organisciak <organisciak@gmail.com>

USER root

RUN apt-get update -qq && \
    apt-get install -y \
	libfreetype6-dev \
	libpng12-dev \
	libx11-dev

USER jovyan

RUN pip install \
	htrc-feature-reader \
	nltk \
	Pillow==2.9.0 \
	https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp34-cp34m-linux_x86_64.whl

# TensorBoard and Jupyter ports
EXPOSE 6006
EXPOSE 8888

WORKDIR "/notebooks"
