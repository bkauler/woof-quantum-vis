#!/bin/sh

#20240324 if coreutils is updated in a running qv, FIXUPHACK is ignored
#but pinstall.sh will run, after install.
#FIXUPHACK caused 'mount' to not install.

if [ "$(pwd)" == "/" ];then
 #in running qv, not woofqv.
 LANG=C file /usr/bin/mount | grep -q 'ELF'
 if [ $? -eq 0 ];then
  rm -f /usr/bin/mount
  ln -s mount.sh /usr/bin/mount
 fi
fi
