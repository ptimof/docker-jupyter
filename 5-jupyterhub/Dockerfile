# JupyterHub Docker image built from specific commit on master GitHub branch
# docker build -t ptimof/jupyterhub .

FROM ptimof/ipython

MAINTAINER Peter Timofejew <peter@timofejew.com>

# install js dependencies
RUN npm install -g bower less
RUN npm install -g jupyter/configurable-http-proxy

RUN mkdir -p /srv/

WORKDIR /srv/

# Set commit number (Jan 9, 2015)
ENV JUPYTERHUB_COMMIT f994ecdacb09d038ebee75019bc07ed49133c2e5

RUN git clone https://github.com/jupyter/jupyterhub.git
WORKDIR /srv/jupyterhub/
RUN git checkout $JUPYTERHUB_COMMIT
RUN pip3 install .

EXPOSE 8000

# Install dockerspawner and oauthenticator
RUN pip3 install docker-py

# dockerspawner commit number (Jan 8, 2015)
ENV DOCKERSPAWNER_COMMIT a0aefa192e7ad7e5650a38545af4aa9042839d3a
# oauthenticator commit number (Nov 25, 2014)
ENV OAUTHENTICATOR_COMMIT 98837269f6ca0f5ba9b638c0d3f5b48fd392a9ff

RUN pip3 install git+https://github.com/jupyter/dockerspawner.git@$DOCKERSPAWNER_COMMIT
RUN pip3 install git+https://github.com/jupyter/oauthenticator.git@$OAUTHENTICATOR_COMMIT

# Add variable to allow connecting to the docker host
ENV DOCKER_HOST unix://docker.sock

ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
