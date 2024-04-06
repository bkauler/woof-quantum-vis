#!/bin/sh

LIBDVDNAV="`find usr/lib -maxdepth 1 -type f -name 'libdvdnav.so.*' | head -n 1`"
if [ "$LIBDVDNAV" ];then
 BASELIBDVDNAV="`basename $LIBDVDNAV`"
 ln -snf $BASELIBDVDNAV usr/lib/libdvdnav.so.3
 ln -snf $BASELIBDVDNAV usr/lib/libdvdnav.so.4
fi
