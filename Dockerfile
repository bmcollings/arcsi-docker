FROM --platform=linux/amd64 ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH=/opt/miniforge/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y apt-utils wget bzip2 ca-certificates curl git binutils vim make unzip gcc parallel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://github.com/conda-forge/miniforge/releases/download/24.3.0-0/Miniforge3-Linux-x86_64.sh -O ~/Miniforge3.sh && \
    /bin/bash ~/Miniforge3.sh -b -p /opt/miniforge && \
    rm ~/Miniforge3.sh && \
    ln -s /opt/miniforge/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/miniforge/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# Use python 3.11, install mamba, update conda base
# RUN conda install --yes -c conda-forge python=3.11; sync \
#     && conda install --yes mamba -n base -c conda-forge; sync

# add requirements file create env and activate environment when container is run
ADD requirements.txt /req/requirements.txt
RUN conda create --name arcsi --file /req/requirements.txt --channel conda-forge python=3.11 \
    && chmod +x /opt/miniforge/bin/*; sync \
    && conda clean --all -y; sync

RUN echo "conda activate arcsi" >> ~/.bashrc