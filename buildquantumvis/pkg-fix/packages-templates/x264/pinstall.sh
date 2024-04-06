#!/bin/sh

#to support apps compiled for older x264...
FNDLIB="`find usr/lib -maxdepth 1 -type f -name 'libx264.so.*' | tail -n 1`"
if [ "$FNDLIB" ];then
 BASELIB="`basename $FNDLIB`"
 BASENUM="`echo -n "$BASELIB" | rev | cut -f 1 -d '.' | rev`" #ex: libx264.so.115 becomes 115
 ln -snf $BASELIB usr/lib/libx264.so.116
 ln -snf $BASELIB usr/lib/libx264.so.105
 ln -snf $BASELIB usr/lib/libx264.so.94
 ln -snf $BASELIB usr/lib/libx264.so.98
 ln -snf $BASELIB usr/lib/libx264.so.163
fi
