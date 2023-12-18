FROM rockylinux:9.3

LABEL authors="Sam Eriksen"

# Setup
RUN dnf -y update
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
RUN sudo dnf install -y     xauth \
                            pciutils \
                            lshw \
                            epel-release \
                            wget \
                            zip \
                            unzip \
                            git \
                            libXcursor-devel \
                            libXinerama-devel \
                            libXrandr-devel \
                            mesa-dri-drivers \
                            mesa-libGLES \
                            mesa-libGLw \
                            mesa-libGLw-devel \
                            freeglut-devel \
                            freeglut \
                            libXmu-devel \
                            libXi-devel \
                            libGL-devel \
                            libGLU-devel \
                            curl-devel \
                            openssl-devel \
                            g++ \
                            gcc-c++ \
                            cmake \
                            boost-devel \
                            qt5-qtbase \
                            qt5-qtbase-devel \
                            freetype \
                            freetype-devel
                            #doxygen \
                            #qt6-qtbase
                            #qt6-qtbase-devel \
                            #hdf5 \
                            #hdf5-devel



# Virtual GL and TurboVNC and Desktop for remote dev with graphics support
RUN sudo dnf -y install https://downloads.sourceforge.net/project/virtualgl/2.6.3/VirtualGL-2.6.3.x86_64.rpm \
                        https://downloads.sourceforge.net/project/turbovnc/2.2.4/turbovnc-2.2.4.x86_64.rpm


# Add .bashrc options for easier life
COPY bashrc_edits.sh /home/${DOCKER_USER}/.bashrc_edits.sh
RUN cd && echo "source ${HOME}/.bashrc_edits.sh" >> .bashrc

# Volumes from CVMFS
VOLUME ["/cvmfs/sft.cern.ch"]

# Final
ENTRYPOINT ["/docker-entrypoint.sh"]
