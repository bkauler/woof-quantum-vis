#!/bin/sh

#20240406 these are actually in pkgs libreadline8 and libhistory8
for aLR in `find usr/lib -mindepth 1 -maxdepth 1 -type f -name 'libreadline.so.*' | head -n 1 | tr '\n' ' '`
do
 ln -snf ${aLR##*/} usr/lib/libreadline.so.5
 ln -snf ${aLR##*/} usr/lib/libreadline.so.6
 ln -snf ${aLR##*/} usr/lib/libreadline.so.7
 ln -snf ${aLR##*/} usr/lib/libreadline.so.8
done
for aLR in `find usr/lib -mindepth 1 -maxdepth 1 -type f -name 'libhistory.so.*' | head -n 1 | tr '\n' ' '`
do
 ln -snf ${aLR##*/} usr/lib/libhistory.so.5
 ln -snf ${aLR##*/} usr/lib/libhistory.so.6
 ln -snf ${aLR##*/} usr/lib/libhistory.so.7
 ln -snf ${aLR##*/} usr/lib/libhistory.so.8
done

