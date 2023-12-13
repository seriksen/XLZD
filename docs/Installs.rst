Installs
----------------------------------------------------------------

The follow are what are installed for Fedora 38 (running on WSL2).

Pre (some are optional)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This block is largely taken from a older docker project I had
for opticks.
It is likely that not all of these are required.

.. code-block:: sh

    sudo yum install -y xorg-x11-apps.x86_64 \
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
    boost-devel



These are from the Geant4 guide (optional largely)

.. code-block:: sh

    perl-English
    expat-devel \
    libcurl-devel \
    zlib-devel \
    mesa-libGL-devel


More complex installs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These are from the Geant4 guide (optional largely)

.. code-block:: sh

    export OPTICKS_EXTERNALS=/home/seriksen/software

    clhep_version=2.4.7.1
    url=http://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/clhep-${clhep_version}.tgz
    dir=${OPTICKS_EXTERNALS}/clhep
    mkdir -p $dir
cd $dir
    curl -L -O $url
    tar zxf $(basename $url)
    mkdir clhep_${clhep_version}-build
    cd clhep_${clhep_version}-build
    cmake -DCMAKE_INSTALL_PREFIX=${dir}/clhep_${clhep_version}-install ../${clhep_version}/CLHEP
    make -j 10
    sudo make install


    xerces_version=3.2.4
    url=http://archive.apache.org/dist/xerces/c/3/sources/xerces-c-${xerces_version}.tar.gz
    dir=${OPTICKS_EXTERNALS}/xerces
    mkdir -p $dir
    cd $dir
    curl -L -O $url
    tar zxf $(basename $url)
    cd xerces-c-${xerces_version}
    ./configure --prefix=${dir}/xerces-c-${xerces_version}-install
    sudo make install


Other optionals
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: sh
    sudo dnf install -y qt5-qtbase qt5-qtbase-devel
    sudo dnf install freetype freetype-devel
    sudo dnf install qt6-qtbase qt6-qtbase-devel
    sudo dnf install hdf5 hdf5-devel


Geant4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: sh

    export OPTICKS_EXTERNALS=/home/seriksen/software

    g4_version=11.2.0
    dir=${OPTICKS_EXTERNALS}/g4
    mkdir -p ${dir}
    cd ${dir}
    url=https://gitlab.cern.ch/geant4/geant4/-/archive/v${g4_version}/geant4-v${g4_version}.tar.gz
    curl -L -O $url
    tar zxf geant4-v${g4_version}.tar.gz
    mkdir geant4-v${g4_version}-build
    cd geant4-v${g4_version}-build
    cmake -G "Unix Makefiles" \
          -DCMAKE_BUILD_TYPE=Debug \
          -DGEANT4_INSTALL_DATA=ON \
          -DGEANT4_USE_GDML=ON \
          -DGEANT4_USE_SYSTEM_CLHEP=ON \
          -DCLHEP_ROOT_DIR=${OPTICKS_EXTERNALS}/clhep/clhep_${clhep_version}-install \
          -DGEANT4_INSTALL_DATA_TIMEOUT=3000 \
          -DXERCESC_ROOT_DIR=${OPTICKS_EXTERNALS}/xerces/xerces-c-${xerces_version}-install \
          -DCMAKE_INSTALL_PREFIX=${dir}/geant4-v${g4_version}-install \
          ${dir}/geant4-v${g4_version}
    make -j 10
    make install








