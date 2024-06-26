#!/bin/sh

FNDKONICAEN="$(find usr/share/libgphoto2 -mindepth 2 -maxdepth 3 -type f -name 'english' | head -n 1)"
if [ "$FNDKONICAEN" ];then
 DIRKONICA="$(dirname $FNDKONICAEN)"
 mv -f ${DIRKONICA}/english /tmp/english-konica
 rm -f usr/share/libgphoto2/*/konica/*
 mv -f /tmp/english-konica ${DIRKONICA}/english
fi

if [ ! -e usr/lib/libgphoto2.so.2 ];then
 FNDLIBGPHOT="$(find usr/lib -mindepth 1 -maxdepth 1 -type f -name 'libgphoto2.so.*' | head -n 1)"
 if [ "$FNDLIBGPHOT" ];then
  BASELIBGPHOT="$(basename $FNDLIBGPHOT)"
  ln -snf $BASELIBGPHOT usr/lib/libgphoto2.so.2 2>/dev/null
  ln -snf $BASELIBGPHOT usr/lib/libgphoto2.so.6 2>/dev/null
 fi
fi
if [ ! -e usr/lib/libgphoto2_port.so.0 ];then
 FNDLIBGPHOT="$(find usr/lib -mindepth 1 -maxdepth 1 -type f -name 'libgphoto2_port.so.*' | head -n 1)"
 if [ "$FNDLIBGPHOT" ];then
  BASELIBGPHOT="$(basename $FNDLIBGPHOT)"
  ln -snf $BASELIBGPHOT usr/lib/libgphoto2_port.so.0 2>/dev/null
  ln -snf $BASELIBGPHOT usr/lib/libgphoto2_port.so.12 2>/dev/null
 fi
fi
