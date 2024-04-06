#!/bin/sh

#140118 ubuntu trusty tahr needs this for older pkgs... 190728
HUNLIB="`find usr -type f -name 'libhunspell-1*so.*' | head -n 1`" #150726
if [ "$HUNLIB" ];then
 HUNPATH="`dirname $HUNLIB`"
 HUNBASE="`basename $HUNLIB`"
 ln -snf $HUNBASE ${HUNPATH}/libhunspell-1.2.so.0
 ln -snf $HUNBASE ${HUNPATH}/libhunspell-1.3.so.0
 ln -snf $HUNBASE ${HUNPATH}/libhunspell-1.6.so.0
 ln -snf $HUNBASE ${HUNPATH}/libhunspell-1.7.so.0
fi
