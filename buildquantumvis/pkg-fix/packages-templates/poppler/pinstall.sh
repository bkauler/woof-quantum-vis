#!/bin/sh
#20240406 ported from FIXUPHACK

# 7MB in here, delete it...
[ -d usr/share/poppler ] && rm -rf usr/share/poppler/*

REALLIB="`find usr -maxdepth 3 -type f -name 'libpoppler-glib.so.*' | tail -n 1`"
if [ "$REALLIB" ];then
 BASELIB="$(basename $REALLIB)"
 PATHLIB="$(dirname $REALLIB)"
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler-glib.so.4
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler-glib.so.5
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler-glib.so.6
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler-glib.so.7
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler-glib.so.8
fi

REALLIB="`find usr -maxdepth 3 -type f -name 'libpoppler.so.*' | tail -n 1`"
if [ "$REALLIB" ];then
 BASELIB="$(basename $REALLIB)"
 PATHLIB="$(dirname $REALLIB)"
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.5
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.7
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.43
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.44
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.46
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.48
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.67
 ln -snf ${BASELIB} ${PATHLIB}/libpoppler.so.120
fi
