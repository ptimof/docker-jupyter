# JupyterHub Docker image
# Build as ptimof/jupyterhub

FROM jupyter/jupyterhub

MAINTAINER Peter Timofejew <peter@timofejew.com>

# Install dockerspawner and oauthenticator
RUN pip3 install docker-py
RUN pip3 install git+git://github.com/jupyter/dockerspawner.git
RUN pip3 install git+git://github.com/jupyter/oauthenticator.git

# Add variable to allow connecting to the docker host
ENV DOCKER_HOST unix://docker.sock
