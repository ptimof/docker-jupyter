# docker-jupyter

Docker containers for [Jupyter](http://jupyter.org).

# Building

	docker build -t ptimof/jupyterhub hub
	docker build -t ptimof/jupyter-base ipython
	docker build -t ptimof/jupyter-systemuser

Alternatively, you may wish to pull these images from Docker Hub, as `jupyter-base`
will take quite some time to build, as [QuantLib](http://quantlib.org) is built from
source.

	docker pull ptimof/jupyterhub
	docker pull ptimof/jupyter-systemuser

# Setup

If a GitHub application has not yet been created, it can be created
[here](https://github.com/settings/applications/new). Make sure the
callback URL is:

        http://[your_host:8000]/hub/oauth_callback

For example, `example.com:8000`.

Create a file `env` in a directory that contains the details from
the GitHub application:

        GITHUB_CLIENT_ID=<client_id>
        GITHUB_CLIENT_SECRET=<client_secret>
        OAUTH_CALLBACK_URL=http://[your_host:8000]/hub/oauth_callback

Ensure that this file is only readable by `root`:

        chmod 0440 /usr/local/etc/jupyterhub/env

# Running

	docker run -d -p 8000:8000 -v /var/run/docker.sock:/docker.sock -v /etc/passwd:/srv/jupyterhub/userlist --env-file /usr/local/etc/jupyterhub.env --net=host ptimof/jupyterhub

# Debugging

* If a browser ends up stuck re-directing when attempting to use a server, it probably means that the 
user container needs to be removed. Have the user log out of JupyterHub, and Execute `docker rm jupyter-[user]`.
