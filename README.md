# Dockerfile for OpenBabel with Python bindings 

Dockerfile for a miminal Debian based image containing Open Babel and it's Python bindings.

For more on Open Babel look [here](http://openbabel.org/)

## Branches and tags

| Branch | OBabel version | Docker tags   |
|--------|----------------|---------------|
| master | 3.0.0          | latest        |
| 3.1.1  | 3.1.1          | 3.1.1         |
| 3.0.0  | 3.0.0          | 3.0.0         |
| 2.4.1  | 2.4.1          | 2.4.1         |
| 2.3.2  | 2.3.2          | 2.3.2         |


The versions for the master branch and the latest Docker tag will change over time. Those for specific versions should not change.

The builds for 3.0.0 currently contain the build infrastructure (gcc, cmake etc.) so are quite large.
We'll hopefully improve this soon.

