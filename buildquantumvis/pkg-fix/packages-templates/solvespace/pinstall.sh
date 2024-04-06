#!/bin/sh

if [ -f usr/bin/solvespace-cli ];then
 rm -f usr/bin/solvespace-cli
fi

if [ ! -e usr/share/pixmaps/solvespace.png ];then
 ln -s ../icons/hicolor/48x48/apps/solvespace.png usr/share/pixmaps/solvespace.png
fi
