# docker-jupyter

Docker containers for [Jupyter](http://jupyter.org). For a standalone, single user Notebook app, see
[ptimof/notebook](https://github.com/ptimof/docker-jupyter/tree/master/notebook).

# Building

	docker build -t ptimof/ipython ipython
	docker build -t ptimof/jupyterhub jupyterhub
	docker build -t ptimof/scipystack scipystack
	docker build -t ptimof/ipython-extras ipython-extras
	docker build -t ptimof/systemuser systemuser

Alternatively, you may wish to pull these images from Docker Hub:

	docker pull ptimof/jupyterhub
	docker pull ptimof/systemuser

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

	docker run -d -p 8000:8000 -v /var/run/docker.sock:/docker.sock -v /etc/passwd:/srv/jupyterhub/userlist --env-file /usr/local/etc/jupyter/env --net=host --name jupyterhub ptimof/jupyterhub

# Debugging

* If a browser ends up stuck re-directing when attempting to use a server, it probably means that the 
user container needs to be removed. Have the user log out of JupyterHub, and Execute `docker rm jupyter-[user]`.
