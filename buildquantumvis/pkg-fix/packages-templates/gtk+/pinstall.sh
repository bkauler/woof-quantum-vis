#!/bin/sh

#140128 quirky tahr, .so files now all in devx, but bacon needs some...
#welcome1stboot needs libgtk-x11-2.0.so
ln -s libgtk-x11-2.0.so.0 usr/lib/libgtk-x11-2.0.so

#...warning, bacon may need more .so's

#171217 oe pyro
[ -d usr/share/gtk-2.0/demo ] && rm -rf usr/share/gtk-2.0/demo
