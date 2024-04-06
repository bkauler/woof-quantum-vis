#!/bin/sh
#20240406

F1="$(find usr/bin -type f -name 'python3.[0-9][0-9]' | head -n 1)"
if [ "$F1" ];then
 if [ ! -e usr/bin/python ];then
  ln -s ${F1##*/} usr/bin/python
 fi
 if [ ! -e usr/bin/python3 ];then
  ln -s ${F1##*/} usr/bin/python3
 fi
fi

if [ -d usr/lib/${F1##*/} ];then
 if [ ! -d usr/lib/python3 ];then
  ln -s ${F1##*/} usr/lib/python3
 fi
fi
