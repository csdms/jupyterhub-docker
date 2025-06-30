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

## Developer notes

A versioned, multiplatform image built from this repository is hosted on Docker Hub
at [csdms/jupyterhub](https://hub.docker.com/repository/docker/csdms/jupyterhub/).
This image is automatically built and pushed to Docker Hub
with the [release](./.github/workflows/release.yml) CI workflow.
The workflow is only run when the repository is tagged.
To manually build and push an update, run:
```
docker buildx build --platform linux/amd64,linux/arm64 -t csdms/jupyterhub:latest --push .
```
A user can pull this image from Docker Hub with:
```
docker pull csdms/jupyterhub
```
optionally with the `latest` tag or with a version tag.

## What is the CSDMS Workbench?

The CSDMS Workbench is the integrated system of software tools, technologies, and standards developed by CSDMS for building, interfacing, coupling, and running models.
Learn more at https://csdms.colorado.edu/wiki/Workbench.

## Acknowledgment

This work is supported by the U.S. National Science Foundation under Award No. [2104102](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2104102), *Collaborative Research: Frameworks: OpenEarthscape - Transformative Cyberinfrastructure for Modeling and Simulation in the Earth-Surface Science Communities*.
