#!/bin/sh

# creates a package with a specified name as a zip in the zip directory

mkdir -p zip

if [ "x$1" == "x" ]; then
    echo "Need a release/directory name i.e. 'SPIRV-Tools-2018.0'"
    exit 1
fi

PKG_NAME=$1

cd zip
mkdir $PKG_NAME
cp ../build.sh $PKG_NAME
cp ../meson.build $PKG_NAME

zip -r $PKG_NAME-wrap.zip $PKG_NAME

rm $PKG_NAME/build.sh
rm $PKG_NAME/meson.build
rmdir $PKG_NAME