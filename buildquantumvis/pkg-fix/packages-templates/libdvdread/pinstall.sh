#!/bin/sh

LIBDVDREAD="`find usr/lib -maxdepth 1 -type f -name 'libdvdread.so.*' 2>/dev/null | head -n 1`"
if [ "$LIBDVDREAD" ];then
 BASELIBDVDREAD="`basename $LIBDVDREAD`"
 ln -snf $BASELIBDVDREAD usr/lib/libdvdread.so.3
 ln -snf $BASELIBDVDREAD usr/lib/libdvdread.so.8
fi
