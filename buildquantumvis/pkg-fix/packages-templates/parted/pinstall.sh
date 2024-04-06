#!/bin/sh
#20240406

LIBPARTED="$(find usr/lib -maxdepth 1 -type f -name 'libparted.so.*' | head -n 1)"
if [ "$LIBPARTED" ];then
 BASELIBPARTED="`basename $LIBPARTED`"
 DIRLIBPARTED="`dirname $LIBPARTED`"
 ln -snf $BASELIBPARTED ${DIRLIBPARTED}/libparted-1.8.so.6
 ln -snf $BASELIBPARTED ${DIRLIBPARTED}/libparted-1.8.so.8
 ln -snf $BASELIBPARTED ${DIRLIBPARTED}/libparted-1.8.so.9
 ln -snf $BASELIBPARTED usr/lib/libparted.so.2
fi
