<!-- Links -->
[scipy-notebook]: https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook
[csdms-workbench]: https://csdms.colorado.edu/wiki/Workbench

# jupyterhub-docker

A Docker image for a JupyterHub
based on the [scipy-notebook][scipy-notebook] image
with [CSDMS Workbench][csdms-workbench] software
(Landlab, Basic Model Interface, Data Components) pre-installed.

## Build an image

Build an image locally with:
```sh
docker build --tag csdms/jupyterhub .
```
The OS is Linux/Ubuntu.
`conda` and `mamba`, as well as CSDMS Workbench software, are installed in `CONDA_DIR=/opt/conda`.
The *base* environment is activated.

## Run a container

Run a container from this image:
```sh
docker run -p 8888:8888 csdms/jupyterhub
```
This starts a JupyterHub.
Visiting `http://<hostname>:8888/?token=<token>` in a browser loads JupyterLab, where:

* `hostname` is the name of the computer running Docker
* `token` is the secret token printed in the console
