export SOFTWARE_INSTALL_DIR=/home/seriksen/software

clhep_version=2.4.7.1
url=http://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/clhep-${clhep_version}.tgz
dir=${SOFTWARE_INSTALL_DIR}/clhep
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
dir=${SOFTWARE_INSTALL_DIR}/xerces
mkdir -p $dir
cd $dir
curl -L -O $url
tar zxf $(basename $url)
cd xerces-c-${xerces_version}
./configure --prefix=${dir}/xerces-c-${xerces_version}-install
sudo make install


g4_version=11.2.0
dir=${SOFTWARE_INSTALL_DIR}/g4
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
      -DCLHEP_ROOT_DIR=${SOFTWARE_INSTALL_DIR}/clhep/clhep_${clhep_version}-install \
      -DGEANT4_INSTALL_DATA_TIMEOUT=3000 \
      -DXERCESC_ROOT_DIR=${SOFTWARE_INSTALL_DIR}/xerces/xerces-c-${xerces_version}-install \
      -DCMAKE_INSTALL_PREFIX=${dir}/geant4-v${g4_version}-install \
      ${dir}/geant4-v${g4_version}
make -j 10
make install
