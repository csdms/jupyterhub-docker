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

## What is the CSDMS Workbench?

The CSDMS Workbench is the integrated system of software tools, technologies, and standards developed by CSDMS for building, interfacing, coupling, and running models.
Learn more at https://csdms.colorado.edu/wiki/Workbench.

## Acknowledgment

This work is supported by the U.S. National Science Foundation under Award No. [2104102](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2104102), *Collaborative Research: Frameworks: OpenEarthscape - Transformative Cyberinfrastructure for Modeling and Simulation in the Earth-Surface Science Communities*.
