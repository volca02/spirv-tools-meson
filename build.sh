#!/bin/sh

set -e

# cd to the dir of the script
OUTDIR=$PWD
SCRDIR=`dirname $0`
cd $SCRDIR

if [ ! -d external/spirv-headers ]; then
    git clone https://github.com/KhronosGroup/SPIRV-Headers.git external/spirv-headers
fi

# TODO: Decide to build 64 or 32bit based on arg

mkdir -p build64
cd build64
CC="/usr/bin/x86_64-w64-mingw32-gcc" CXX="/usr/bin/x86_64-w64-mingw32-g++" cmake -G Ninja -DCMAKE_SYSTEM_NAME="Windows" -DCMAKE_FIND_ROOT_PATH=/usr/x86_64-w64-mingw32/ -DSPIRV_BUILD_COMPRESSION=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$OUTDIR/install -DSPIRV_SKIP_TESTS=ON -DRE2_BUILD_TESTING=OFF ..
ninja
ninja install
cd ..

#mkdir -p build32
#cd build32
#CC="/usr/bin/i686-w64-mingw32-gcc" CXX="/usr/bin/i686-w64-mingw32-g++" cmake -G Ninja -DCMAKE_SYSTEM_NAME="Windows" -DCMAKE_FIND_ROOT_PATH=/usr/i686-w64-mingw32/ -DSPIRV_BUILD_COMPRESSION=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$OUTDIR/install -DSPIRV_SKIP_TESTS=ON -DRE2_BUILD_TESTING=OFF ..
#ninja
#ninja install
#cd ..