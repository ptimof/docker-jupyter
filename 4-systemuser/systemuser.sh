#!/bin/sh

# create user in new container
echo "Creating user $USER ($USER_ID)"
useradd -u $USER_ID -o -s $SHELL $USER

# patch up Julia kernel file to point to user's install
sed -i "s/jovyan/$USER/" /usr/local/share/jupyter/kernels/julia/kernel.json

# install cached Julia modules
if [ ! -d $HOME/.julia ]; then
	sudo -E -u $USER tar zxf /usr/local/share/julia-cache.tar.gz
fi

# make a Notebooks directory in the user's host home if it doesn't exist already
sudo -E -u $USER mkdir -p $HOME/Notebooks

# add examples
if [ ! -d $HOME/Notebooks/.setup ]; then
	sudo -E -u $USER touch $HOME/Notebooks/.setup
	sudo -E -u $USER cp -rp /srv/ipython/examples $HOME/Notebooks/Examples
	#sudo -E -u $USER find $HOME/Notebooks/Examples -name '*.ipynb' -exec ipython trust {} \;
fi

exec sudo -E -u $USER jupyterhub-singleuser \
  --port=8888 \
  --ip=0.0.0.0 \
  --user=$JPY_USER \
  --cookie-name=$JPY_COOKIE_NAME \
  --base-url=$JPY_BASE_URL \
  --hub-prefix=$JPY_HUB_PREFIX \
  --hub-api-url=$JPY_HUB_API_URL
