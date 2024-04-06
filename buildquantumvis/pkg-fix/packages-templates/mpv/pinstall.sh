#!/bin/sh
#20240406

mkdir -p usr/share/pixmaps
if [ -f usr/share/icons/hicolor/48x48/apps/mpv.png ];then
 ln -snf  ../icons/hicolor/48x48/apps/mpv.png usr/share/pixmaps/mpv.png
fi

#20210610 default conf files. ref: https://wiki.archlinux.org/title/mpv#Configuration
mkdir -p etc/mpv
if [ -d usr/share/doc/mpv ];then
 cp -a -f usr/share/doc/mpv/*.conf etc/mpv/ 2>/dev/null
fi
echo '' >> etc/mpv/mpv.conf
echo 'sub-auto=fuzzy' >> etc/mpv/mpv.conf
echo 'sub-bold=yes' >> etc/mpv/mpv.conf
