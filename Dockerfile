FROM --platform=linux/amd64 ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH=/opt/miniconda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y apt-utils wget bzip2 ca-certificates curl git binutils vim make unzip gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/miniconda && \
    rm ~/miniconda.sh && \
    ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# Use python 3.11, install mamba, update conda base
RUN conda install --yes -c conda-forge python=3.11; sync \
    && conda install --yes mamba -n base -c conda-forge; sync

# add requirements file create env and activate environment when container is run
ADD requirements.txt /test/requirements.txt
RUN conda create --name arcsi --file /test/requirements.txt --channel conda-forge python=3.11 \
    && chmod +x /opt/miniconda/bin/*; sync \
    && conda clean --all -y; sync

RUN echo "conda activate arcsi" >> ~/.bashrc