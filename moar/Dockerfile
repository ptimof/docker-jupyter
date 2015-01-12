# Extra goodies for Jupyter
# Build as ptimof/jupyter-moar

FROM ptimof/jupyter-pyql

MAINTAINER Peter Timofejew <peter@timofejew.com>

# Audio processing
RUN apt-get install -y libsamplerate0 libsamplerate0-dev \
 && pip2 install scikits.samplerate librosa \
 && pip3 install scikits.samplerate librosa
