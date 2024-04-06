#!/bin/sh
#20240406 ported from FIXUPHACK

LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcre.so.0*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libpcre.so.0
fi
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcre.so.1*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 LIBLINK="$(find . -name libpcre.so.0)"
 ln -snf $LIBNAME ${LIBPATH}/libpcre.so.1
 [ ! -e ${LIBPATH}/libpcre.so.0 ] && ln -s libpcre.so.1 ${LIBPATH}/libpcre.so.0
fi
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcre.so.2*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libpcre.so.2
 [ ! -e ${LIBPATH}/libpcre.so.0 ] && ln -s libpcre.so.2 ${LIBPATH}/libpcre.so.0
 [ ! -e ${LIBPATH}/libpcre.so.1 ] && ln -s libpcre.so.2 ${LIBPATH}/libpcre.so.1
fi
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcre.so.3*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libpcre.so.3
 [ ! -e ${LIBPATH}/libpcre.so.0 ] && ln -s libpcre.so.3 ${LIBPATH}/libpcre.so.0
 [ ! -e ${LIBPATH}/libpcre.so.1 ] && ln -s libpcre.so.3 ${LIBPATH}/libpcre.so.1
 [ ! -e ${LIBPATH}/libpcre.so.2 ] && ln -s libpcre.so.3 ${LIBPATH}/libpcre.so.2
fi

LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcreposix.so.0*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libpcreposix.so.0
fi
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcreposix.so.1*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libpcreposix.so.1
 [ ! -e ${LIBPATH}/libpcreposix.so.0 ] && ln -s libpcreposix.so.1 ${LIBPATH}/libpcreposix.so.0
fi
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcreposix.so.2*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libpcreposix.so.2
 [ ! -e ${LIBPATH}/libpcreposix.so.0 ] && ln -s libpcreposix.so.2 ${LIBPATH}/libpcreposix.so.0
 [ ! -e ${LIBPATH}/libpcreposix.so.1 ] && ln -s libpcreposix.so.2 ${LIBPATH}/libpcreposix.so.1
fi
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libpcreposix.so.3*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libpcreposix.so.3
 [ ! -e ${LIBPATH}/libpcreposix.so.0 ] && ln -s libpcreposix.so.3 ${LIBPATH}/libpcreposix.so.0
 [ ! -e ${LIBPATH}/libpcreposix.so.1 ] && ln -s libpcreposix.so.3 ${LIBPATH}/libpcreposix.so.1
 [ ! -e ${LIBPATH}/libpcreposix.so.2 ] && ln -s libpcreposix.so.3 ${LIBPATH}/libpcreposix.so.2
fi
