#!/bin/sh

mkdir -p etc/profile.d
mkdir -p usr/share/pkgconfig
mkdir -p usr/lib/pkgconfig
echo "PKG_CONFIG_PATH='/usr/share/pkgconfig:/usr/lib/pkgconfig'
export PKG_CONFIG_PATH" > etc/profile.d/pkgconfig
