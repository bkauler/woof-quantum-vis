#!/bin/sh

LIBEXIST="`find usr/lib -maxdepth 1 -name 'libical.so.*' 2>/dev/null | head -n 1`"
if [ "$LIBEXIST" ];then
 BASEEXIST="`basename $LIBEXIST`"
 ln -snf $BASEEXIST usr/lib/libical.so.3
 ln -snf $BASEEXIST usr/lib/libical.so.0
fi

LIBEXIST="`find usr/lib -maxdepth 1 -name 'libicalss.so.*' 2>/dev/null | head -n 1`"
if [ "$LIBEXIST" ];then
 BASEEXIST="`basename $LIBEXIST`"
 ln -snf $BASEEXIST usr/lib/libicalss.so.3
 ln -snf $BASEEXIST usr/lib/libicalss.so.0
fi
