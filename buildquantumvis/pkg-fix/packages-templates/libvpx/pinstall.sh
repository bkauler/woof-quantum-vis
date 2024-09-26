#!/bin/sh
#150808 180513 190728

REALLIB="`find usr/lib -maxdepth 1 -type f -name 'libvpx.so.*' | tail -n 1`"
if [ "$REALLIB" ];then
 BASELIB="$(basename $REALLIB)"
 PATHLIB="$(dirname $REALLIB)"
 ln -snf ${BASELIB} ${PATHLIB}/libvpx.so.1
 ln -snf ${BASELIB} ${PATHLIB}/libvpx.so.2
 ln -snf ${BASELIB} ${PATHLIB}/libvpx.so.3
 ln -snf ${BASELIB} ${PATHLIB}/libvpx.so.4
 ln -snf ${BASELIB} ${PATHLIB}/libvpx.so.7 #kirkstone
 ln -snf ${BASELIB} ${PATHLIB}/libvpx.so.9 #scarthgap
fi
