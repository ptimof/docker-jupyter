# A fairly loaded IPython for use as a JupyterHub systemuser container
# Build as ptimof/jupyter-pyql

FROM ptimof/jupyter-base

MAINTAINER Peter Timofejew <peter@timofejew.com>

# Install PyQL
RUN apt-get install -y wget libboost-all-dev \
 && wget -q https://github.com/lballabio/quantlib/archive/QuantLib-v1.4.1.tar.gz \
 && tar zxf QuantLib-v1.4.1.tar.gz \
 && (cd quantlib-QuantLib-v1.4.1/QuantLib && ./autogen.sh && ./configure && make && make install && ldconfig) \
 && rm -rf QuantLib-v1.4.1.tar.gz quantlib-QuantLib-v1.4.1 \
 && pip2 install git+https://github.com/enthought/pyql.git
