# Set up a JupyterHub that includes all CSDMS Workbench software.
FROM quay.io/jupyter/scipy-notebook:python-3.13.5

LABEL maintainer="CSDMS <csdms@colorado.edu>"
LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

USER root
RUN apt-get update --yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER ${NB_UID}

COPY --chown=${NB_UID}:${NB_GID} requirements.in /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.in

# Get the Landlab repo for the notebooks.
RUN git clone --depth 1 --branch v2.10.1 https://github.com/landlab/landlab && \
    rm -rf ./landlab/.git

WORKDIR "${HOME}"
