#!/bin/sh
#20240406

#T2 pkg has both pci.ids and pci.ids.gz...
if [ -f ./usr/share/pci.ids.gz ];then
 if [ -f ./usr/share/pci.ids ];then
  rm -f ./usr/share/pci.ids.gz
 else #20211001
  cd usr/share
  gunzip pci.ids.gz
  cd ../../
 fi
fi

if [ -f usr/share/pci.ids ];then #20211001
 if [ ! -e usr/share/misc/pci.ids ];then
  mkdir -p usr/share/misc
  ln -s ../pci.ids usr/share/misc/pci.ids
 fi
fi
