# Set up a JupyterHub that includes CSDMS Workbench software + PyVista.
FROM csdms/jupyterhub:0.2.0

LABEL org.opencontainers.image.authors="Mark Piper <mark.piper@colorado.edu>"
LABEL org.opencontainers.image.source="https://github.com/csdms/jupyterhub-docker"
LABEL org.opencontainers.image.vendor="CSDMS"

USER root
RUN apt-get update -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER ${NB_UID}

COPY --chown=${NB_UID}:${NB_GID} requirements.in /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.in

# See https://github.com/pyvista/pyvista/discussions/5597#discussioncomment-8419210
RUN pip uninstall vtk -y
RUN pip install --no-cache-dir --extra-index-url https://wheels.vtk.org vtk-osmesa

# Landlab+pyvista notebooks
RUN git clone --depth 1 https://github.com/gregtucker/landlab-pyvista-tools-examples && \
    pip install --no-cache-dir ./landlab-pyvista-tools-examples

# See https://github.com/pyvista/pyvista/blob/main/docker/jupyter.Dockerfile
ENV JUPYTER_ENABLE_LAB=yes
ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/proxy/'

WORKDIR "${HOME}"
