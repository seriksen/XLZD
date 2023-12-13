FROM quay.io/centos/centos:stream9

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

# Standard software_installs.sh
RUN sudo dnf install -y git



# Virtual GL and TurboVNC and Desktop for remote dev with graphics support
RUN sudo dnf -y install https://downloads.sourceforge.net/project/virtualgl/2.6.3/VirtualGL-2.6.3.x86_64.rpm \
                        lightgdm \
                        https://downloads.sourceforge.net/project/turbovnc/2.2.4/turbovnc-2.2.4.x86_64.rpm

RUN sudo dnf -y groupinstall "X Window System" \
                             "Xfce"

# Install Geant4 and some other bits
COPY software_installs.sh /home/${DOCKER_USER}
RUN cd /home/${DOCKER_USER} \
    && export SOFTWARE_INSTALL_DIR=/home/${DOCKER_USER}/software \
    && bash software_install.sh

# Add .bashrc options for easier life
COPY bashrc_edits.sh /home/${DOCKER_USER}/.bashrc_edits.sh
RUN cd && echo "source ${HOME}/.bashrc_edits.sh" >> .bashrc