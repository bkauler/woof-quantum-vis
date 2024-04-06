#!/bin/sh

if [ ! -e usr/lib/libxvidcore.so.4 ];then
 FNDXVIDLIB="`find usr/lib -maxdepth 1 -type f -name 'libxvidcore.so.*' | tail -n 1`"
 if [ "$FNDXVIDLIB" ];then
  BASEXVIDLIB="`basename $FNDXVIDLIB`"
  ln -snf $BASEXVIDLIB usr/lib/libxvidcore.so.4
  ln -snf $BASEXVIDLIB usr/lib/libxvidcore.so
 fi
else
 ln -snf libxvidcore.so.4 usr/lib/libxvidcore.so
fi
