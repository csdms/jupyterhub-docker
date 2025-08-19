# Set up a JupyterHub that includes CSDMS Workbench software + PyVista.
FROM csdms/jupyterhub:0.2.0

LABEL org.opencontainers.image.authors="Mark Piper <mark.piper@colorado.edu>"
LABEL org.opencontainers.image.source="https://github.com/csdms/jupyterhub-docker"
LABEL org.opencontainers.image.vendor="CSDMS"

USER root
RUN apt-get update -y && \
    apt-get install -y \
        libgl1-mesa-dev \
        xvfb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER ${NB_UID}

COPY --chown=${NB_UID}:${NB_GID} requirements.in /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.in

# Landlab+pyvista notebooks
RUN git clone --depth 1 https://github.com/gregtucker/landlab-pyvista-tools-examples && \
    pip install --no-cache-dir ./landlab-pyvista-tools-examples

# See https://github.com/pyvista/pyvista/blob/main/docker/jupyter.Dockerfile
ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/proxy/'

WORKDIR "${HOME}"

# See https://github.com/kramergroup/jupyter-pyvista
COPY start_xvfb.sh /sbin/start_xvfb.sh
ENTRYPOINT ["tini", "-g", "--", "start_xvfb.sh"]
CMD ["start-notebook.py"]
