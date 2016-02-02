# Start with the CUDA image from nvidia
FROM continuumio/anaconda:latest
MAINTAINER Chris Watkins <christopher.watkins@me.com>

# Update debian repo keys
RUN apt-get install -y \
    debian-keyring \
    debian-archive-keyring && \
    apt-key update

# Install necessary ubuntu applications
RUN apt-get update && apt-get install -y \
    build-essential \
    libx11-dev \
    wget \
    git

# Install conda packages
RUN conda install -y openblas

# Download and install neon
RUN git clone https://github.com/inJeans/docker-neon.git && \
    conda env create -f docker-neon/neon.yaml && \
    source activate neon && \
    git clone https://github.com/NervanaSystems/neon.git && \
    cd neon && \
    python setup.py develop && \
    source deactivate