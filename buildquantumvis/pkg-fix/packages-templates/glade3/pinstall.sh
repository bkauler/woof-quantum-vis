#!/bin/sh

#120410 added, but not sure if we need this...
if [ ! -e usr/share/pixmaps/glade-3.png ];then
 if [ -f usr/share/icons/hicolor/48x48/apps/glade-3.png ];then
  mkdir -p usr/share/pixmaps
  ln -s ../icons/hicolor/48x48/apps/glade-3.png usr/share/pixmaps/glade-3.png
 fi
fi

