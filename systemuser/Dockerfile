# Run with the DockerSpawner in JupyterHub
# docker build -t ptimof/systemuser .

FROM ptimof/ipython

MAINTAINER Peter Timofejew <peter@timofejew.com>

# fetch jupyterhub-singleuser entrypoint
ADD https://raw.githubusercontent.com/jupyter/jupyterhub/master/jupyterhub/singleuser.py /usr/local/bin/jupyterhub-singleuser
RUN chmod 755 /usr/local/bin/jupyterhub-singleuser

EXPOSE 8888

ENV SHELL /bin/bash

ADD systemuser.sh /srv/singleuser/systemuser.sh
CMD ["sh", "/srv/singleuser/systemuser.sh"]
