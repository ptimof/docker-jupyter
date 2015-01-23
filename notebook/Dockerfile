# A fairly loaded IPython Notebook server
# docker build -t ptimof/notebook .

FROM ptimof/ipython-extras

MAINTAINER Peter Timofejew <peter@timofejew.com>

# Add Notebook shell
ADD notebook.sh /srv/singleuser/notebook.sh

# create jovyan user
ENV SHELL /bin/bash
RUN useradd -m -d /notebooks -s $SHELL jovyan

VOLUME /notebooks
WORKDIR /notebooks

# TLS stuff
ENV PEM_FILE /key.pem
ENV PASSWORD Dont make this your default
ENV USE_HTTP 0

EXPOSE 8888

CMD ["bash", "/srv/singleuser/notebook.sh"]
