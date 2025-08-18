# Set up a JupyterHub that includes all CSDMS Workbench software.
FROM quay.io/jupyter/scipy-notebook:python-3.13.5

LABEL org.opencontainers.image.authors="Mark Piper <mark.piper@colorado.edu>"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/csdms/jupyterhub"
LABEL org.opencontainers.image.source="https://github.com/csdms/jupyterhub-docker"
LABEL org.opencontainers.image.vendor="CSDMS"

USER root
RUN apt-get update --yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER ${NB_UID}

# GDAL pip install failed on arm64. Use a conda binary instead.
RUN mamba install -y gdal && \
    mamba clean --all -f -y

COPY --chown=${NB_UID}:${NB_GID} requirements.in /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.in

# Get the Landlab repo for the notebooks.
RUN git clone --depth 1 --branch v2.10.1 https://github.com/landlab/landlab && \
    rm -rf ./landlab/.git

WORKDIR "${HOME}"
