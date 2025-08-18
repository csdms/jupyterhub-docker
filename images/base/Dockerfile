# Set up a JupyterHub that includes all CSDMS Workbench software.
FROM quay.io/jupyter/scipy-notebook:python-3.12.11

LABEL maintainer="CSDMS <csdms@colorado.edu>"
LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

RUN apt-get update --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm -rf "/home/${NB_USER}/.cache/"

# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}

COPY --chown=${NB_UID}:${NB_GID} requirements.in /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.in

# Get the Landlab repo for the notebooks.
RUN git clone --depth 1 --branch v2.10.1 https://github.com/landlab/landlab && \
    rm -rf ./landlab/.git

# Import matplotlib the first time to build the font cache
RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

RUN rm -rf "/home/${NB_USER}/.cache/"

USER ${NB_UID}

WORKDIR "${HOME}"
