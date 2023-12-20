Docker
================================================================

.. code-block:: sh

    IMAGE_NAME=sameriksen/xlzd
    IMAGE_TAG=centos9

    docker build --no-cache=true \
        --network=host \
        -t $IMAGE_NAME:$IMAGE_TAG \
        .

docker build --no-cache=true --network=host -t $IMAGE_NAME:$IMAGE_TAG .

xorg-x11-apps.x86_64 \
    xauth \
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
    doxygen \
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
    freetype-devel \
    qt6-qtbase \
    qt6-qtbase-devel \
    hdf5 \
    hdf5-devel


setup software
~~~~~~~~~~~~~~

.. code-block:: sh

    ::