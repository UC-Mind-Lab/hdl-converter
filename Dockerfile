# Specify Base OS
FROM        ubuntu:19.10 AS base

# Install some base software
RUN     apt-get -yqq update && \
        apt-get install -yq --no-install-recommends ca-certificates expat libgomp1 && \
        apt-get autoremove -y && \
        apt-get clean -y

# Install required tools
RUN \
   buildDeps="g++ \
              gcc \
              git \
              make \
              python3-pip \
              python3" && \
  apt-get -yqq update && \
  apt-get install -yq --no-install-recommends ${buildDeps}

# Set up python modules
RUN \
   pipDeps="ipython \
            numpy \
            scipy" && \
  pip3 install -U pip && \
  pip3 install ${pipDeps}

# Credit where blame is due
MAINTAINER  Tyler Westland <westlatr@mail.uc.edu>

# Allows easy start into the command line for this image.
CMD         ["/bin/bash"]

