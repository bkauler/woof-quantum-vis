#!/bin/sh

#for the old so.0 libs...
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libcrypto.so.0*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libcrypto.so.0
 ln -snf $LIBNAME ${LIBPATH}/libcrypto.so.0.9.7
 ln -snf $LIBNAME ${LIBPATH}/libcrypto.so.0.9.8
fi

LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libssl.so.0*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libssl.so.0
 ln -snf $LIBNAME ${LIBPATH}/libssl.so.0.9.7
 ln -snf $LIBNAME ${LIBPATH}/libssl.so.0.9.8
fi

#for the new so.1 libs...
LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libcrypto.so.1*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libcrypto.so.1
 #141120 if old lib hasn't been found above, create symlinks to 1.0 lib...
 #(assuming old 0. pkg isn't installed)
 ln -s libcrypto.so.1 ${LIBPATH}/libcrypto.so.0 2>/dev/null
 ln -s libcrypto.so.1 ${LIBPATH}/libcrypto.so.0.9.7 2>/dev/null
 ln -s libcrypto.so.1 ${LIBPATH}/libcrypto.so.0.9.8 2>/dev/null
 #170427 yocto pyro...
 LIBLINK="$(find usr/lib -maxdepth 1 -name libcrypto.so.1.0.0)"
 [ ! "$LIBLINK" ] && ln -s libcrypto.so.1 ${LIBPATH}/libcrypto.so.1.0.0
fi

LIBSPEC="$(find usr/lib -maxdepth 1 -type f -name 'libssl.so.1*' | head -n 1)"
if [ "$LIBSPEC" ];then
 LIBPATH="$(dirname $LIBSPEC)"
 LIBNAME="$(basename $LIBSPEC)"
 ln -snf $LIBNAME ${LIBPATH}/libssl.so.1
 ln -s libssl.so.1 ${LIBPATH}/libssl.so.0 2>/dev/null
 ln -s libssl.so.1 ${LIBPATH}/libssl.so.0.9.7 2>/dev/null
 ln -s libssl.so.1 ${LIBPATH}/libssl.so.0.9.8 2>/dev/null
 #170427 yocto pyro...
 LIBLINK="$(find usr/lib -maxdepth 1 -name libssl.so.1.0.0)"
 [ ! "$LIBLINK" ] && ln -s libssl.so.1 ${LIBPATH}/libssl.so.1.0.0
fi
