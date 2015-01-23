# A fairly loaded IPython
# docker build -t ptimof/ipython-extras .

FROM ptimof/scipystack

MAINTAINER Peter Timofejew <peter@timofejew.com>

# MPI for IPython
RUN apt-get update \
 && apt-get build-dep -y mpi4py \
 && pip2 install mpi4py \
 && pip3 install mpi4py \
 && apt-get autoremove -y \
 && apt-get clean -y

# Interesting libraries for Python
RUN pip2 install scikit-image vincent dill networkx \
 && pip3 install scikit-image vincent dill networkx 

# Install R
RUN apt-get install -y r-base r-base-dev r-cran-rcurl libreadline-dev \
 && pip2 install rpy2 \
 && pip3 install rpy2 \
 && echo 'options(repos=structure(c(CRAN="http://cran.rstudio.com")))' >> /etc/R/Rprofile.site \
 && echo "install.packages(c('ggplot2', 'XML', 'plyr', 'randomForest', 'Hmisc', 'stringr', 'RColorBrewer', 'reshape', 'reshape2'))" | R --no-save \
 && echo "install.packages(c('RCurl', 'devtools'))" | R --no-save \
 && echo "library(devtools); install_github('rgbkrk/rzmq', ref='c++11'); install_github('takluyver/IRdisplay'); install_github('takluyver/IRkernel'); IRkernel::installspec()" | R --no-save \
 && apt-get autoremove -y \
 && apt-get clean -y

# Install Julia
RUN apt-get install -y software-properties-common python-software-properties \
 && add-apt-repository ppa:staticfloat/juliareleases \
 && add-apt-repository ppa:staticfloat/julia-deps \
 && apt-get update \
 && apt-get install -y julia libnettle4 \
 && julia -e 'Pkg.add("IJulia")' \
 && julia -e 'Pkg.add("Gadfly")' \
 && julia -e 'Pkg.add("RDatasets")' \
 && (cd /root/.julia/v0.3 && rm .cache && ln -s ../.cache . && cd /root && tar zcf /usr/local/share/julia-cache.tar.gz .julia) \
 && rm -r /root/.julia \
 && apt-get autoremove -y \
 && apt-get clean -y

# Expose the kernels
ADD kernels/ /usr/local/share/jupyter/kernels/

# QuantLib (with Python, PyQL, and R bindings)
RUN apt-get install -y libquantlib0 libquantlib0-dev quantlib-examples quantlib-refman-html quantlib-python r-cran-rquantlib \
 && pip2 install tabulate \
 && pip3 install tabulate \
 && pip2 install git+https://github.com/enthought/pyql.git \
 && apt-get autoremove -y \
 && apt-get clean -y

# Goodies for IPython
RUN pip2 install terminado \
 && pip3 install terminado

# Database Python libraries
RUN apt-get install -y libpq-dev \
 && pip2 install pymongo redis psycopg2 cloudant \
 && pip3 install pymongo redis psycopg2 cloudant \
 && apt-get autoremove -y \
 && apt-get clean -y

# Goodies for Python
RUN apt-get install -y libsamplerate0 libsamplerate0-dev \
 && pip2 install scikits.samplerate librosa \
 && pip3 install scikits.samplerate librosa
