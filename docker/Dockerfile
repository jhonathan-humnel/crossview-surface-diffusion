# CUDA 11.7 development image for Wonder3D
FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

LABEL name="Wonder3D" \
    lastupdate="2024-01-05"

RUN mkdir -p /workspace
WORKDIR /workspace

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update && \
    apt-get install -y git wget vim libgl1-mesa-glx libglib2.0-0 unzip

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && \
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /workspace/miniconda3 && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH="/workspace/miniconda3/bin:${PATH}"

RUN conda init bash

RUN conda create -n wonder3d python=3.8 && echo "source activate wonder3d" > ~/.bashrc
ENV PATH /workspace/miniconda3/envs/wonder3d/bin:$PATH

COPY . /workspace/Wonder3D
WORKDIR /workspace/Wonder3D

RUN pip install -r docker/requirements.txt

RUN pip install nerfacc==0.3.3 -f https://nerfacc-bucket.s3.us-west-2.amazonaws.com/whl/torch-1.13.0_cu117.html

# Install tiny-cuda-nn inside the running container if needed:
# pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
