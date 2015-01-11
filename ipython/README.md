# ptimof/jupyter-base

Base [Jupyter](http://jupyter.org) Docker image. See [GitHub repo](https://github.com/ptimof/docker-jupyter)
for usage instructions.

## Contents

This image is contains the [SciPy Stack](http://www.scipy.org/stackspec.html), as well as the following
additional goodies:

* [MPI for Python](http://mpi4py.scipy.org)
* [scikit-image](http://scikit-image.org)
* [Vincent](http://vincent.readthedocs.org/en/latest/)
* [Dill](https://pypi.python.org/pypi/dill)
* [NetworkX](http://networkx.github.io)
* [PyQL](https://github.com/enthought/pyql)
* [R](http://www.r-project.org) kernel
* [Julia](http://julialang.org) kernel
* Redis, MongoDB and PostgreSQL Python support

*Note*: [QuantLib](http://quantlib.org) will take significant time to build. It may be best
to pull [ptimof/jupyter-base](https://registry.hub.docker.com/u/ptimof/jupyter-base/) from Docker,
rather than build from this `Dockerfile`.
