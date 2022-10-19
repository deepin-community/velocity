#!/bin/sh -e

VERSION=$2
TAR=../velocity_$VERSION.orig.tar.gz
DIR=velocity-$VERSION
TAG=$2

svn export http://svn.apache.org/repos/asf/velocity/engine/tags/$TAG $DIR
tar -c -z -f $TAR --exclude 'ivy*.jar' $DIR
rm -rf $DIR ../$TAG

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
