#################################################
# Ubuntu 22.04 image with NVIDIA CUDA and cuDNN #
#################################################

FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04 AS base
SHELL [ "/bin/bash", "-c"]

#################################################
# Set arguments #
#################################################
ARG DEBIAN_FRONTEND=noninteractive
ARG USER_UID
ARG USER_GID
# ARG USERNAME
ARG HOME_DIR

#####################################################
# Install basic apt packages like cmake python wget #
#####################################################
RUN apt-get update && apt-get install -y --no-install-recommends \
 git libcanberra-gtk-module libcanberra-gtk3-module libqt5svg5-dev \
 python3-pip python3-opencv python3-tk python3-pyqt5.qtwebengine \
 cmake mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev \
 libglew-dev libglfw3-dev libglm-dev \
 libao-dev libmpg123-dev \
 libpcl-dev \
 xauth \
 unzip \
 wget \
 && rm -rf /var/lib/apt/lists/*

#################################################
# Install additional Python modules #
#################################################
RUN pip3 install matplotlib transforms3d

#################################################
# Install pytorch with cuda 11.8 support #
#################################################
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Create workspace
RUN mkdir -p /gpu_tutorial_ws/src
WORKDIR /gpu_tutorial_ws/src

# Run update
WORKDIR /gpu_tutorial_ws
RUN apt update -y

# Remove display warnings
RUN mkdir /tmp/runtime-root
ENV XDG_RUNTIME_DIR "/tmp/runtime-root"
RUN chmod -R 0700 /tmp/runtime-root
ENV NO_AT_BRIDGE 1

# Set code as working directory
WORKDIR /gpu_tutorial_ws