FROM rockylinux:9.3

LABEL authors="Sam Eriksen"

# Setup
RUN dnf update -y \
 && dnf install dnf-plugins-core -y \
 && dnf config-manager --enable crb \
 && dnf install -y epel-release \
 && dnf clean all

RUN dnf -y install sudo

# Set bash
SHELL ["/bin/bash", "-c"]

# Set user
ARG user=xlzd_user
ENV DOCKER_USER="${user}"
RUN useradd -ms /bin/bash --groups wheel ${DOCKER_USER}
RUN echo "${DOCKER_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $DOCKER_USER
WORKDIR /home/${DOCKER_USER}

RUN sudo dnf group install "Development Tools" -y
RUN sudo dnf makecache --refresh


# Standard software_installs.sh
RUN sudo dnf install -y \
      atlas-devel \
      autoconf \
      automake \
      blas-devel \
      bluez-libs-devel \
      bzip2 \
      bzip2-devel \
      emacs \
      expat-devel \
      gcc-c++ \
      gdbm-devel \
      ghostscript \
      git \
      glibc-devel \
      gmp-devel \
      graphviz \
      ImageMagick \
      jq \
      json-c \
      libdb-devel \
      libffi-devel \
      libtool \
      libunwind-devel \
      libuuid-devel \
      libXmu-devel \
      libXpm-devel \
      make \
      man \
      mesa-libGLU-devel \
      nano \
      ncurses-devel \
      openmotif-devel \
      openssl-devel \
      patch \
      perl-Digest-MD5 \
      platform-python-devel \
      qt5-qtbase-devel \
      qt5-qtscript-devel \
      readline-devel \
      sqlite-devel \
      sudo \
      systemtap-sdt-devel \
      tcl-devel \
      tix-devel \
      tk-devel \
      valgrind-devel \
      vim-X11 \
      vim-common \
      vim-enhanced \
      vim-minimal \
      wget \
      which \
      zlib-devel \
  && sudo dnf clean all \
  && sudo rm -rf /var/cache/dnf/*

# Virtual GL and TurboVNC and Desktop for remote dev with graphics support
RUN sudo dnf -y install https://downloads.sourceforge.net/project/virtualgl/2.6.3/VirtualGL-2.6.3.x86_64.rpm \
                        https://downloads.sourceforge.net/project/turbovnc/2.2.4/turbovnc-2.2.4.x86_64.rpm


# Add .bashrc options for easier life
COPY bashrc_edits.sh /home/${DOCKER_USER}/.bashrc_edits.sh
RUN cd && echo "source ${HOME}/.bashrc_edits.sh" >> .bashrc

ENV DISPLAY=:0

